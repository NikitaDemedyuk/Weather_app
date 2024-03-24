import 'package:weather_app/data/models/weather_forecast_model.dart';

import '../../domain/entities/weather_forecast.dart';
import '../../domain/repositories/weather_repository.dart';
import '../api/api_client.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiClient _apiClient;

  const WeatherRepositoryImpl({
    required ApiClient apiClient
  })  : _apiClient = apiClient
        ;
  @override
  Future<WeatherForecast> getCurrentWeather({
    required String token,
    required double lat,
    required double lon,
  }) async {

    final response = await _apiClient.get(
      '/data/2.5/weather',
      queryParameters: {
        'appid': token,
        'lat': lat,
        'lon': lon,
        'units': 'metric',
      },
    );

    final weatherForecastModel = WeatherForecastModel.fromJson(response);
    final weatherForecast = weatherForecastModel.toEntity();

    return weatherForecast;
  }

  @override
  Future<List<WeatherForecast>> getWeeklyForecast({
    required String token,
    required double lat,
    required double lon,
  }) async {
  
    final response = await _apiClient.get(
      '/data/2.5/forecast',
      queryParameters: {
        'appid': token,
        'lat': lat,
        'lon': lon,
        'units': 'metric',
      },
    );

    final weatherForecastModelList =
        (response['list'] as List).map((item) => WeatherForecastModel.fromJson(item));

    final weatherForecastList = weatherForecastModelList.map((item) => item.toEntity()).toList();

    return weatherForecastList;
  }
}
