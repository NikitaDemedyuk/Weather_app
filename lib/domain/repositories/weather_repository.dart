import 'package:weather_app/domain/entities/weather_forecast.dart';

abstract class WeatherRepository {
  Future<WeatherForecast> getCurrentWeather({
    required String token,
    required double lat,
    required double lon,
  });

  Future<List<WeatherForecast>> getWeeklyForecast({
    required String token,
    required double lat,
    required double lon,
  });
}
