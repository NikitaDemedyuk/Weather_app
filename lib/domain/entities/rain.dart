import 'package:equatable/equatable.dart';

class Rain extends Equatable {
  final double? d1h;
  final double? d3h;

  const Rain({this.d1h, this.d3h,});

  @override
  List<Object?> get props => [d1h, d3h];
}
