import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/presentation/today_forecast/cubit/today_forecast_cubit.dart';
import 'package:weather_app/presentation/weekly_forecast/cubit/weekly_forecast_cubit.dart';

import 'app_constants.dart';
import 'data/api/api_client.dart';
import 'data/repositories/location_repository_impl.dart';
import 'data/repositories/token_repository_impl.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'domain/repositories/location_repository.dart';
import 'domain/repositories/token_repository.dart';
import 'domain/repositories/weather_repository.dart';
import 'presentation/home/cubit/home_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(
    () => ApiClient(
      baseUrl: AppConstants.serverUrl,
      dio: Dio(),
    ),
  );

  locator.registerLazySingleton<TokenRepository>(
    () => const TokenRepositoryImpl(),
  );

  locator.registerLazySingleton<LocationRepository>(
    () => const LocationRepositoryImpl(),
  );

  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      apiClient: locator(),
    ),
  );

  locator.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );

  locator.registerLazySingleton<TodayForecastCubit>(
    () => TodayForecastCubit(
      tokenRepository: locator(), 
      weatherRepository: locator(), 
      locationRepository: locator(),
    ),
  );

  locator.registerLazySingleton<WeeklyForecastCubit>(
    () => WeeklyForecastCubit(
      tokenRepository: locator(),
      weatherRepository: locator(),
      locationRepository: locator(),
    ),
  );

}
