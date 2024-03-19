import 'package:get_it/get_it.dart';
import 'package:weather_app/presentation/today_forecast/cubit/today_forecast_cubit.dart';
import 'package:weather_app/presentation/weekly_forecast/cubit/weekly_forecast_cubit.dart';

import 'presentation/home/cubit/home_cubit.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton<HomeCubit>(
    () => HomeCubit(),
  );

  locator.registerLazySingleton<TodayForecastCubit>(
    () => TodayForecastCubit(),
  );

  locator.registerLazySingleton<WeeklyForecastCubit>(
    () => WeeklyForecastCubit(),
  );
}
