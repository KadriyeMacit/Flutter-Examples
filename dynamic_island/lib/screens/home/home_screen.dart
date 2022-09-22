import 'package:dynamic_island/model/island_model.dart';
import 'package:dynamic_island/screens/widgets/call_expanded.dart';
import 'package:dynamic_island/screens/widgets/call_shrinked.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool shrinked = true;
  bool showIsland = true;
  static const animationDuration = Duration(milliseconds: 300);

  IslandModel island = IslandModel(
      shrinkedIsland: const CallShrinked(),
      expandedIsland: const CallExpanded(),
      expandedHeight: 75,
      expandedBorderRadius: 40);

  @override
  initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  void toggleIsland() {
    setState(() {
      showIsland = false;
      shrinked = !shrinked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final islandToBeShown =
        shrinked ? island.shrinkedIsland : island.expandedIsland;

    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Stack(
          children: [
            GestureDetector(
              onTap: (() => setState(() {
                    if (!shrinked) {
                      toggleIsland();
                    }
                  })),
              child: SizedBox(
                height: size.height,
                child: Image.asset(
                  "assets/images/background.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: toggleIsland,
                child: AnimatedContainer(
                  onEnd: () => setState(() {
                    showIsland = true;
                  }),
                  margin: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(
                        shrinked ? 20.0 : island.expandedBorderRadius),
                  ),
                  duration: animationDuration,
                  curve: Curves.easeInOut,
                  height: shrinked ? 35 : island.expandedHeight,
                  width: size.width * (shrinked ? .5 : .95),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: (shrinked ? 10.0 : 15.0), vertical: 5),
                    child: AnimatedSwitcher(
                      duration: animationDuration,
                      child: showIsland ? islandToBeShown : const SizedBox(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
