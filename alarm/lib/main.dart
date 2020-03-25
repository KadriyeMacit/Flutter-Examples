import 'package:flutter/material.dart';
import 'package:scheduled_notifications/scheduled_notifications.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
  }

  _bildirim() async {

    int notificationId = await ScheduledNotifications.scheduleNotification(
         DateTime.now().add( Duration(seconds: 5)).millisecondsSinceEpoch,
        "",
        "Hello World kanalında yeni video geldi!",
        "kahveni al ve uygulamaya başla! :)");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          title: Text('Bildirim Uygulaması'),
          backgroundColor: Colors.lime[600],
        ),
        body: Center(

            child: RaisedButton(

              color: Colors.deepOrange,
              onPressed: _bildirim,

              child: Text('Bildirim gönder'),
            )
        )
    );
  }
}