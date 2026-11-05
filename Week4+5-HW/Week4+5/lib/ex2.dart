import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        color: Colors.lightBlue,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: Text(
                    "CADT STUDENTS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        decoration: TextDecoration.none
                    )
                ),
            )
        ),
      ),
    ),
  );
}