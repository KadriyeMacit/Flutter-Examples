import 'package:flutter/material.dart';
import 'package:snapping_sheet_example/shared/app_bar.dart';
import 'package:snapping_sheet_example/views/below_page.dart';
import 'package:snapping_sheet_example/views/above_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DarkAppBar(title: "Snapping Sheet Example").build(context),
        body: Container(
          color: Colors.amber.shade200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    primary: Colors.purple,
                    onPrimary: Colors.white,
                  ),
                  child: Text("Below"),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BelowPage())),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  child: Text("Above"),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AbovePage())),
                ),
              ],
            ),
          ),
        ));
  }
}
