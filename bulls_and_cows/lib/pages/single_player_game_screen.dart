import 'dart:math';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';

class SinglePlayerGameScreen extends StatefulWidget {
  const SinglePlayerGameScreen({Key? key}) : super(key: key);

  @override
  _SinglePlayerGameScreenState createState() => _SinglePlayerGameScreenState();
}

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
                enteredNumberButton(index, 0),
                enteredNumberButton(index, 1),
                enteredNumberButton(index, 2),
                enteredNumberButton(index, 3),
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
            digitButton('1'),
            digitButton('2'),
            digitButton('3'),
            digitButton('4'),
            digitButton('5'),
            digitButton('6'),
            digitButton('7'),
            digitButton('8'),
            digitButton('9'),
            const SizedBox(width: 5),
          ],
        ),
        const SizedBox(height: 100),
      ],
    ));
  }

  Widget digitButton(String digit) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
        child: TextButton(
            child: Text(
              digit,
              style: const TextStyle(
                  fontFamily: 'AmaticSc',
                  color: Color(0xFF6D4951),
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: NumberList.buttonActiveList[int.parse(digit) - 1]
                  ? const Color(0xFFFEE6E5)
                  : const Color(0xFFAD8089),
            ),
            onPressed: NumberList.buttonActiveList[int.parse(digit) - 1]
                ? () {
                    for (int i = 0; i < 4; i++) {
                      if (NumberList.draftNumber[i].isEmpty) {
                        setState(() {
                          NumberList.draftNumber[i] = digit;
                        });
                        break;
                      }
                    }
                    NumberList.buttonActiveList[int.parse(digit) - 1] = false;
                  }
                : null));
  }

  Widget enteredNumberButton(int index, int secondIndex) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
        onPressed: () {},
        child: Text(
          NumberList.numberList[index][secondIndex],
          style: const TextStyle(
              fontFamily: 'AmaticSc',
              color: Color(0xFF6D4951),
              fontSize: 45,
              fontWeight: FontWeight.bold),
          // style: const TextStyle(backgroundColor: Color(0xFFF0C5CE)),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: const Color(0xFFFEE6E5),
        ),
      ),
    );
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