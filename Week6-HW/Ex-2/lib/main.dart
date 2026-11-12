
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ButtonPage(),
    ),
  );
}

enum ButtonType {
  primary,
  secondary,
  disabled,
}

enum IconPosition {
  left,
  right,
}

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFFFF8FF),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Text(
              'Custom buttons',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            CustomButton(
              label: 'Submit',
              icon: Icons.check,
              type: ButtonType.primary,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Time',
              icon: Icons.access_time,
              type: ButtonType.secondary,
              iconPosition: IconPosition.right,
            ),
            SizedBox(height: 15),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree,
              type: ButtonType.disabled,
              iconPosition: IconPosition.right,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;

    if (type == ButtonType.primary) {
      buttonColor = Colors.blue;
    } else if (type == ButtonType.secondary) {
      buttonColor = Colors.green;
    } else {
      buttonColor = Colors.grey.shade300;
    }

    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon, size: 16, color: Colors.blueGrey),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
            ),
          ),
          if (iconPosition == IconPosition.right) ...[
            const SizedBox(width: 8),
            Icon(icon, size: 16, color: Colors.blueGrey),
          ],
        ],
      ),
    );
  }
}
