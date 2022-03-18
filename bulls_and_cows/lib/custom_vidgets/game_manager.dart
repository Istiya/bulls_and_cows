import 'dart:math';

class GameManager {
  static Set<String> hiddenNumberSet = {};

  static List<List<String>> enteredNumberList = [];
  static List<String> draftNumberList = List.generate(4, ((index) => ''));
  static List<bool> buttonActiveList = List.generate(9, ((index) => true));

  static int? onPressedSelectedDraftNumberButton = 0;
  static String? lastOnPressedSelectedDraftNumber;

  static List<bool> onLongPressedSelectedDraftNumberButtonsList =
      List.generate(4, (index) => false);
  static List<String?> lastOnLongPressedSelectedDraftNumbersList =
      List.generate(4, (index) => '');

  static String? onLongPressedSelectedEnteredNumber;

  static void generateClearButtonActiveList() {
    buttonActiveList = List.generate(
        9,
        ((index) => lastOnLongPressedSelectedDraftNumbersList
                .contains((index + 1).toString())
            ? false
            : true));
  }

  static void generateClearHiddenNumber() {
    hiddenNumberSet.clear();
    do {
      hiddenNumberSet.add((Random().nextInt(9) + 1).toString());
    } while (hiddenNumberSet.length != 4);
  }

  static void generateClearDraftNumberList() {
    draftNumberList = List.generate(
        4,
        ((index) => onLongPressedSelectedDraftNumberButtonsList[index]
            ? lastOnLongPressedSelectedDraftNumbersList[index]!
            : ''));
  }

  static void generateStartInstance() {
    enteredNumberList = [];
    onPressedSelectedDraftNumberButton = 0;
    onLongPressedSelectedDraftNumberButtonsList =
        List.generate(4, (index) => false);
    lastOnLongPressedSelectedDraftNumbersList = List.generate(4, (index) => '');
    lastOnPressedSelectedDraftNumber = null;
    onLongPressedSelectedEnteredNumber = null;

    generateClearDraftNumberList();
    generateClearHiddenNumber();
    generateClearButtonActiveList();
  }

  static void clearAllInstance() {
    hiddenNumberSet.clear();
    enteredNumberList.clear();
    draftNumberList.clear();
    buttonActiveList.clear();
    onPressedSelectedDraftNumberButton = null;
    onLongPressedSelectedDraftNumberButtonsList.clear();
    lastOnLongPressedSelectedDraftNumbersList.cast();
    lastOnPressedSelectedDraftNumber = null;
    onLongPressedSelectedEnteredNumber = null;
  }
}
