import 'dart:math';

class GameManager {
  static final Set<String> _hiddenNumberSet = {};

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

  static void _generateClearButtonActiveList() {
    buttonActiveList = List.generate(
        9,
        ((index) => lastOnLongPressedSelectedDraftNumbersList
                .contains((index + 1).toString())
            ? false
            : true));
  }

  static void _generateClearHiddenNumber() {
    _hiddenNumberSet.clear();
    do {
      _hiddenNumberSet.add((Random().nextInt(9) + 1).toString());
    } while (_hiddenNumberSet.length != 4);
  }

  static void _generateClearDraftNumberList() {
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

    _generateClearDraftNumberList();
    _generateClearHiddenNumber();
    _generateClearButtonActiveList();
  }

  static void clearAllInstance() {
    _hiddenNumberSet.clear();
    enteredNumberList.clear();
    draftNumberList.clear();
    buttonActiveList.clear();
    onPressedSelectedDraftNumberButton = null;
    onLongPressedSelectedDraftNumberButtonsList.clear();
    lastOnLongPressedSelectedDraftNumbersList.cast();
    lastOnPressedSelectedDraftNumber = null;
    onLongPressedSelectedEnteredNumber = null;
  }

  static void onDeleteButtonClick() {
    _generateClearDraftNumberList();
    _generateClearButtonActiveList();
    for (int i = 0; i < 4; i++) {
      if (!GameManager.onLongPressedSelectedDraftNumberButtonsList[i]) {
        GameManager.onPressedSelectedDraftNumberButton = i;
        return;
      }
    }
  }

  static void onCheckButtonClick() {
    if (!draftNumberList.contains('')) {
      enteredNumberList.add(draftNumberList);
      _generateClearDraftNumberList();
      _generateClearButtonActiveList();
      for (int i = 0; i < 4; i++) {
        if (!onLongPressedSelectedDraftNumberButtonsList[i]) {
          onPressedSelectedDraftNumberButton = i;
          return;
        }
      }
    }
  }

  static String checkResult(int index) {
    int cows = 0;
    int bulls = 0;

    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (enteredNumberList[index][i] == _hiddenNumberSet.elementAt(j)) {
          i == j ? bulls++ : cows++;
          break;
        }
      }
    }

    String result = '$cows cows \n $bulls bulls';
    return bulls == 4 ? 'You win!' : result;
  }
}
