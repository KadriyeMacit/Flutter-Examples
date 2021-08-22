import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../bottom_navigation_tab.dart';

class MaterialBottomNavigationScaffold extends StatefulWidget {
  const MaterialBottomNavigationScaffold({
    required this.navigationBarItems,
    required this.onItemSelected,
    required this.selectedIndex,
    Key? key,
  });

  final List<BottomNavigationTab> navigationBarItems;
  final ValueChanged<int> onItemSelected;

  final int selectedIndex;

  @override
  _MaterialBottomNavigationScaffoldState createState() =>
      _MaterialBottomNavigationScaffoldState();
}

class _MaterialBottomNavigationScaffoldState
    extends State<MaterialBottomNavigationScaffold>
    with TickerProviderStateMixin<MaterialBottomNavigationScaffold> {
  final List<_MaterialBottomNavigationTab> materialNavigationBarItems = [];
  final List<AnimationController> _animationControllers = [];

  final List<bool> _shouldBuildTab = <bool>[];

  @override
  void initState() {
    _initAnimationControllers();
    _initMaterialNavigationBarItems();

    _shouldBuildTab.addAll(List<bool>.filled(
      widget.navigationBarItems.length,
      false,
    ));

    super.initState();
  }

  void _initMaterialNavigationBarItems() {
    materialNavigationBarItems.addAll(
      widget.navigationBarItems
          .map(
            (barItem) => _MaterialBottomNavigationTab(
              bottomNavigationBarItem: barItem.bottomNavigationBarItem,
              navigatorKey: barItem.navigatorKey,
              subtreeKey: GlobalKey(),
              initialPageBuilder: barItem.initialPageBuilder,
            ),
          )
          .toList(),
    );
  }

  void _initAnimationControllers() {
    _animationControllers.addAll(
      widget.navigationBarItems.map<AnimationController>(
        (destination) => AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
      ),
    );

    if (_animationControllers.isNotEmpty) {
      _animationControllers[0].value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationControllers.forEach(
      (controller) => controller.dispose(),
    );

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: materialNavigationBarItems
              .map(
                (barItem) => _buildPageFlow(
                  context,
                  materialNavigationBarItems.indexOf(barItem),
                  barItem,
                ),
              )
              .toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          items: materialNavigationBarItems
              .map(
                (item) => item.bottomNavigationBarItem,
              )
              .toList(),
          onTap: widget.onItemSelected,
        ),
      );

  Widget _buildPageFlow(
    BuildContext context,
    int tabIndex,
    _MaterialBottomNavigationTab item,
  ) {
    final isCurrentlySelected = tabIndex == widget.selectedIndex;

    _shouldBuildTab[tabIndex] =
        isCurrentlySelected || _shouldBuildTab[tabIndex];

    final Widget view = FadeTransition(
      opacity: _animationControllers[tabIndex].drive(
        CurveTween(curve: Curves.fastOutSlowIn),
      ),
      child: KeyedSubtree(
        key: item.subtreeKey,
        child: _shouldBuildTab[tabIndex]
            ? Navigator(
                key: item.navigatorKey,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  settings: settings,
                  builder: item.initialPageBuilder,
                ),
              )
            : Container(),
      ),
    );

    if (tabIndex == widget.selectedIndex) {
      _animationControllers[tabIndex].forward();
      return view;
    } else {
      _animationControllers[tabIndex].reverse();
      if (_animationControllers[tabIndex].isAnimating) {
        return IgnorePointer(child: view);
      }
      return Offstage(child: view);
    }
  }
}

class _MaterialBottomNavigationTab extends BottomNavigationTab {
  const _MaterialBottomNavigationTab({
    required BottomNavigationBarItem bottomNavigationBarItem,
    required GlobalKey<NavigatorState> navigatorKey,
    required WidgetBuilder initialPageBuilder,
    required this.subtreeKey,
  }) : super(
          bottomNavigationBarItem: bottomNavigationBarItem,
          navigatorKey: navigatorKey,
          initialPageBuilder: initialPageBuilder,
        );

  final GlobalKey subtreeKey;
}
