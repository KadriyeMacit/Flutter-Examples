import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WebView Example',
        ),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Hello World youtube kanalından Erasmus hakkında bilgiler:',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 1,
              child: WebView(
                allowsInlineMediaPlayback: true,
                debuggingEnabled: false,
                initialMediaPlaybackPolicy:
                    AutoMediaPlaybackPolicy.always_allow,
                initialUrl: "https://www.youtube.com/watch?v=OABAqND52G4",
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: Set.from([
                  JavascriptChannel(
                    name: "flutter",
                    onMessageReceived: (JavascriptMessage message) {
                      if (message.message == "onSubscribeClick") {
                        print("onSubscribeClick");
                      }
                    },
                  )
                ]),
                onWebViewCreated: (WebViewController webviewcontroller) {
                  try {} catch (error, stackTrace) {}
                },
                onPageStarted: (String page) {},
                onPageFinished: (String page) {},
                onWebResourceError: (websourceerror) {
                  print("=> onWebResourceError " +
                      websourceerror.domain.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
