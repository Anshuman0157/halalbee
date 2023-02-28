
import 'package:flutter/material.dart';

class ListingTile extends StatelessWidget {
  const ListingTile({Key? key}) : super(key: key);

  final String name = 'Test';
  final String subText = 'Subtext';
  final bool isAlcohol = true;
  final bool isPork = true;
  final String imageUrl = 'test URL';
  final String resId = '001';
  final String address = 'Test Address';


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Image.network(imageUrl),
          ),
          Column(
            children: [
              Padding(padding: const EdgeInsets.all(8),child: Text(name),)
            ],
          )
        ],
      ),
    );
  }
}
