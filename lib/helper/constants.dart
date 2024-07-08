import 'package:flutter/material.dart';

double screenWidth(context) {
  return MediaQuery.sizeOf(context).width;
}

///////////////////////////////////////////////////////////

double screenHeight(context) {
  return MediaQuery.sizeOf(context).height;
}

double keyboardHeight(context) {
  return MediaQuery.of(context).viewInsets.bottom;
}

const kPrimaryColor = Color(0xff176B87);

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}