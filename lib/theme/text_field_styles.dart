import 'package:flutter/material.dart';

import 'colors_collection.dart';

class TextFieldPasswordStyles {
  static InputDecoration getInputDecoration({
    required String labelText,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsCollection.primary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(16.0),
      ),
      prefixIcon: const Icon(
        Icons.lock_outline_sharp,
        color: Color(0xFF81737A),
      ),
      labelText: labelText,
      floatingLabelStyle: const TextStyle(color: ColorsCollection.primary),
    );
  }
}

class TextFieldNumberStyles {
  static InputDecoration getInputDecoration({
    required String labelText,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: ColorsCollection.primary, width: 2.0),
        borderRadius: BorderRadius.circular(16.0),
      ),
      prefixIcon: const Icon(
        Icons.phone_outlined,
        color: Color(0xFF81737A),
      ),
      labelText: labelText,
      floatingLabelStyle: const TextStyle(color: ColorsCollection.primary),
    );
  }
}
