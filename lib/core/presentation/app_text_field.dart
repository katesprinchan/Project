import 'package:dex_course/core/presentation/app_text_field/app_text_editing_controller.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final AppTextEditingController controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool obscureText;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obs(
        rvList: [controller.errorText],
        builder: (context) {
          return TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorsCollection.onSurfaceVariant,
                  ),
              floatingLabelStyle:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorsCollection.primary,
                      ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor: ColorsCollection.outline,
              suffixIconColor: ColorsCollection.outline,
              errorText: controller.errorText(),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsCollection.outline,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          );
        });
  }
}

class AppNumberTextField extends StatelessWidget {
  final AppTextEditingController controller;

  const AppNumberTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obs(
        rvList: [controller.errorText],
        builder: (context) {
          return TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ColorsCollection.onSurfaceVariant,
                  ),
              floatingLabelStyle:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorsCollection.primary,
                      ),
              errorText: controller.errorText(),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorsCollection.outline,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsCollection.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            ),
          );
        });
  }
}
