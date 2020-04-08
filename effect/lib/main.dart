import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ripple Effect'),
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

  final String el1 = 'resimler/hands.svg';
  final String el2 = 'resimler/el2.svg';
  final String el3 = 'resimler/el3.svg';
  final String el4 = 'resimler/el4.svg';
  final String el5 = 'resimler/el5.svg';
  final String el6 = 'resimler/el6.svg';
  final String el7 = 'resimler/el7.svg';
  final String el8 = 'resimler/el8.svg';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan,
        title: Text(widget.title),
      ),

     body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: <Widget>[

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el1,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),



             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el2,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),
           ],
         ),


         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el3,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),

             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el4,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),
           ],
         ),



         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el5,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),

             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el6,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),
           ],
         ),


         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el7,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),

             Container(
               child: Center(
                 child: Material(
                   color: Colors.grey[400],
                   borderRadius: BorderRadius.circular(10),
                   child: InkWell(
                       onTap: () {},
                       borderRadius: BorderRadius.circular(10),
                       splashColor: Colors.blue,
                       child: SvgPicture.asset(
                         el8,
                         width: 100,
                         height: 100,
                       )
                   ),
                 ),
               ),
             ),
           ],
         ),
       ],
     ),

    );
  }
}
