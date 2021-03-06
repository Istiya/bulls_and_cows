import 'package:flutter/material.dart';
import 'package:bulls_and_cows/custom_vidgets/game_manager.dart';
import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';

class DigitButton extends CustomButton {
  final String _digit;
  final Function _valueChanged;
  // ignore: prefer_const_constructors_in_immutables
  DigitButton(this._digit, this._valueChanged, {Key? key}) : super(key: key);

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
              widget._digit,
              style: widget.customButtonTextStyle,
            ),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor:
                  GameManager.buttonActiveList[int.parse(widget._digit) - 1]
                      ? const Color(0xFFFEE6E5)
                      : const Color(0xFFAD8089),
              primary: const Color(0xFF6D4951),
            ),
            onPressed: GameManager
                        .buttonActiveList[int.parse(widget._digit) - 1] &&
                    GameManager.onPressedSelectedDraftNumberButton != null
                ? () {
                    widget._valueChanged(
                        GameManager.onPressedSelectedDraftNumberButton,
                        widget._digit);

                    if (GameManager.lastOnPressedSelectedDraftNumber != null) {
                      GameManager.buttonActiveList[int.parse(
                              GameManager.lastOnPressedSelectedDraftNumber!) -
                          1] = true;
                      GameManager.lastOnPressedSelectedDraftNumber = null;
                    }

                    for (int i = 0; i < 4; i++) {
                      if (GameManager.draftNumberList[i].isEmpty) {
                        GameManager.onPressedSelectedDraftNumberButton = i;
                        return;
                      }
                    }

                    GameManager.onPressedSelectedDraftNumberButton = null;
                    return;
                  }
                : null));
  }
}
