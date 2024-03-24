import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/weather_forecast.dart';

enum TodayForecastBackgroundStatus { initial, loading, success, failure }

extension TodayForecastBackgroundStatusExtension on TodayForecastBackgroundStatus {
  bool get isInitial => this == TodayForecastBackgroundStatus.initial;
  bool get isLoading => this == TodayForecastBackgroundStatus.loading;
  bool get isSuccess => this == TodayForecastBackgroundStatus.success;
  bool get isFailure => this == TodayForecastBackgroundStatus.failure;
}

class TodayForecastState extends Equatable {
  const TodayForecastState({
    this.todayForecast = const WeatherForecast.empty(),
    this.backgroundStatus = TodayForecastBackgroundStatus.initial,
    this.errorMessage = '',
  });

  final WeatherForecast todayForecast;
  final TodayForecastBackgroundStatus backgroundStatus;
  final String errorMessage;

  TodayForecastState copyWith({
    WeatherForecast? todayForecast,
    TodayForecastBackgroundStatus? backgroundStatus,
    String? errorMessage,
  }) =>
      TodayForecastState(
        todayForecast: todayForecast ?? this.todayForecast,
        backgroundStatus: backgroundStatus ?? this.backgroundStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [todayForecast, backgroundStatus, errorMessage];
}
