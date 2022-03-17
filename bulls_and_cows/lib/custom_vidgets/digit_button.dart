import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';
import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';

class DigitButton extends CustomButton {
  final String digit;
  final Function valueChanged;
  TextStyle get digitButtonTextStyle => customButtonTextStyle;
  // ignore: prefer_const_constructors_in_immutables
  DigitButton(this.digit, this.valueChanged, {Key? key}) : super(key: key);

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
              style: widget.digitButtonTextStyle,
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
            onPressed: NumberList
                        .buttonActiveList[int.parse(widget.digit) - 1] &&
                    NumberList.buttonDraftNumber != null
                ? () {
                    widget.valueChanged(
                        NumberList.buttonDraftNumber, widget.digit);

                    if (NumberList.lastDraftNumber != null) {
                      NumberList.buttonActiveList[
                          int.parse(NumberList.lastDraftNumber!) - 1] = true;
                      NumberList.lastDraftNumber = null;
                    }

                    for (int i = 0; i < 4; i++) {
                      if (NumberList.draftNumberList[i].isEmpty) {
                        NumberList.buttonDraftNumber = i;
                        return;
                      }
                    }

                    NumberList.buttonDraftNumber = null;
                    return;
                  }
                : null));
  }
}
