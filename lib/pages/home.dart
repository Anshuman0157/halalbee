import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/bg.jpg'),
          const Padding(padding: EdgeInsets.all(8)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,4,20,4),
            child:TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                labelText: 'Enter your location',
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,4,20,4),
            child: ExpandablePanel(
              header: const Text("Halal Preferences"),
              collapsed: const Text(""),
              expanded: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Are you alright with eating at premises that serve pork?"),
                  ),
                  ToggleButtons(
                    isSelected: [true, false],
                    onPressed: (int index) {
                      //TODO: code the part where btton press is recorded and effects the future states
                      print('Button pressed $index');
                    },
                    children: const <Widget>[
                      Text('Yes'),
                      Text('No'),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(4),),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Are you alright with eating at premises that serve alcohol?"),
                  ),
                  ToggleButtons(
                    isSelected: [true, false],
                    onPressed: (int index) {
                      //TODO: code the part where btton press is recorded and effects the future states
                      print('Button pressed $index');
                    },
                    children: const <Widget>[
                      Text('Yes'),
                      Text('No'),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(8),),
                  //TODO: ADD CHECBOX FOR "SAVE PREFERENCES"

                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(12,4,12,4),
                    child: Text("All restaurents will serve at least one dish with hala-certified meat/seafood/vegetarian options")
                ),
                ElevatedButton(onPressed: (){}, child: const Text("Find hala food near me")),
              ],

          ))
          
        ],
      ),
    );
  }
}
