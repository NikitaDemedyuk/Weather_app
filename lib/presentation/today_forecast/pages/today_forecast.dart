import 'package:flutter/material.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({super.key});

  @override
  Widget build(BuildContext context) => const TodayForecastView();
}

class TodayForecastView extends StatelessWidget {
  const TodayForecastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}