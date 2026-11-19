import 'dart:math';

import 'package:flutter/material.dart';

const List<String> diceImages = [
  'asset/dice-5/dice-1.png', // Index 0
  'asset/dice-5/dice-2.png', // Index 1
  'asset/dice-5/dice-3.png', // Index 2
  'asset/dice-5/dice-4.png', // Index 3
  'asset/dice-5/dice-5.png', // Index 4
  'asset/dice-5/dice-6.png', // Index 5
];

String activeDiceImage = diceImages[0];

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  void rollDice() {
    int randomObjectIndex = Random().nextInt(diceImages.length);
    //  Display the dice 4 !
    setState(() {
      activeDiceImage = diceImages[randomObjectIndex];
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            int randomObjectIndex = Random().nextInt(diceImages.length);
            setState(() {
              activeDiceImage = diceImages[randomObjectIndex];
            });
          },
          onLongPress: () {
            setState(() {
              activeDiceImage = diceImages[0];
            });
          },
          child: Image.asset(activeDiceImage, width: 200),
        ),

        
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}

void main() => runApp(
  const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: DiceRoller()),
    ),
  ),
);