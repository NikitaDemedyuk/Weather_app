import 'package:equatable/equatable.dart';

import '../../domain/entities/snow.dart';

class SnowModel extends Equatable {
  final double? d1h;
  final double? d3h;

  const SnowModel({
    this.d1h,
    this.d3h,
  });

  SnowModel.fromJson(Map<String, dynamic> json)
      : d1h = json['1h'],
        d3h = json['3h'];

  Snow toEntity() => Snow(d1h: d1h, d3h: d3h);

  @override
  List<Object?> get props => [d1h, d3h];
}
