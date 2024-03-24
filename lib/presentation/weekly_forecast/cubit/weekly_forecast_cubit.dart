import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/location_repository.dart';
import '../../../domain/repositories/token_repository.dart';
import '../../../domain/repositories/weather_repository.dart';
import 'weekly_forecast_state.dart';

class WeeklyForecastCubit extends Cubit<WeeklyForecastState> {
  final TokenRepository _tokenRepository;
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;

  WeeklyForecastCubit({
    required TokenRepository tokenRepository,
    required WeatherRepository weatherRepository,
    required LocationRepository locationRepository,
  })  : _tokenRepository = tokenRepository,
        _weatherRepository = weatherRepository,
        _locationRepository = locationRepository,
        super(const WeeklyForecastState());

  Future<void> fetchWeeklyForecast() async {
    emit(state.copyWith(backgroundStatus: WeeklyForecastBackgroundStatus.loading));

    try {
      final token = _tokenRepository.getToken();

      final weeklyForecast = await _weatherRepository.getWeeklyForecast(
        token: token,
        lat: 44.34,
        lon: 10.99,
      );

      emit(state.copyWith(
        weeklyForecast: weeklyForecast,
        backgroundStatus: WeeklyForecastBackgroundStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(
        backgroundStatus: WeeklyForecastBackgroundStatus.failure,
        errorMessage: 'Something went wrong with loading today forecast information.'
      ));
    }
  }
}
