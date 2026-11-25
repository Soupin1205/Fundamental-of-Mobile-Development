import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: HeaderSection(
          name: 'Angkor Wat',
          location: 'Siem Reap, Cambodia',
          likesAmount: 125,
        ),
      ),
    );
  }
}

class HeaderSection extends StatefulWidget {
  final String name;
  final String location;
  final int likesAmount;

  const HeaderSection({
    super.key,
    required this.name,
    required this.location,
    required this.likesAmount,
  });

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool isStarSelected = false;

  void _handleStarSelection() {
    setState(() {
      isStarSelected = !isStarSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
     return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name),
              Text(widget.location),
            ],
          ),
        ),
         IconButton(
              onPressed: _handleStarSelection,
              icon: Icon(isStarSelected ? Icons.star : Icons.star_border),
            ),
        Text('$widget.likesAmount likes'),
      ],
    );
  }
}

