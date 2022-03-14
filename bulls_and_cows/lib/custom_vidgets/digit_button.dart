import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';

class DigitButton extends StatefulWidget {
  final String digit;
  // ignore: prefer_const_constructors_in_immutables
  DigitButton(this.digit, {Key? key}) : super(key: key);

  @override
  State<DigitButton> createState() => _DigitButton();
}

class _DigitButton extends State<DigitButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
        child: TextButton(
            child: Text(
              widget.digit,
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
              backgroundColor:
                  NumberList.buttonActiveList[int.parse(widget.digit) - 1]
                      ? const Color(0xFFFEE6E5)
                      : const Color(0xFFAD8089),
            ),
            onPressed: NumberList.buttonActiveList[int.parse(widget.digit) - 1]
                ? () {
                    for (int i = 0; i < 4; i++) {
                      if (NumberList.draftNumber[i].isEmpty) {
                        NumberList.draftNumber[i] = widget.digit;
                        break;
                      }
                    }
                    setState(() {
                      NumberList.buttonActiveList[int.parse(widget.digit) - 1] =
                          false;
                    });
                  }
                : null));
  }
}
