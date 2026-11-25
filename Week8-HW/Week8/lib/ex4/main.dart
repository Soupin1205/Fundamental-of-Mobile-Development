import 'package:flutter/material.dart';
import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: const FavoriteJokeList(),
      ),
    ));

class FavoriteJokeList extends StatefulWidget {
  const FavoriteJokeList({
    super.key,
  });

  @override
  State<FavoriteJokeList> createState() => _FavoriteJokeListState();
}

class _FavoriteJokeListState extends State<FavoriteJokeList> {
  int? favoriteindex;

  void onFavoriteClick(int index) {
    setState(() {
      if (favoriteindex == index ){
        favoriteindex = null;
      } else {
        favoriteindex = index;
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) {
        return FavoriteCard(
          title: jokes[index].title,
          description: jokes[index].description,
          isFavorite: favoriteindex == index,
          onFavoriteClick: () => onFavoriteClick(index,)
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
