import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../theme/button_collection.dart';
import '../theme/colors_collection.dart';
import 'text_field.dart';

class SignInSignUp extends StatefulWidget {
  const SignInSignUp({Key? key}) : super(key: key);

  @override
  State<SignInSignUp> createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
  final TextEditingController number = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  bool _isChecked = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Количество вкладок
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
          bottom: const TabBar(
            indicatorColor: ColorsCollection.primary,
            labelColor: ColorsCollection.primary,
            unselectedLabelColor: Color(0xFF4F4449),
            tabs: [
              Tab(text: 'Вход'),
              Tab(text: 'Регистрация'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const TextFieldNumber(),
                  const SizedBox(height: 20),
                  TextfieldPassword(
                      controller: _controller, labelText: 'Пароль'),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: getButtonStyle(_controller.text.isNotEmpty),
                      onPressed: () {
                        // Обработка нажатия на кнопку "Войти"
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        child: Text('Войти'),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const TextFieldNumber(),
                  const SizedBox(height: 20),
                  const TextfieldPassword(labelText: 'Пароль'),
                  const SizedBox(height: 20),
                  TextfieldPassword(
                      controller: _controller, labelText: 'Повторите пароль'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        activeColor: ColorsCollection.primary,
                      ),
                      const SizedBox(width: 35.0),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                            const TextSpan(text: 'Я согласен с '),
                            TextSpan(
                              text: 'Правилами и условиями \nиспользования',
                              style: const TextStyle(
                                  color: ColorsCollection.primary),
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
                    child: ElevatedButton(
                      style: getButtonStyle(_controller.text.isNotEmpty),
                      onPressed: () {
                        // Обработка нажатия на кнопку "Зарегистрироваться"
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.0),
                        child: Text('Зарегистрироваться'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
