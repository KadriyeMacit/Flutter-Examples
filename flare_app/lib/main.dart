import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flare uygulaması'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[

         Image(height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
           image: AssetImage("resimler/sky.jpg"),),




                           Padding(
                             padding: const EdgeInsets.only(top:58.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Text("Hello World",
                                   style: TextStyle(
                                     fontFamily: "Poire",
                                       color: Colors.orange,
                                 fontSize: 54),
                                 ),
                               ],
                             ),
                           ),




                   FlareActor("animasyonlar/balon.flr",
                          animation: "balon_hareket"),






        ],
      ),
    );
  }
}
