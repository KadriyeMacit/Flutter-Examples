import 'package:esneklik/resim_veya_yazilar.dart';
import 'package:esneklik/row_esneklik.dart';
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

        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Taşma hatalarına son!'),
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
      appBar: AppBar(

        title: Text(widget.title),
      ),


      body:  SingleChildScrollView(
        child: Column(
            children: <Widget>[

              RaisedButton(
                onPressed: (){

                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RowPage()));
                },
                
                child: Text("Row için tıkla"),

                color: Colors.pinkAccent[200],
              ),


              RaisedButton(
                onPressed: (){

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ExpandedPage()));
                },

                child: Text("Resim veya yazılar için tıkla"),

                color: Colors.greenAccent,
              ),


              Text("Taşma hatalarında kullanılabilecek widgetlar: ",
              style: TextStyle(
                fontSize: 40
              ),),

              Text("Taşma hatalarında kullanılabilecek widgetlar: ",
                style: TextStyle(
                    fontSize: 40
                ),),

              Text("Taşma hatalarında kullanılabilecek widgetlar: ",
                style: TextStyle(
                    fontSize: 40
                ),),

              Text("Taşma hatalarında kullanılabilecek widgetlar: ",
                style: TextStyle(
                    fontSize: 40
                ),),

              Text("Taşma hatalarında kullanılabilecek widgetlar: ",
                style: TextStyle(
                    fontSize: 40
                ),),





            ],
          ),
      ),



    );
  }
}
