import 'package:flutter_bloc/flutter_bloc.dart';

import 'today_forecast_state.dart';

class TodayForecastCubit extends Cubit<TodayForecastState> {
  TodayForecastCubit() : super(const TodayForecastState());
}
