import 'package:flutter/material.dart';
import 'pages/main_screen.dart';
import 'pages/single_player_game_screen.dart';
import 'pages/settings.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.greenAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        'singleplayer_game_screen': (context) => SinglePlayerGameScreen(),
        'settings': (context) => Settings(),
      },
    ));
