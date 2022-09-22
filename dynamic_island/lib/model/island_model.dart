import 'package:flutter/material.dart';

class IslandModel {
  IslandModel({
    required this.shrinkedIsland,
    required this.expandedIsland,
    this.expandedHeight = 200,
    this.expandedBorderRadius = 20.0,
  });

  final Widget shrinkedIsland;
  final Widget expandedIsland;
  double expandedHeight;
  double expandedBorderRadius;
}
