import 'package:flutter/material.dart';
import 'package:flutter_tabbar_example/controller/tabBar_controller.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  final tabBarController = Get.put(TabBarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Button Tabs (IOS Style)'),
        ),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          Container(
              height: 49.0,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: tabBarController.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: tabBarController.icons.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        key: tabBarController.keys[index],
                        padding: EdgeInsets.all(6.0),
                        child: ButtonTheme(
                            child: AnimatedBuilder(
                          animation: tabBarController.colorTweenBackgroundOn,
                          builder: (context, child) => FlatButton(
                              color: tabBarController.getBackgroundColor(index),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(7.0)),
                              onPressed: () {
                                setState(() {
                                  tabBarController.buttonTap = true;

                                  tabBarController.controller.animateTo(index);

                                  tabBarController.setCurrentIndex(index);

                                  tabBarController.scrollTo(index);
                                });
                              },
                              child: Text(
                                tabBarController.icons[index],
                                //color: tabBarController.getForegroundColor(index),
                              )),
                        )));
                  })),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21),
                  color: Colors.grey[100],
                  height: 2,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Flexible(
              child: TabBarView(
            controller: tabBarController.controller,
            children: <Widget>[
             Text('aa'),Text('bbb'),


            ],
          )),
        ])
    );
  }

  
}
