import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    XylophoneApp(),
  );
}

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Color appBackgroundColor = Colors.black;

  void playSound(int soundNumber, Color color) {
    final player = AudioCache();
    player.play("note$soundNumber.wav");

    setState(() {
      appBackgroundColor = color;
    });
  }

  Expanded buildKey({
    Color color,
    Color textColor,
    int soundNumber,
    String title,
    double paddingRight,
  }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: 16.0, top: 8.0, right: paddingRight, bottom: 8.0),
        child: FlatButton(
          color: color,
          onPressed: () {
            playSound(soundNumber, textColor);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  color: textColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: AppBar(
          backgroundColor: appBackgroundColor,
          elevation: 0.0,
          title: Text(
            "JB'S XYLO",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              fontFamily: "Pacifico",
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              buildKey(
                color: Colors.red,
                textColor: Colors.red.shade200,
                soundNumber: 1,
                title: "Do",
                paddingRight: 16.0,
              ),
              buildKey(
                color: Colors.orange,
                textColor: Colors.orange.shade200,
                soundNumber: 2,
                title: "Ré",
                paddingRight: 35.0,
              ),
              buildKey(
                color: Colors.yellow.shade600,
                textColor: Colors.yellow.shade300,
                soundNumber: 3,
                title: "Mi",
                paddingRight: 45.0,
              ),
              buildKey(
                color: Colors.green,
                textColor: Colors.green.shade200,
                soundNumber: 4,
                title: "Fa",
                paddingRight: 55.0,
              ),
              buildKey(
                color: Colors.teal,
                textColor: Colors.teal.shade200,
                soundNumber: 5,
                title: "Sol",
                paddingRight: 65.0,
              ),
              buildKey(
                color: Colors.blue,
                textColor: Colors.blue.shade200,
                soundNumber: 6,
                title: "La",
                paddingRight: 75.0,
              ),
              buildKey(
                color: Colors.purple,
                textColor: Colors.purple.shade200,
                soundNumber: 7,
                title: "Si",
                paddingRight: 85.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
