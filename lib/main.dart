import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/injection.dart';
import 'package:weather_app/presentation/home/pages/home_page.dart';
import 'package:weather_app/routes.dart';

import 'presentation/home/cubit/home_cubit.dart';
import 'presentation/today_forecast/cubit/today_forecast_cubit.dart';
import 'presentation/weekly_forecast/cubit/weekly_forecast_cubit.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: locator<HomeCubit>()),
          BlocProvider.value(value: locator<TodayForecastCubit>()),
          BlocProvider.value(value: locator<WeeklyForecastCubit>()),
        ],
        child: const AppView(),
      );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: 'Weather app!',
      restorationScopeId: 'weather_app',
      // theme: CupertinoThemeData(
      //   brightness: Brightness.light,
      //   primaryColor: CupertinoColors.systemPurple,
      //   primaryContrastingColor: CupertinoColors.activeGreen,
      //   scaffoldBackgroundColor: CupertinoColors.white,
      //   //barBackgroundColor: primaryColor,
      // ),
      color: CupertinoColors.systemPurple,
      //supportedLocales: supportedLocales,
      //locale: initialLocale,
      // builder: (context, child) => const HomePage(),
      //builder: (_, child) => (),
    );
  }
}
