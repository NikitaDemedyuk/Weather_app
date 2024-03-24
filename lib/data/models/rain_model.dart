import 'package:equatable/equatable.dart';

import '../../domain/entities/rain.dart';

class RainModel extends Equatable {
  final double? d1h;
  final double? d3h;

  const RainModel({
    this.d1h,
    this.d3h,
  });

  RainModel.fromJson(Map<String, dynamic> json)
      : d1h = json['1h'],
        d3h = json['3h'];

  Rain toEntity() => Rain(d1h: d1h, d3h: d3h);

  @override
  List<Object?> get props => [d1h, d3h];
}
