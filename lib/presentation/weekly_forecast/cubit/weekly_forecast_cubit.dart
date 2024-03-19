import 'package:flutter_bloc/flutter_bloc.dart';

import 'weekly_forecast_state.dart';

class WeeklyForecastCubit extends Cubit<WeeklyForecastState> {
  WeeklyForecastCubit() : super(const WeeklyForecastState());
}
