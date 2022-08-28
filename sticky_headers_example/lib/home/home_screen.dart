import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:sticky_headers_example/home/widgets/list_card.dart';
import 'package:sticky_headers_example/home/widgets/menu_card.dart';
import 'package:sticky_headers_example/home/widgets/search_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        bottom: false,
        child: ListView(
          controller: _scrollController,
          children: [
            const SearchCard(),
            StickyHeader(
                controller: _scrollController,
                header: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        MenuCard(text: "Italy", color: Colors.orangeAccent),
                        MenuCard(text: "Fransa", color: Colors.pinkAccent),
                      ],
                    ),
                  ),
                ),
                content: const ListCard()),
          ],
        ),
      ),
    );
  }
}
