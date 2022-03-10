import 'dart:core';

import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';

Widget enteredNumberButton(int index, int secondIndex) {
  return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: PopupMenuButton<int>(
        child: Text(
          NumberList.numberList[index][secondIndex],
          style: const TextStyle(
              fontFamily: 'AmaticSc',
              color: Color(0xFF6D4951),
              backgroundColor: Color(0xFFFEE6E5),
              fontSize: 45,
              fontWeight: FontWeight.bold),
        ),
        itemBuilder: (BuildContext context) => [
          const PopupMenuItem(
            value: 1,
            child: Text('Cow'),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('Bull'),
          ),
          const PopupMenuItem(
            value: 2,
            child: Text('Nothing'),
          ),
        ],
        enableFeedback: false,
        elevation: 10,
        offset: const Offset(0, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));
}
