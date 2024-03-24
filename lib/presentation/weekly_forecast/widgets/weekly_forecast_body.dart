import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/weekly_forecast/cubit/weekly_forecast_state.dart';
import 'package:weather_app/presentation/weekly_forecast/widgets/current_time_forecast.dart';

import '../../common_components/activity_indicator.dart';
import '../cubit/weekly_forecast_cubit.dart';

class WeeklyForecastBody extends StatelessWidget {
  const WeeklyForecastBody({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((WeeklyForecastCubit cubit) => cubit.state.backgroundStatus);

    if (status.isLoading) {
      return const _Loading();
    }

    if (status.isFailure) {
      return const _Failure();
    }

    if (status.isSuccess) {
      return const _Success();
    }

    return const SizedBox.shrink();
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) => const ActivityIndicator();
}

class _Failure extends StatelessWidget {
  const _Failure();

  @override
  Widget build(BuildContext context) => const Text(
        'Something went wrong with loading weather forecast.',
      );
}

class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    final weeklyForecast =
        context.select((WeeklyForecastCubit cubit) => cubit.state.weeklyForecast);

    return ListView.separated(
      itemCount: weeklyForecast.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, index) => CurrentTimeForecast(currentForecast: weeklyForecast[index]),
    );
  }
}
