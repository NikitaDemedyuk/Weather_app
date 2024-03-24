import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/dialog_utils.dart';
import '../cubit/weekly_forecast_cubit.dart';
import '../cubit/weekly_forecast_state.dart';
import '../widgets/weekly_forecast_body.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WeeklyForecastCubit, WeeklyForecastState>(
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
      child: const WeeklyForecastView(),
    );
  }
}

class WeeklyForecastView extends StatefulWidget {
  const WeeklyForecastView({super.key});

  @override
  State<WeeklyForecastView> createState() => _WeeklyForecastViewState();
}

class _WeeklyForecastViewState extends State<WeeklyForecastView> {
  
  @override
  void initState() {
    super.initState();

    final weeklyForecastCubit = context.read<WeeklyForecastCubit>();

    weeklyForecastCubit.fetchWeeklyForecast();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Today'),
      ),
      body: const SafeArea(
        child: WeeklyForecastBody(),
      ),
    );
  }
}