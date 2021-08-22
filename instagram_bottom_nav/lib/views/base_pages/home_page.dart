import 'package:flutter/material.dart';
import 'package:instagram_bottom_nav/views/next_pages/color_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorPage())),
              child: Container(
                color: Colors.red.shade100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorPage())),
              child: Container(
                color: Colors.pink.shade100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ColorPage())),
              child: Container(
                color: Colors.teal.shade100,
                height: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue.shade100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.purple.shade100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.green.shade100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.yellow.shade100,
              height: 100,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey.shade100,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
