import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';
import 'package:bulls_and_cows/custom_vidgets/game_manager.dart';

import 'package:flutter/material.dart';

class DraftNumberButton extends CustomButton {
  final int draftNumber;
  final Function changeOnPressedSelectedDraftNumberButton;
  final Function changeOnLongPressedSelectedDraftNumberButton;
  const DraftNumberButton(
      this.draftNumber,
      this.changeOnPressedSelectedDraftNumberButton,
      this.changeOnLongPressedSelectedDraftNumberButton,
      {Key? key})
      : super(key: key);

  @override
  State<DraftNumberButton> createState() => _DraftNumberState();
}

class _DraftNumberState extends State<DraftNumberButton> {
  List<Color> draftNumberButtonColorlist = [
    const Color(0xFFFEE6E5),
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
          onPressed: () {
            widget.changeOnPressedSelectedDraftNumberButton(widget.draftNumber);
          },
          onLongPress: () {
            GameManager.draftNumberList[widget.draftNumber].isEmpty
                ? () {}
                : widget.changeOnLongPressedSelectedDraftNumberButton(
                    widget.draftNumber);
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor:
                  GameManager.onLongPressedSelectedDraftNumberButtonsList[
                          widget.draftNumber]
                      ? draftNumberButtonColorlist[1]
                      : draftNumberButtonColorlist[0]),
          child: Text(GameManager.draftNumberList[widget.draftNumber],
              style: widget.customButtonTextStyle)),
    );
  }
}
