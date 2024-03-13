import 'package:flutter/material.dart';

import '../theme/colors_collection.dart';

class TextfieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;

  const TextfieldPassword({
    Key? key,
    this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  TextfieldPasswordState createState() => TextfieldPasswordState();
}

class TextfieldPasswordState extends State<TextfieldPassword> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsCollection.primary, width: 2.0),
          borderRadius: BorderRadius.circular(16.0),
        ),
        prefixIcon: const Icon(
          Icons.lock_outline_sharp,
          color: Color(0xFF81737A),
        ),
        suffixIcon: IconButton(
          icon: Icon(
              _obscureText ? Icons.visibility_off_outlined : Icons.visibility),
          color: const Color(0xFF81737A),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        labelText: widget.labelText,
        floatingLabelStyle: const TextStyle(color: ColorsCollection.primary),
      ),
    );
  }
}

class TextFieldNumber extends StatelessWidget {
  const TextFieldNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
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
        labelText: 'Телефон',
        floatingLabelStyle: const TextStyle(color: ColorsCollection.primary),
      ),
    );
  }
}
