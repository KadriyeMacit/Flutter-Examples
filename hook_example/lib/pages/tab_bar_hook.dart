import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TabbarHook extends HookWidget {
  const TabbarHook({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final myTabs = <Tab>[
      const Tab(child: Icon(Icons.star_border)),
      const Tab(child: Icon(Icons.favorite_border)),
    ];

    final tabController = useTabController(initialLength: myTabs.length);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: TabBar(
          tabs: myTabs,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: myTabs.map((tab) {
          return Center(
            child: tab.child,
          );
        }).toList(),
      ),
    );
  }
}
