import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
    padding: EdgeInsets.all(40),
    child: Column(
      children: [

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue[100],
          ),
          child: Center(
            child: Text(
              'OOP',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  decoration: TextDecoration.none),
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue[300],
          ),
          child: Center(
            child: Text(
              'DART',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  decoration: TextDecoration.none),
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade600
              ]
            )
          ),
          child: Center(
            child: Text(
              'FLUTTER',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  decoration: TextDecoration.none),
            ),
          ),
        )

      ],
    ),
  )));
}