import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 100),

              SizedBox(
                height: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blue[600],
                      ),
                    ),
                    Container(
                      width: 100,
                      color: Colors.blue[300],
                    ),
                  ],
                ),
              ),

              Container(
                height: 100,
                color: Colors.green,
              ),

              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: const Center(
                          child: Text('same'),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: const Center(
                          child: Text('same'),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Container(
                        color: Colors.yellow,
                        child: const Center(
                          child: Text('same'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}