import 'package:draggable_home_example/home/draggable.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Draggable Home"),
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      // ],
      headerWidget: headerWidget(context),
      //backgroundColor: Colors.white,
      stretchTriggerOffset: 900,
      curvedBodyRadius: 40,
      stretchMaxHeight: 0.93,
      bottomNavigationBarHeight: 9,
      // headerBottomBar: headerBottomBarWidget(),

      body: [
        listView(),
      ],
      fullyStretchable: true,
      expandedBody: Container(),
    );
  }

  Widget headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) => Center(
        child: Container(
          //color: Colors.white,
          child: Text(
            "Titlekkk",
            style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white70),
          ),
        ),
      );

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Titleyyyy"),
          subtitle: const Text("Subtitile"),
        ),
      ),
    );
  }
}
