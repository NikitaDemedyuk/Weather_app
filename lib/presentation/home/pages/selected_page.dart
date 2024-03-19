import 'package:flutter/material.dart';
import 'package:weather_app/presentation/weekly_forecast/pages/weekly_forecast.dart';

import '../../today_forecast/pages/today_forecast.dart';
import '../models/home_tab.dart';

class SelectedPage extends StatelessWidget {
  const SelectedPage({
    required this.tab,
    super.key,
  });

  final HomeTab tab;

  @override
  Widget build(BuildContext context) {
    switch (tab) {
      case HomeTab.todayForecast:
        return const TodayForecast();

      case HomeTab.weeklyForecast:
        return const WeeklyForecast();

      default:
        return const SizedBox.shrink();
    }
  }
}