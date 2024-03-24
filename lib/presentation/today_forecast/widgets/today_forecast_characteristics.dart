import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/today_forecast_cubit.dart';
import 'characteristic_widget.dart';

class TodayForecastCharacteristics extends StatelessWidget {
  const TodayForecastCharacteristics({super.key});

  @override
  Widget build(BuildContext context) {
    final todayForecast = context.select((TodayForecastCubit cubit) => cubit.state.todayForecast);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CharacteristicWidget(
                text: '${todayForecast.main?.humidity ?? 0} %',
                iconData: CupertinoIcons.cloud_rain,
              ),
            ),
            Expanded(
              child: CharacteristicWidget(
                text: '${todayForecast.rain?.d1h ?? todayForecast.rain?.d3h ?? 0} mm',
                iconData: Icons.water_drop_outlined,
              ),
            ),
            Expanded(
              child: CharacteristicWidget(
                text: '${todayForecast.main?.grndLevel ?? 0} hPa',
                iconData: Icons.device_thermostat,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: CharacteristicWidget(
                text: '${todayForecast.wind?.speed ?? 0} m/s',
                iconData: Icons.wind_power,
              ),
            ),
            Expanded(
              child: CharacteristicWidget(
                text: '${todayForecast.wind?.deg ?? 0}',
                iconData: CupertinoIcons.compass,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
