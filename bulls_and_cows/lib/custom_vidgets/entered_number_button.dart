import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';
import 'package:bulls_and_cows/custom_vidgets/game_manager.dart';
import 'package:flutter/material.dart';

class EnteredNumberButton extends CustomButton {
  final String _enteredNumber;
  final Function _changeBorderEnteredNumberButtons;
  const EnteredNumberButton(
      this._enteredNumber, this._changeBorderEnteredNumberButtons,
      {Key? key})
      : super(key: key);

  @override
  State<EnteredNumberButton> createState() => _EnteredNumberButtonState();
}

class _EnteredNumberButtonState extends State<EnteredNumberButton>
    with AutomaticKeepAliveClientMixin {
  final List<Color> _enteredNumberButtonColorList = [
    const Color(0xFFFEE6E5),
    const Color(0xFFFF9B9B),
    const Color(0xFFFFDAB8),
    Colors.grey
  ];

  int _curColor = 0;

  final List<BorderSide> _borderSideList = [
    BorderSide.none,
    const BorderSide(color: Colors.black)
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
        onLongPress: () {
          GameManager.onLongPressedSelectedEnteredNumber ==
                  widget._enteredNumber
              ? widget._changeBorderEnteredNumberButtons(null)
              : widget._changeBorderEnteredNumberButtons(widget._enteredNumber);
        },
        onPressed: () => setState(() =>
            _curColor = (_curColor + 1) % _enteredNumberButtonColorList.length),
        child: Text(widget._enteredNumber, style: widget.customButtonTextStyle),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              side: GameManager.onLongPressedSelectedEnteredNumber ==
                      widget._enteredNumber
                  ? _borderSideList[1]
                  : _borderSideList[0],
              borderRadius: BorderRadius.circular(12)),
          backgroundColor: _enteredNumberButtonColorList[_curColor],
        ),
      ),
    );
  }
}
