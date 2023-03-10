import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halalbee/pages/login.dart';

// Defining Home as Stateful Widget
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// setting it's state
class _HomeState extends State<Home> {
  //Controller for expandable widget of preferences
  final ExpandableController _pref = ExpandableController();
  @override
  Widget build(BuildContext context) {
    // setting pref expandable to ture
    _pref.value = true;
    // Scaffold Start
    return Scaffold(
      // SingleChildScrollView to prevent overflow when keyboard and anything opens on-screen
      body: SingleChildScrollView(
        child: Column(
          children: [
            // getting background i.e. the logo
            Image.asset('assets/images/bg.jpg'),
            const Padding(padding: EdgeInsets.all(8)),
            //TODO: add location logo at end of search bar
            // location search box
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  labelText: 'Enter your location',
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            // preference collapsable widget
            // base widget is card
            // child widget is Expandable
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
              child: Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                    borderRadius:BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4,12,4,12),
                  child: ExpandablePanel(
                    controller: _pref,
                    header: const Text("   Halal Preferences"),
                    collapsed: const Text(""),
                    expanded: Column(
                      children: [
                        // first yes/no option
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              "Are you alright with eating at premises that serve pork?"),
                        ),
                        ToggleButtons(
                          isSelected: const [true, false],
                          onPressed: (int index) {
                            //TODO: code the part where btton press is recorded and effects the future states
                            print('Button pressed $index');
                          },
                          children: const <Widget>[
                            Text('Yes'),
                            Text('No'),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4),
                        ),
                        // second yes/no option
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              "Are you alright with eating at premises that serve alcohol?"),
                        ),
                        ToggleButtons(
                          isSelected: const [true, false],
                          onPressed: (int index) {
                            //TODO: code the part where btton press is recorded and effects the future states
                            print('Button pressed $index');
                          },
                          children: const <Widget>[
                            Text('Yes'),
                            Text('No'),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                        ),
                        //TODO: ADD CHECkBOX FOR "SAVE PREFERENCES"
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(30)),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                        child: Text(
                            "All restaurants will serve at least one dish with hala-certified meat/seafood/vegetarian options")),
                    ElevatedButton(
                      onPressed: () {
                        //TODO: Add search code and redirect to next page
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Login()), (route) => false);
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent,foregroundColor: Colors.black),
                      child: const Padding(padding:EdgeInsets.fromLTRB(20,4,20,4),child:Text("Find halal food near me")),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
