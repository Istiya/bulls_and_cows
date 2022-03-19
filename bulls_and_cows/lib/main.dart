import 'package:flutter/material.dart';
import 'pages/main_screen.dart';
import 'pages/single_player_game_screen.dart';
import 'pages/settings_screen.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Colors.greenAccent),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        'singleplayer_game_screen': (context) => const SinglePlayerGameScreen(),
        'settings': (context) => const SettingsScreen(),
      },
    ));
