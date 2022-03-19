import 'dart:core';

import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/game_manager.dart';
import 'package:bulls_and_cows/custom_vidgets/digit_button.dart';
import 'package:bulls_and_cows/custom_vidgets/draft_number_button.dart';
import 'package:bulls_and_cows/custom_vidgets/entered_number_button.dart';

class SinglePlayerGameScreen extends StatefulWidget {
  const SinglePlayerGameScreen({Key? key}) : super(key: key);

  @override
  _SinglePlayerGameScreenState createState() => _SinglePlayerGameScreenState();
}

class _SinglePlayerGameScreenState extends State<SinglePlayerGameScreen> {
  void changeDraftNumber(int i, String digit) {
    setState(() {
      if (GameManager.draftNumberList[i].isNotEmpty) {
        if (GameManager.onLongPressedSelectedDraftNumberButtonsList[i]) {
          GameManager.lastOnLongPressedSelectedDraftNumbersList[i] = digit;
        }
        GameManager.lastOnPressedSelectedDraftNumber =
            GameManager.draftNumberList[i];
      }
      GameManager.draftNumberList[i] = digit;
      GameManager.buttonActiveList[int.parse(digit) - 1] = false;
    });
  }

  void changeSelectedDraftNumberButton(int i) {
    setState(() {
      GameManager.onPressedSelectedDraftNumberButton = i;
    });
  }

  void changeOnLongPressedSelectedDraftNumber(int digit) {
    setState(() {
      if (GameManager.onLongPressedSelectedDraftNumberButtonsList[digit]) {
        GameManager.onLongPressedSelectedDraftNumberButtonsList[digit] = false;
        GameManager.lastOnLongPressedSelectedDraftNumbersList[digit] = null;
      } else {
        GameManager.onLongPressedSelectedDraftNumberButtonsList[digit] = true;
        GameManager.lastOnLongPressedSelectedDraftNumbersList[digit] =
            GameManager.draftNumberList[digit];
      }
    });
  }

  void changeOnLongPressedSelectedEnteredNumber(String? digit) {
    setState(() {
      GameManager.onLongPressedSelectedEnteredNumber = digit;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
              GameManager.clearAllInstance();
            },
          ),
          title: const Text('Bulls and cows'),
          actions: [
            IconButton(
                onPressed: () => setState(() {
                      GameManager.generateStartInstance();
                    }),
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              addAutomaticKeepAlives: true,
              itemCount: GameManager.enteredNumberList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 50),
                    Text(
                      (index + 1).toString() + '.',
                      style: const TextStyle(
                          fontFamily: 'AmaticSc',
                          color: Color(0xFF6D4951),
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                    for (int i = 0; i < 4; i++)
                      EnteredNumberButton(
                          GameManager.enteredNumberList[index][i],
                          changeOnLongPressedSelectedEnteredNumber),
                    Text(GameManager.checkResult(index)),
                    const SizedBox(width: 50),
                    const Padding(padding: EdgeInsets.only(bottom: 65))
                  ],
                );
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(width: 50),
                IconButton(
                    onPressed: () {
                      setState(() {
                        GameManager.onDeleteButtonClick();
                      });
                    },
                    icon: const Icon(Icons.delete)),
                for (int i = 0; i < 4; i++)
                  DraftNumberButton(i, changeSelectedDraftNumberButton,
                      changeOnLongPressedSelectedDraftNumber),
                IconButton(
                    onPressed: () {
                      setState(() {
                        GameManager.onCheckButtonClick();
                      });
                    },
                    icon: const Icon(Icons.check)),
                const SizedBox(width: 50),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 5),
                for (int i = 1; i < 10; i++)
                  DigitButton(i.toString(), changeDraftNumber),
                const SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ));
  }
}
