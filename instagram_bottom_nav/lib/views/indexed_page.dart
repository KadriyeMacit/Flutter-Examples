import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_bottom_nav/views/base_pages/home_page.dart';
import 'package:instagram_bottom_nav/views/base_pages/profile_page.dart';

class IndexedPage extends StatefulWidget {
  const IndexedPage({
    required this.index,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final int index;
  final Color backgroundColor;

  @override
  _IndexedPageState createState() => _IndexedPageState();
}

class _IndexedPageState extends State<IndexedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.backgroundColor,
        appBar: AppBar(
          title: Text(
            'Instagram Bottom Navigation Bar',
            maxLines: 1,
          ),
        ),
        body: Column(
          children: [
            widget.index == 1
                ? Expanded(child: HomePage())
                : widget.index == 2
                    ? Expanded(child: ProfilePage())
                    : Container()
          ],
        ));
  }
}
