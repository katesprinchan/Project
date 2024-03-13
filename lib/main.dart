import 'package:flutter/material.dart';

import 'feature/sign_in_sign_up.dart';
import 'theme/colors_collection.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Купи и точка',
      routes: {
        '/': (context) => const LoadingPage(),
        '/sign': (context) => const SignInSignUp(),
      },
      initialRoute: '/',
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/sign');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Center(
            child: Image.asset("assets/image/logo.png"),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: CircularProgressIndicator(color: ColorsCollection.primary),
            ),
          ),
        ],
      ),
    );
  }
}
