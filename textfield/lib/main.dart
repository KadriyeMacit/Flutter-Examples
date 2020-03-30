import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primaryColor: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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


  String girilenMetin="";
  int maxLine=1;
  FocusNode _fNode ;


  @override
  void initState() {
    super.initState();

    _fNode=FocusNode();

    _fNode.addListener((){
      setState(() {
        if(_fNode.hasFocus){
          maxLine = 3;
        }else{
          maxLine =1;
        }
      });
    });

  }


  @override
  void dispose() {

    _fNode.dispose();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.title),
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: (){
          FocusScope.of(context).requestFocus(_fNode);
        },
        child: Icon(Icons.edit), backgroundColor: Colors.cyan,),





      body: ListView(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left:50, right: 50),
                child: TextField(
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left:50, right: 50),
                child: TextField(
                  keyboardType: TextInputType.number,
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(
                  maxLines: 3,
                  maxLength: 20,
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, top:20, bottom:20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Hello World",
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Hello World",
                    icon: Icon(Icons.camera, color: Colors.greenAccent,)
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20, top:20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Hello World",
                     prefixIcon: Icon(Icons.local_florist, color: Colors.deepPurple,),
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Hello World",
                    suffixIcon: Icon(Icons.favorite, color:Colors.blue[200]),
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Hello World",
                      filled: true,
                      fillColor: Colors.lightGreenAccent[100]
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Hello World",
                      labelText: "Başlık",
                      filled: true,
                      fillColor: Colors.deepOrange[200]
                  ),
                  cursorColor: Colors.yellow,
                ),
              ),




              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: "Hello World",
                  ),

                  onChanged: (String anlikVeri) => debugPrint("On Change: $anlikVeri"),

                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Hello World",
                  ),

                  onSubmitted: (String anlikVeri){

                    debugPrint("On Submit : $anlikVeri");

                    girilenMetin = anlikVeri;

                  },


                ),
              ),



              Padding(
                padding: const EdgeInsets.only(left:50, right: 50, bottom: 20),
                child: TextField(

                  textInputAction: TextInputAction.done,
                  focusNode: _fNode,
                  maxLines: maxLine,
                  autofocus: false,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: "Hello World",
                  ),

                ),
              ),




            ],
          ),

    );
  }
}
