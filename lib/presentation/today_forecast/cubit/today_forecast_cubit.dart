import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/repositories/location_repository.dart';

import '../../../domain/repositories/token_repository.dart';
import '../../../domain/repositories/weather_repository.dart';
import 'package:flutter/services.dart';
import 'today_forecast_state.dart';

class TodayForecastCubit extends Cubit<TodayForecastState> {
  final TokenRepository _tokenRepository;
  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;

  TodayForecastCubit({
    required TokenRepository tokenRepository,
    required WeatherRepository weatherRepository,
    required LocationRepository locationRepository,
  })  : _tokenRepository = tokenRepository,
        _weatherRepository = weatherRepository,
        _locationRepository = locationRepository,
        super(const TodayForecastState());

  Future<void> fetchCurrentWeather() async {
    emit(state.copyWith(backgroundStatus: TodayForecastBackgroundStatus.loading));

    try {
      final token = _tokenRepository.getToken();

      final todayForecast = await _weatherRepository.getCurrentWeather(
        token: token,
        lat: 44.34,
        lon: 10.99,
      );

      emit(state.copyWith(
        todayForecast: todayForecast,
        backgroundStatus: TodayForecastBackgroundStatus.success,
      ));
    } catch (_) {
      emit(state.copyWith(
        backgroundStatus: TodayForecastBackgroundStatus.failure,
        errorMessage: 'Something went wrong with loading today forecast information.'
      ));
    }
  }

  Future<void> shareTodayForecast() async {
    await Clipboard.setData(ClipboardData(text: '${state.todayForecast.main?.temp ?? 0}'));
  }
}
