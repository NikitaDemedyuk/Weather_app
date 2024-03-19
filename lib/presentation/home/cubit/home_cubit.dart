import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/home_tab.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(tab: HomeTab.todayForecast));

  void setTab(HomeTab tab) {
    emit(state.copyWith(tab: tab));
  }
}
