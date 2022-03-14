import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';
import 'package:bulls_and_cows/custom_vidgets/digit_button.dart';
import 'package:bulls_and_cows/custom_vidgets/entered_number_button.dart';

class SinglePlayerGameScreen extends StatefulWidget {
  const SinglePlayerGameScreen({Key? key}) : super(key: key);

  @override
  _SinglePlayerGameScreenState createState() => _SinglePlayerGameScreenState();
}

enum buttonColors { nothing, cow, bull }

class _SinglePlayerGameScreenState extends State<SinglePlayerGameScreen> {
  Set<String> hiddenNumber = {};

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
                EnteredNumberButton(NumberList.numberList[index][0]),
                EnteredNumberButton(NumberList.numberList[index][1]),
                EnteredNumberButton(NumberList.numberList[index][2]),
                EnteredNumberButton(NumberList.numberList[index][3]),
                Text(NumberList.numberList[index][4]),
                const SizedBox(width: 50),
              ],
            );
          },
        )),
        Row(
          children: [
            const SizedBox(width: 50),
            IconButton(
                onPressed: () {
                  setState(() {
                    NumberList.delete();
                  });
                  NumberList.buttonActiveList = List.filled(9, true);
                },
                icon: const Icon(Icons.delete)),
            Expanded(child: Text(NumberList.draftNumber.join(' '))),
            IconButton(
                onPressed: () {
                  if (!NumberList.draftNumber.contains('')) {
                    setState(() {
                      NumberList.numberList.add(NumberList.draftNumber);
                      NumberList.numberList.last.add(checkResult());
                      NumberList.delete();
                    });
                    NumberList.buttonActiveList = List.filled(9, true);
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
            DigitButton('1'),
            DigitButton('2'),
            DigitButton('3'),
            DigitButton('4'),
            DigitButton('5'),
            DigitButton('6'),
            DigitButton('7'),
            DigitButton('8'),
            DigitButton('9'),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 100),
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
