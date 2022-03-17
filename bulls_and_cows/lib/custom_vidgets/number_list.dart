import 'dart:math';

class NumberList {
  static Set<String> hiddenNumber = {};
  static List<List<String>> numberList = [];
  static List<String> draftNumberList = List.generate(4, ((index) => ''));
  static List<bool> buttonActiveList = List.generate(9, ((index) => true));
  static int? buttonDraftNumber = 0;
  static String? lastDraftNumber;

  static void generateButtonActiveList() {
    buttonActiveList = List.generate(9, ((index) => true));
  }

  static void refreshHiddenNumber() {
    hiddenNumber.clear();
    do {
      hiddenNumber.add((Random().nextInt(9) + 1).toString());
    } while (hiddenNumber.length != 4);
  }

  static void clearDraftNumberList() {
    draftNumberList = List.generate(4, ((index) => ''));
  }

  static void restartGame() {
    numberList = [];
    buttonDraftNumber = 0;
    lastDraftNumber = null;

    clearDraftNumberList();
    refreshHiddenNumber();
    generateButtonActiveList();
  }

  static void closePage() {
    hiddenNumber.clear();
    numberList.clear();
    draftNumberList.clear();
    buttonActiveList.clear();
    buttonDraftNumber = null;
    lastDraftNumber = null;
  }
}
