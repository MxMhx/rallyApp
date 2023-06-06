import 'package:flutter/material.dart';
import 'package:rallymobile/widgets/adaptive_progress_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  static const routeName = '/loading';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoadingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Rally App',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
              textScaleFactor: 1,
            ),
            const SizedBox(
              height: 30,
            ),
            const AdaptiveProgressIndicator(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
