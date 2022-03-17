import 'package:bulls_and_cows/custom_vidgets/number_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Bulls and cows',
            style: TextStyle(fontFamily: 'FuzzyBubbles'),
          ),
          centerTitle: true,
          backgroundColor: Colors.greenAccent,
        ),
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
            child: const Text('Play'),
            onPressed: () {
              NumberList.restartGame();
              Navigator.pushNamed(context, 'singleplayer_game_screen');
            },
          ),
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'settings');
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.greenAccent,
            size: 30,
          ),
        ));
  }
}
