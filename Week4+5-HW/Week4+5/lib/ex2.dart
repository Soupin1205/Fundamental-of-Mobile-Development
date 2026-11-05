import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        width: 200,
        height: 300,
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.all(12),
        color: Colors.blue[300],
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[600],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'CADT STUDENTS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}