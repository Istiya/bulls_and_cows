import 'package:flutter/material.dart';

enum buttonColors { nothing, cow, bull }

class EnteredNumberButton extends StatefulWidget {
  String number;

  EnteredNumberButton(this.number, {Key? key}) : super(key: key);

  @override
  State<EnteredNumberButton> createState() =>
      _EnteredNumberButtonState(this.number);
}

class _EnteredNumberButtonState extends State<EnteredNumberButton> {
  String number;

  _EnteredNumberButtonState(this.number);

  List<Color> colorList = [
    const Color(0xFFFEE6E5),
    const Color(0xFFFF9B9B),
    const Color(0xFFFFDAB8)
  ];

  int curColor = 0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
        onPressed: () => {
          curColor == buttonColors.nothing.index
              ? setState(() {
                  print("on pressed nothing");
                  curColor = buttonColors.cow.index;
                })
              : curColor == buttonColors.cow.index
                  ? setState(() {
                      print("on pressed cow");
                      curColor = buttonColors.bull.index;
                    })
                  : setState(() {
                      print("on pressed bull");
                      curColor = buttonColors.nothing.index;
                    })
        },
        child: Text(
          number,
          style: const TextStyle(
              fontFamily: 'AmaticSc',
              color: Color(0xFF6D4951),
              fontSize: 45,
              fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: curColor == buttonColors.nothing.index
              ? const Color(0xFFFEE6E5)
              : curColor == buttonColors.bull.index
                  ? const Color(0xFFFF9B9B)
                  : const Color(0xFFFFDAB8),
        ),
      ),
    );
  }
}
