import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final IconData icon;
  final String text;

  CustomListTile({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue,),
          SizedBox(width: 15.0,),
          Text(
            "$text",
            style: TextStyle(
              fontSize: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
