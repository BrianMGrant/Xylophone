import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'models/global_theme.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Xylophone',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget soundTile({required Color color, required String sound}) {
    final player = AudioCache();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.45,
      child: TextButton(
        onPressed: () {
          player.play("note$sound.wav");
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.black,
        ),
        child: const Text('Tap'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            soundTile(color: Colors.red, sound: '1'),
            soundTile(color: Colors.green, sound: '2'),
            soundTile(color: Colors.yellow, sound: '3'),
            soundTile(color: Colors.orange, sound: '4'),
            soundTile(color: Colors.blue, sound: '5'),
            soundTile(color: Colors.purple, sound: '6'),
            soundTile(color: Colors.teal, sound: '7'),
          ],
        ),
      ),
    );
  }
}
