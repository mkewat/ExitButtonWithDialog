import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State<Demo> {
  Future<bool> exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(
          'Are you sure?',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        content: new Text(
          'Do you want to exit form the app?',
          style: TextStyle(fontSize: 16.0),
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: new Text(
              'EXIT',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: new Text(
              'CANCEL',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exitDialog();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Button'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              exitDialog();
            },
            child: Text('Exit Buton'),
          ),
        ),
      ),
    );
  }
}
