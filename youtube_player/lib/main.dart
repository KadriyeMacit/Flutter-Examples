import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
      home: MyHomePage(title: 'Youtube player örneği'),
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

  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'SP0Ejd7hmIU', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              height: 30,
              width: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.cyan[600],
                    Colors.cyan[900],
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    //spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(
                        0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Youtube video',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                  ),
                ),
              ),
            ),

            SizedBox(height: 30,),

            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),

            SizedBox(height: 30,),

            InkWell(
              onTap: (){
                  _showDialog();
              },
              child: Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink[600],
                      Colors.purple[900],
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      //spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(
                          0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Hello World videosu izlemek için tıkla!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,  //sadece butonlara basınca ekrandan çıkıyor
      builder: (BuildContext context) {

        return AlertDialog(

          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(10.0)),
          backgroundColor: Colors.greenAccent,
          title: Text(
              "Flutter serisi",
            textAlign: TextAlign.center,
          ),
          //content: Text("Hello world"),

          actions: <Widget>[

            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            )


          ],
        );
      },
    );
  }
}