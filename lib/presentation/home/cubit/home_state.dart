import 'package:equatable/equatable.dart';

import '../models/home_tab.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.tab,
  });

  final HomeTab tab;

  HomeState copyWith({
    HomeTab? tab,
  }) =>
      HomeState(
        tab: tab ?? this.tab,
      );

  @override
  List<Object> get props => [
        tab,
      ];
}
