import 'package:flutter/material.dart';
import 'dart:convert';

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
      home: MyHomePage(title: 'Json Dosya Okuma'),
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

  List data;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.cyanAccent,
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString("assets/data.json"),
            builder: (context, snapshot) {

              var mydata = jsonDecode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index)
                {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Name: " + mydata["example_data"][index]["name"]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Age: " + mydata["example_data"][index]["age"]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Zodiac Sign: " + mydata["example_data"][index]["zodiac sign"]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Book: " + mydata["example_data"][index]["book"]),
                              ),


                            ],
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Name: " + mydata["example_data"][index+1]["name"]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Age: " + mydata["example_data"][index+1]["age"]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Zodiac Sign: " + mydata["example_data"][index+1]["zodiac sign"]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Book: " + mydata["example_data"][index+1]["book"]),
                              ),


                            ],
                          ),
                        ),
                      ),


                    ],
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      )

       );
  }
}
