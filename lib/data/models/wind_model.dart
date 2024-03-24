import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/wind.dart';

class WindModel extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const WindModel({this.speed, this.deg, this.gust});

  WindModel.fromJson(Map<String, dynamic> json)
      : speed = json['speed'],
        deg = json['deg'],
        gust = json['gust'];

  Wind toEntity() => Wind(
        speed: speed,
        deg: deg,
        gust: gust,
      );

  @override
  List<Object?> get props => [speed, deg, gust];
}
