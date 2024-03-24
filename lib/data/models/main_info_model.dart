import 'package:equatable/equatable.dart';

import '../../domain/entities/main_info.dart';

class MainInfoModel extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;

  const MainInfoModel({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  MainInfoModel.fromJson(Map<String, dynamic> json)
      : temp = json['temp'],
        feelsLike = json['feels_like'],
        tempMin = json['temp_min'],
        tempMax = json['temp_max'],
        pressure = json['pressure'],
        humidity = json['humidity'],
        seaLevel = json['sea_level'],
        grndLevel = json['grnd_level'];

  MainInfo toEntity() => MainInfo(
        temp: temp,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
        seaLevel: seaLevel,
        grndLevel: grndLevel,
      );

  @override
  List<Object?> get props => [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        humidity,
        seaLevel,
        grndLevel,
      ];
}
