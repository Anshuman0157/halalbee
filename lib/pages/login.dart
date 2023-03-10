
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halalbee/pages/home.dart';
import 'package:loader_overlay/loader_overlay.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _username = TextEditingController();
  final _password = TextEditingController();
  var _hidden = true;
  var _visible = true;


  @override
  void initState(){
    super.initState();
    if(FirebaseAuth.instance.currentUser == null){
      _visible = false;
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Home()), (route) => false);
    }

  }

  @override
  Widget build(BuildContext context) {
    if(_visible == true){
      context.loaderOverlay.show();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/bg.jpg'),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
              child: TextField(
                controller: _username,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  label: const Text('   Username'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _hidden = !_hidden;
                      });
                    },
                    icon: Icon(_hidden ? Icons.visibility : Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                  ),
                  label: const Text('   Password'),
                ),
                obscureText: _hidden,

              ),
            ),
            ElevatedButton(
                onPressed: (){
                  signin(context);
                  print(_username.text);
                }, child: const Text("Testing"))
          ],
        ),
      ),
    );
  }
  void signin(BuildContext context) {
    print("Username :- ${_username.text}");
    print("Password: ${_password.text}");
    try{
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _username.text.trim()+"@halalbee.com",
          password: _password.text.trim(),
      );
    } on FirebaseAuthException catch (e) {

      if (e.code == 'firebase_auth/user-not-found]') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      alert(context, "Error", "Check ");
      return;
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Home()), (route) => false);
  }

  void alert(BuildContext context, var title, var body) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title.toString()),
      content: Text(body.toString()),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
