import 'package:flutter/cupertino.dart';
import 'package:weather_app/domain/entities/weather_forecast.dart';

class CurrentTimeForecast extends StatelessWidget {
  final WeatherForecast currentForecast;

  const CurrentTimeForecast({
    required this.currentForecast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.sunset_fill,
        ),
        Column(
          children: [
            Text('${currentForecast.dtTxt?.hour ?? 0}: ${currentForecast.dtTxt?.minute ?? 0}'),
            const SizedBox(height: 5),
            Text(currentForecast.weather?.first.description ?? ''),
          ],
        ),
        Text('${currentForecast.main?.temp ?? 0}'),
      ],
    );
  }
}
