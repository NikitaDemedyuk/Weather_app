import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/injection.dart';
import 'package:weather_app/presentation/home/pages/home_page.dart';
import 'package:weather_app/presentation/weekly_forecast/pages/weekly_forecast.dart';

import 'presentation/home/cubit/home_cubit.dart';
import 'presentation/today_forecast/cubit/today_forecast_cubit.dart';
import 'presentation/today_forecast/pages/today_forecast.dart';
import 'presentation/weekly_forecast/cubit/weekly_forecast_cubit.dart';

enum AppRoutes {
  home('/'),
  todayForecast('/today_forecast'),
  weeklyForecast('/weekly_forecast');

  final String route;

  const AppRoutes(this.route);
}

abstract class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;
  static BuildContext get currentContext => _rootNavigatorKey.currentContext!;

  static final _router = GoRouter(
    initialLocation:AppRoutes.home.route,
    navigatorKey: _rootNavigatorKey,
    errorBuilder: (context, state) => const SizedBox.shrink(),
    routes: [
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.route,
        builder: (context, state) => BlocProvider(
          create: (context) => locator<HomeCubit>(),
          child: const HomePage(),
        ),
      ),
    ],
  );
}
