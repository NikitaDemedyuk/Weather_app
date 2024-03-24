import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/today_forecast/cubit/today_forecast_state.dart';
import 'package:weather_app/presentation/today_forecast/widgets/today_forecast_characteristics.dart';
import 'package:weather_app/presentation/today_forecast/widgets/today_forecast_header.dart';

import '../../common_components/activity_indicator.dart';
import '../cubit/today_forecast_cubit.dart';
import 'share_button.dart';

class TodayForecastBody extends StatelessWidget {
  const TodayForecastBody({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((TodayForecastCubit cubit) => cubit.state.backgroundStatus);

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
    return ListView(
      children: const [
        TodayForecastHeader(),
        SizedBox(height: 50),
        TodayForecastCharacteristics(),
        SizedBox(height: 20),
        ShareButton(),
      ],
    );
  }
}
