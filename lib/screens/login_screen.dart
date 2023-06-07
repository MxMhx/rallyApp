import 'package:flutter/material.dart';
import 'package:rallymobile/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = 'login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: Theme.of(context).secondaryHeaderColor,
          ),
          WaveWidget(size: size, yOffset: size.height / 4.0, color: Colors.red),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(color: Theme.of(context).primaryColor),
              )
            ]),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LoginForm(),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  title: 'Login',
                  border: false,
                  onPressed: () {},
                ),
                ButtonWidget(
                  title: 'Sign Up',
                  border: true,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
