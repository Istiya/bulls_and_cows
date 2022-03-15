class NumberList {
  static List<List<String>> numberList = [];
  static List<String> draftNumber = ['', '', '', ''];
  static List<bool> buttonActiveList = List.filled(9, true);
  static List<bool> buttonDraftNumber = List.filled(4, false);

  static void delete() {
    draftNumber = ['', '', '', ''];
  }
}
