import 'package:flutter/material.dart';
import 'package:url_launcher_example/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Url Launcher';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                text: 'Open Link',
                onClicked: () => Utils.openLink(url: 'http://flutter.dev'),
              ),
              buildButton(
                text: 'Open Email',
                onClicked: () => Utils.openEmail(
                  toEmail: 'example@gmail.com',
                  subject: 'Hello World',
                  body: 'This works great!',
                ),
              ),
              buildButton(
                text: 'Open Call',
                onClicked: () =>
                    Utils.openPhoneCall(phoneNumber: '+4912388128311'),
              ),
              buildButton(
                text: 'Open SMS',
                onClicked: () => Utils.openSMS(phoneNumber: '+4912388128311'),
              ),
            ],
          ),
        ),
      );

  Widget buildButton({
    @required String text,
    @required VoidCallback onClicked,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: RaisedButton(
          shape: StadiumBorder(),
          onPressed: onClicked,
          color: Colors.red,
          textColor: Colors.white,
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
}
