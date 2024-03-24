import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/today_forecast_cubit.dart';

class TodayForecastHeader extends StatelessWidget {
  const TodayForecastHeader({super.key});

  @override
  Widget build(BuildContext context) {
    
    final todayForecast = context.select((TodayForecastCubit cubit) => cubit.state.todayForecast);
    
    return Column(
      children: [
        const SizedBox(height: 20),
        const Icon(
          Icons.sunny,
          size: 108,
        ),
        const SizedBox(height: 10),
        Text(
          '${todayForecast.name ?? ''}, ${todayForecast.sys?.country ?? ''}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${todayForecast.main?.temp ?? 0} °C | ${todayForecast.weather?.first.main ?? ''}',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ],
    );
  }
}