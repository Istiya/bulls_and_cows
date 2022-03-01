class NumberList {
  static List<List<String>> numberList = [];
  static List<String> draftNumber = ['', '', '', ''];
  static List<bool> buttonActiveList = List.filled(9, true);

  static void delete() {
    draftNumber = ['', '', '', ''];
  }
}
