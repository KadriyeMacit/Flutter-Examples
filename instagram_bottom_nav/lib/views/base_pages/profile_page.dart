import 'package:flutter/material.dart';
import 'package:instagram_bottom_nav/views/next_pages/text_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextPage())),
                  child: Text('Hello World')),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextPage())),
                  child: Text('Youtube')),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextPage())),
                  child: Text('Flutter')),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextPage())),
                  child: Text('Android')),
              SizedBox(
                height: 50,
              ),
              Text('IOS'),
              SizedBox(
                height: 50,
              ),
              Text('Web'),
              SizedBox(
                height: 50,
              ),
              Text('Desktop'),
              SizedBox(
                height: 50,
              ),
              Text('Cyber Security'),
              SizedBox(
                height: 50,
              ),
              Text('Mobile Apps'),
              SizedBox(
                height: 50,
              ),
              Text('Cross Platform'),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
