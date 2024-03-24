import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/today_forecast/cubit/today_forecast_cubit.dart';
import 'package:weather_app/presentation/today_forecast/cubit/today_forecast_state.dart';
import 'package:weather_app/presentation/today_forecast/widgets/today_forecast_body.dart';

import '../../utils/dialog_utils.dart';

class TodayForecast extends StatelessWidget {
  const TodayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodayForecastCubit, TodayForecastState>(
      listenWhen: (previous, current) =>
          previous.backgroundStatus != current.backgroundStatus ||
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.backgroundStatus.isFailure &&
              state.errorMessage.isNotEmpty) {
            DialogUtils.showInfoDialog(
              context: context,
              title: 'Something went wrong',
              description: state.errorMessage,
              applyText: 'Ок',
            );
          }
      },
      child: const TodayForecastView(),
    );
  }
}

class TodayForecastView extends StatefulWidget {
  const TodayForecastView({super.key});

  @override
  State<TodayForecastView> createState() => _TodayForecastViewState();
}

class _TodayForecastViewState extends State<TodayForecastView> {
  @override
  void initState() {
    super.initState();

    final todayForecastCubit = context.read<TodayForecastCubit>();

    todayForecastCubit.fetchCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: const SafeArea(
        child: TodayForecastBody(),
      ),
    );
  }
}
