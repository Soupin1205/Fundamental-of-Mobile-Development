import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardSate();
}

class _FavoriteCardSate extends State<FavoriteCard> {
  bool isFavorite = false;
  Icon getFavoriteIcon(){
    if (isFavorite){
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.favorite_border,
        color: Colors.grey,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(color: Colors.blue, fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(widget.description),
              ],
            ),
          ),
          IconButton(onPressed: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          }, 
          icon: getFavoriteIcon(),
          )
        ],

      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: const [
            // YOUR CODE
            FavoriteCard(
              title: "Flutter", 
              description: "Mobile development"
            ),
            FavoriteCard(
              title: "Flutter", 
              description: "Mobile development"
            ),
            FavoriteCard(
              title: "Flutter", 
              description: "Mobile development"
            ),
          ],
      ),
    ),
  ),
);
