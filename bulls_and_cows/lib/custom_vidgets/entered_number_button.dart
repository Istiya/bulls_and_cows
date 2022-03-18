import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';
import 'package:bulls_and_cows/custom_vidgets/game_manager.dart';
import 'package:flutter/material.dart';

class EnteredNumberButton extends CustomButton {
  final String enteredNumber;
  final Function changeBorderEnteredNumberButtons;
  const EnteredNumberButton(
      this.enteredNumber, this.changeBorderEnteredNumberButtons,
      {Key? key})
      : super(key: key);

  @override
  State<EnteredNumberButton> createState() => _EnteredNumberButtonState();
}

class _EnteredNumberButtonState extends State<EnteredNumberButton> {
  List<Color> enteredNumberButtonColorList = [
    const Color(0xFFFEE6E5),
    const Color(0xFFFF9B9B),
    const Color(0xFFFFDAB8),
    Colors.grey
  ];

  int curColor = 0;

  List<BorderSide> borderSideList = [
    BorderSide.none,
    const BorderSide(color: Colors.black)
  ];

  int currentBorderSide = 0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
        onLongPress: () {
          GameManager.onLongPressedSelectedEnteredNumber == widget.enteredNumber
              ? widget.changeBorderEnteredNumberButtons(null)
              : widget.changeBorderEnteredNumberButtons(widget.enteredNumber);
        },
        onPressed: () => setState(() =>
            curColor = (curColor + 1) % enteredNumberButtonColorList.length),
        child: Text(widget.enteredNumber, style: widget.customButtonTextStyle),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              side: GameManager.onLongPressedSelectedEnteredNumber ==
                      widget.enteredNumber
                  ? borderSideList[1]
                  : borderSideList[0],
              borderRadius: BorderRadius.circular(12)),
          backgroundColor: enteredNumberButtonColorList[curColor],
        ),
      ),
    );
  }
}
