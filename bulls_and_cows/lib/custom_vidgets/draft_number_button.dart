import 'package:bulls_and_cows/custom_vidgets/custom_button.dart';
import 'package:bulls_and_cows/custom_vidgets/number_list.dart';

import 'package:flutter/material.dart';

class DraftNumberButton extends CustomButton {
  TextStyle get draftNumberButtonTextStyle => customButtonTextStyle;
  final int draftNumber;
  const DraftNumberButton(this.draftNumber, {Key? key}) : super(key: key);

  @override
  State<DraftNumberButton> createState() => _DraftNumberState();
}

class _DraftNumberState extends State<DraftNumberButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 70, maxWidth: 30),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xFFFEE6E5)),
          onPressed: () {
            NumberList.buttonDraftNumber[widget.draftNumber] = true;
          },
          child: Text(NumberList.draftNumber[widget.draftNumber],
              style: widget.draftNumberButtonTextStyle)),
    );
  }
}
