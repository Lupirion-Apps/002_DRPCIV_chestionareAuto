import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' show JavascriptMode, WebView;
import 'package:url_launcher/url_launcher.dart' show canLaunch, launch;

const String testDevice = 'MObile_id';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Auto',
      home: Scaffold(
        // bara de sus cu numele titlului
        appBar: AppBar(
          title: const Text('Examen Auto'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Success la Examenul Auto',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Buy me a coffee!'),
                onTap: _launchCoffee,
              ),
              /* ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('PayPal'),
                onTap: _launchPaypal,
              ), */
              ListTile(
                leading: Icon(Icons.stars),
                title: Text('Patreon'),
                onTap: _launchPatreon,
              ),
            ],
          ),
        ),
        // partea principala a aplicatiei
        body: const WebView(
          initialUrl: "https://www.drpciv.ro/dlexam",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

_launchCoffee() async {
  const url = 'https://www.buymeacoffee.com/Lupirion';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchPatreon() async {
  const url = 'https://www.patreon.com/Lupirion';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
/*
_launchPaypal() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
} */
