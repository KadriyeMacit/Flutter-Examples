import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:snapping_sheet_example/shared/app_bar.dart';
import 'package:snapping_sheet_example/shared/default_grabbing.dart';
import 'package:snapping_sheet_example/shared/dummy_background.dart';
import 'package:snapping_sheet_example/shared/dummy_content.dart';

class BelowPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet - Below").build(context),
      body: SnappingSheet(
        lockOverflowDrag: true,
        snappingPositions: [
          SnappingPosition.factor(
            positionFactor: 0.0,
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
          SnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          SnappingPosition.factor(positionFactor: 0.9),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 75,
        grabbing: DefaultGrabbing(),
        sheetBelow: SnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
