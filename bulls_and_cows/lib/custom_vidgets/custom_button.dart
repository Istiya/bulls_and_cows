import 'package:flutter/material.dart';

abstract class CustomButton extends StatefulWidget {
  final TextStyle customButtonTextStyle = const TextStyle(
      fontFamily: 'AmaticSc',
      color: Color(0xFF6D4951),
      fontSize: 45,
      fontWeight: FontWeight.bold);

  const CustomButton({Key? key}) : super(key: key);
}
