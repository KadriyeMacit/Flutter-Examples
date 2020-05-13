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
      home: MyHomePage(title: 'Inkwell'),
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

  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.lightGreen,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child:

              InkWell(

                onTap: (){
                  _incrementCounter();
                },
                  child: Text("Jelibonlar")
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:

                  InkWell(
                    highlightColor: Colors.pinkAccent.withOpacity(0.5),
                    splashColor: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    onTap: (){
                      _incrementCounter();
                    },
                      child: Icon(Icons.ac_unit, size: 100,)
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:

                  InkResponse(
                    splashColor: Colors.red,
                      radius: 100,
                      onTap: (){
                        _incrementCounter();
                      },
                      child: Icon(Icons.play_arrow, size: 100,)
                  ),
                ),
              ],
            ),


            
            Row(
              children: <Widget>[
                
                Expanded(child: Image.asset("images/jel.png")),
                
                Expanded(child: InkWell(
                  onTap: (){
                    _incrementCounter();
                  },
                  child: Image.asset("images/jel2.png"),
                )),
                
                Expanded(child: Image.asset("images/jel3.png")),
              ],
            )




          ],
        ),
      ),


     );
  }
}
