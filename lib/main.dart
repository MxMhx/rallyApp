import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rallymobile/bloc/blocs.dart';
import 'package:rallymobile/cubit/cubits.dart';
import 'package:rallymobile/configs/app_routes.dart';
import 'package:rallymobile/configs/theme.dart';
import 'package:rallymobile/repository/repositories.dart';
import 'package:rallymobile/screens/screens.dart';

void main() {
  Bloc.observer = const MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final AuthenticationRepository _authenticationRepository;

  @override
  void initState() {
    _authenticationRepository = AuthenticationRepository();
    super.initState();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
              value: (context) => _authenticationRepository)
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => AuthenticationBloc(
                    authenticationRepository: _authenticationRepository)),
            BlocProvider(
                create: (_) => LoginBloc(
                    authenticationRepository: _authenticationRepository)),
            BlocProvider(create: (_) => ThemeCubit()),
          ],
          child: AppView(
            appRouter: AppRouter(),
          ),
        ));
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeModeStatus>(
      builder: (context, themeMode) {
        return MaterialApp(
          theme: themeMode == ThemeMode.light ? appThemeLight : appThemeDark,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: widget.appRouter.onGenerateRoute,
          initialRoute: LoginScreen.routeName,
          navigatorKey: _navigatorKey,
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushNamedAndRemoveUntil<void>(
                      LoginScreen.routeName,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushNamedAndRemoveUntil<void>(
                      LoginScreen.routeName,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unknown:
                    break;
                }
              },
              child: child,
            );
          },
        );
      },
    );
  }
}
