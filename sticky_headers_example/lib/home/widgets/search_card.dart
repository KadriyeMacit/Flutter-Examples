import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search",
          ),
        ),
      ),
    );
  }
}
