import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:snapping_sheet_example/shared/app_bar.dart';
import 'package:snapping_sheet_example/shared/default_grabbing.dart';
import 'package:snapping_sheet_example/shared/dummy_background.dart';
import 'package:snapping_sheet_example/shared/dummy_content.dart';

class AbovePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DarkAppBar(title: "Snapping Sheet - Above").build(context),
      body: SnappingSheet(
        lockOverflowDrag: true,
        snappingPositions: [
          SnappingPosition.factor(
            grabbingContentOffset: GrabbingContentOffset.bottom,
            positionFactor: 1.0,
          ),
          SnappingPosition.factor(
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 1750),
            positionFactor: 0.5,
          ),
          SnappingPosition.factor(
            positionFactor: 0.1,
            grabbingContentOffset: GrabbingContentOffset.top,
          ),
        ],
        child: DummyBackgroundContent(),
        grabbingHeight: 75,
        grabbing: DefaultGrabbing(
          reverse: true,
        ),
        sheetAbove: SnappingSheetContent(
          childScrollController: _scrollController,
          draggable: true,
          child: DummyContent(
            reverse: true,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }
}
