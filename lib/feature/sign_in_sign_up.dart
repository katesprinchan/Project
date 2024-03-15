import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/colors_collection.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => __AuthPageState();
}

class __AuthPageState extends State<AuthPage> {
  final numberTextCtrl = TextEditingController();

  final passwordTextCtrl = TextEditingController();

  final confirmPasswordTextCtrl = TextEditingController();

  final isChecked = ValueNotifier(false);

  final isLoginPossible = ValueNotifier(false);

  final isRegisterPossible = ValueNotifier(false);

  final isPasswordVisible = ValueNotifier(false);

  final isConfirmPasswordVisible = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    isChecked.addListener(_registerListener);
    numberTextCtrl.addListener(_loginListener);
    passwordTextCtrl.addListener(_loginListener);
  }

  @override
  void dispose() {
    isChecked.removeListener(_registerListener);
    numberTextCtrl.removeListener(_loginListener);
    passwordTextCtrl.removeListener(_loginListener);
    super.dispose();
  }

  void _loginListener() {
    if (numberTextCtrl.text.isNotEmpty && passwordTextCtrl.text.isNotEmpty) {
      isLoginPossible.value = true;
    } else {
      isLoginPossible.value = false;
    }
  }

  void _registerListener() {
    if (isChecked.value) {
      isRegisterPossible.value = true;
    } else {
      isRegisterPossible.value = false;
    }
    return;
  }

  Widget get _tabBarBuilder => const TabBar(
        indicatorColor: ColorsCollection.primary,
        labelColor: ColorsCollection.primary,
        unselectedLabelColor: Color(0xFF4F4449),
        tabs: [
          Tab(text: 'Вход'),
          Tab(text: 'Регистрация'),
        ],
      );
  Widget get _tabViewBuilder => TabBarView(
        children: [
          _loginTabBuilder,
          _registerTabBuilder,
        ],
      );
  Widget get _loginTabBuilder => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _textFieldNumberBuilder,
            const SizedBox(height: 20),
            _textFieldPasswordBuilder,
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ValueListenableBuilder(
                valueListenable: isLoginPossible,
                builder: (context, value, child) => FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        isLoginPossible.value
                            ? ColorsCollection.primary
                            : ColorsCollection.inactiveButton),
                    foregroundColor: MaterialStateProperty.all(
                        isLoginPossible.value
                            ? Colors.white
                            : ColorsCollection.text),
                  ),
                  onPressed: isLoginPossible.value ? () => print('Log') : null,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: Text('Войти'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Обработка нажатия на кнопку "Забыли пароль?"
              },
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(ColorsCollection.primary),
              ),
              child: const Text('Забыли пароль?'),
            ),
          ],
        ),
      );
  Widget get _registerTabBuilder => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _textFieldNumberBuilder,
            const SizedBox(height: 20),
            _textFieldPasswordBuilder,
            const SizedBox(height: 20),
            _textFielConfirmdPasswordBuilder,
            const SizedBox(height: 20),
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isChecked,
                  builder: (context, isCheckedValue, child) {
                    return Checkbox(
                      value: isCheckedValue,
                      onChanged: (bool? value) {
                        if (value != null) {
                          isChecked.value = value;
                        }
                      },
                      activeColor: ColorsCollection.primary,
                    );
                  },
                ),
                const SizedBox(width: 35.0),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: [
                      const TextSpan(text: 'Я согласен с '),
                      TextSpan(
                        text: 'Правилами и условиями \nиспользования',
                        style: const TextStyle(color: ColorsCollection.primary),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ValueListenableBuilder(
                valueListenable: isRegisterPossible,
                builder: (context, value, child) => FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        isRegisterPossible.value
                            ? ColorsCollection.primary
                            : ColorsCollection.inactiveButton),
                    foregroundColor: MaterialStateProperty.all(
                        isRegisterPossible.value
                            ? Colors.white
                            : ColorsCollection.text),
                  ),
                  onPressed:
                      isRegisterPossible.value ? () => print('Log') : null,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: Text('Зарегистрироваться'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  Widget get _textFieldNumberBuilder => TextField(
        controller: numberTextCtrl,
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

  Widget get _textFieldPasswordBuilder => ValueListenableBuilder(
        valueListenable: isPasswordVisible,
        builder: (context, isVisible, child) {
          return TextField(
            controller: passwordTextCtrl,
            obscureText: !isVisible,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorsCollection.primary, width: 2.0),
                borderRadius: BorderRadius.circular(16.0),
              ),
              prefixIcon: const Icon(
                Icons.lock_outline_sharp,
                color: Color(0xFF81737A),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                ),
                color: const Color(0xFF81737A),
                onPressed: () {
                  isPasswordVisible.value =
                      !isPasswordVisible.value; // Переключаем значение
                },
              ),
              labelText: 'Пароль',
              floatingLabelStyle:
                  const TextStyle(color: ColorsCollection.primary),
            ),
          );
        },
      );
  Widget get _textFielConfirmdPasswordBuilder => ValueListenableBuilder(
        valueListenable: isConfirmPasswordVisible,
        builder: (context, isVisibleConfirm, child) {
          return TextField(
            controller: confirmPasswordTextCtrl,
            obscureText: !isVisibleConfirm,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: ColorsCollection.primary, width: 2.0),
                borderRadius: BorderRadius.circular(16.0),
              ),
              prefixIcon: const Icon(
                Icons.lock_outline_sharp,
                color: Color(0xFF81737A),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  isVisibleConfirm ? Icons.visibility : Icons.visibility_off,
                ),
                color: const Color(0xFF81737A),
                onPressed: () {
                  isConfirmPasswordVisible.value =
                      !isConfirmPasswordVisible.value; // Переключаем значение
                },
              ),
              labelText: 'Повторите пароль',
              floatingLabelStyle:
                  const TextStyle(color: ColorsCollection.primary),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color(0xFF81737A), size: 24.0),
            onPressed: () {
              // вернуться обратно
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.translate_outlined,
                  color: Color(0xFF81737A), size: 24.0),
              onPressed: () {
                // смена языка
              },
            ),
          ],
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_tabBarBuilder, Expanded(child: _tabViewBuilder)],
        ),
      ),
    );
  }
}
