import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';
import 'package:bulls_and_cows/custom_vidgets/game_manager.dart';

import 'package:flutter/material.dart';

class DraftNumberButton extends CustomButton {
  final int _draftNumber;
  final Function _changeOnPressedSelectedDraftNumberButton;
  final Function _changeOnLongPressedSelectedDraftNumberButton;
  const DraftNumberButton(
      this._draftNumber,
      this._changeOnPressedSelectedDraftNumberButton,
      this._changeOnLongPressedSelectedDraftNumberButton,
      {Key? key})
      : super(key: key);

  @override
  State<DraftNumberButton> createState() => _DraftNumberState();
}

class _DraftNumberState extends State<DraftNumberButton> {
  final List<Color> _draftNumberButtonColorlist = [
    const Color(0xFFFEE6E5),
    Colors.greenAccent
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
          onPressed: () {
            widget
                ._changeOnPressedSelectedDraftNumberButton(widget._draftNumber);
          },
          onLongPress: () {
            GameManager.draftNumberList[widget._draftNumber].isEmpty
                ? null
                : widget._changeOnLongPressedSelectedDraftNumberButton(
                    widget._draftNumber);
          },
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor:
                  GameManager.onLongPressedSelectedDraftNumberButtonsList[
                          widget._draftNumber]
                      ? _draftNumberButtonColorlist[1]
                      : _draftNumberButtonColorlist[0]),
          child: Text(GameManager.draftNumberList[widget._draftNumber],
              style: widget.customButtonTextStyle)),
    );
  }
}
