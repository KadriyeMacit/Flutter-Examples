import 'package:flutter/material.dart';
import 'package:scratcher/scratcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(

        appBar: AppBar(
          title: Text("Kazı Kazan Uygulaması",
            style: TextStyle(
                fontFamily: "The unseen",
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),
          ),
          backgroundColor: Colors.green,
        ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  SizedBox(height: 30,),

                  Text("Çizmeye başla!",
                    style: TextStyle(
                        fontFamily: "The unseen",
                      fontSize: 20
                    ),
                  ),

                  SizedBox(height: 10,),

                  Scratcher(
                    brushSize: 5,
                    color: Colors.purpleAccent[100],
                    onChange: (value) => print("Scratch progress: $value%"),
                    child: Container(
                      height: 200,
                      width: 300,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 30,),

                  Text("Şansını kazı!",
                  style: TextStyle(
                    fontFamily: "The unseen",
                    fontSize: 20
                  ),
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Scratcher(
                        brushSize: 5,
                        accuracy: ScratchAccuracy.low,
                        color: Colors.blueGrey,
                        image: Image.asset('assets/scratch.png'),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset("assets/car.png"),
                        ),
                      ),

                      Scratcher(
                        brushSize: 5,
                        accuracy: ScratchAccuracy.low,
                        color: Colors.blueGrey,
                        image: Image.asset('assets/scratch.png'),
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Center(
                            child: Text("Tekrar dene!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "The unseen",
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                          )
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          )
        ),
    );
  }
}