import 'package:equatable/equatable.dart';

import '../../../domain/entities/weather_forecast.dart';

enum WeeklyForecastBackgroundStatus { initial, loading, success, failure }

extension WeeklyForecastBackgroundStatusExtension on WeeklyForecastBackgroundStatus {
  bool get isInitial => this == WeeklyForecastBackgroundStatus.initial;
  bool get isLoading => this == WeeklyForecastBackgroundStatus.loading;
  bool get isSuccess => this == WeeklyForecastBackgroundStatus.success;
  bool get isFailure => this == WeeklyForecastBackgroundStatus.failure;
}


class WeeklyForecastState extends Equatable {
  const WeeklyForecastState({
    this.weeklyForecast = const [],
    this.backgroundStatus = WeeklyForecastBackgroundStatus.initial,
    this.errorMessage = '',
  });

  final List<WeatherForecast> weeklyForecast;
  final WeeklyForecastBackgroundStatus backgroundStatus;
  final String errorMessage;

  WeeklyForecastState copyWith({
    List<WeatherForecast>? weeklyForecast,
    WeeklyForecastBackgroundStatus? backgroundStatus,
    String? errorMessage,
  }) =>
      WeeklyForecastState(
        weeklyForecast: weeklyForecast ?? this.weeklyForecast,
        backgroundStatus: backgroundStatus ?? this.backgroundStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object> get props => [weeklyForecast, backgroundStatus, errorMessage];
}
