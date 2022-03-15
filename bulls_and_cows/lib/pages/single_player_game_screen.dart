import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';
import 'package:bulls_and_cows/custom_vidgets/digit_button.dart';
import 'package:bulls_and_cows/custom_vidgets/draft_number_button.dart';
import 'package:bulls_and_cows/custom_vidgets/entered_number_button.dart';

class SinglePlayerGameScreen extends StatefulWidget {
  const SinglePlayerGameScreen({Key? key}) : super(key: key);

  @override
  _SinglePlayerGameScreenState createState() => _SinglePlayerGameScreenState();
}

enum buttonColors { nothing, cow, bull }

class _SinglePlayerGameScreenState extends State<SinglePlayerGameScreen> {
  Set<String> hiddenNumber = {};

  void changeDraftNumber(int i, String digit) {
    setState(() {
      NumberList.draftNumber[i] = digit;
      NumberList.buttonActiveList[int.parse(digit) - 1] = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    do {
      hiddenNumber.add((Random().nextInt(9) + 1).toString());
    } while (hiddenNumber.length != 4);
    print(hiddenNumber.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 50),
        Expanded(
            child: ListView.builder(
          itemCount: NumberList.numberList.length,
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
                  EnteredNumberButton(NumberList.numberList[index][i]),
                Text(NumberList.numberList[index][4]),
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
                    NumberList.delete();
                    NumberList.buttonActiveList = List.filled(9, true);
                  });
                },
                icon: const Icon(Icons.delete)),
            for (int i = 0; i < 4; i++) DraftNumberButton(i),
            IconButton(
                onPressed: () {
                  if (!NumberList.draftNumber.contains('')) {
                    setState(() {
                      NumberList.numberList.add(NumberList.draftNumber);
                      NumberList.numberList.last.add(checkResult());
                      NumberList.delete();
                      NumberList.buttonActiveList = List.filled(9, true);
                    });
                  }
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

  // Можно оптимизировать
  String checkResult() {
    int cows = 0;
    int bulls = 0;

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (NumberList.draftNumber[i] == hiddenNumber.elementAt(j)) {
          i == j ? bulls++ : cows++;
          break;
        }
      }
    }

    String result = '$cows cows \n $bulls bulls';
    return bulls == 4 ? 'You win!' : result;
  }
}
