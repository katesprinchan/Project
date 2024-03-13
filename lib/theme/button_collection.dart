import 'package:flutter/material.dart';

import 'colors_collection.dart';

ButtonStyle getButtonStyle(bool isTextEntered) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(isTextEntered
        ? ColorsCollection.primary
        : ColorsCollection.inactiveButton),
    foregroundColor: MaterialStateProperty.all(
        isTextEntered ? Colors.white : ColorsCollection.text),
  );
}
