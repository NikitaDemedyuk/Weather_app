import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/today_forecast/cubit/today_forecast_cubit.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => context.read<TodayForecastCubit>().shareTodayForecast(),
      child: const Text(
        'Share',
        style: TextStyle(
          color: CupertinoColors.activeOrange,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}