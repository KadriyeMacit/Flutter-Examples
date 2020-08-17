import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

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
      home: MyHomePage(title: 'Zaman örneği'),
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

  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amber[100],
        child: Center(

          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                     // border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Date Time özelliklerine beraber bakalım!',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                RaisedButton(
                  color: Colors.cyan,
                  child: Text(
                      "Tarih ve saat bilgisi nedir?",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var tarihSaat = date.toString();

                    print(tarihSaat);  // prints something like 2019-12-10 10:02:22.287949

                    Fluttertoast.showToast(
                        msg: "$tarihSaat",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                  },
                ),

                RaisedButton(
                  color: Colors.pinkAccent,
                  child: Text(
                      "Hangi gün?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var gun = DateFormat('EEEE').format(date);

                    print(gun); // prints Tuesday

                    Fluttertoast.showToast(
                        msg: "$gun",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                ),

                RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                      "Tarih nedir?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var tarih = DateFormat('EEEE, d MMM, yyyy').format(date);
                    print(tarih); // prints Tuesday, 10 Dec, 2019

                    Fluttertoast.showToast(
                        msg: "$tarih",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                ),

                RaisedButton(
                  color: Colors.deepPurpleAccent,
                  child: Text(
                      "Saat kaç?",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: (){

                    var saat = DateFormat('h:mm a').format(date);

                    print(saat); // prints 10:02 AM

                    Fluttertoast.showToast(
                        msg: "$saat",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey[600],
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
