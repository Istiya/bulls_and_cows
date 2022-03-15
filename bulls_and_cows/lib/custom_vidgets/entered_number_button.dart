import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';
import 'package:flutter/material.dart';

class EnteredNumberButton extends CustomButton {
  final String number;
  @override
  TextStyle get enteredButtonTextStyle => customButtonTextStyle;
  const EnteredNumberButton(this.number, {Key? key}) : super(key: key);

  @override
  State<EnteredNumberButton> createState() => _EnteredNumberButtonState();
}

class _EnteredNumberButtonState extends State<EnteredNumberButton> {
  List<Color> colorList = [
    const Color(0xFFFEE6E5),
    const Color(0xFFFF9B9B),
    const Color(0xFFFFDAB8),
    Colors.grey
  ];

  int curColor = 0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
        onPressed: () =>
            setState(() => curColor = (curColor + 1) % colorList.length),
        child: Text(widget.number, style: widget.customButtonTextStyle),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: colorList[curColor],
        ),
      ),
    );
  }
}
