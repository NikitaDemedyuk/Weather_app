import 'package:equatable/equatable.dart';
import 'package:weather_app/data/models/coord_model.dart';
import 'package:weather_app/domain/entities/weather_forecast.dart';

import 'clouds_model.dart';
import 'main_info_model.dart';
import 'rain_model.dart';
import 'snow_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class WeatherForecastModel extends Equatable {
  final CoordModel? coord;
  final List<WeatherModel>? weather;
  final String? baseParametr;
  final MainInfoModel? main;
  final int? visibility;
  final WindModel? wind;
  final RainModel? rain;
  final SnowModel? snow;
  final CloudsModel? clouds;
  final int? dt;
  final SysModel? sys;
  final int? timezone;
  final int id;
  final String? name;
  final int? cod;
  final DateTime? dtTxt;

  const WeatherForecastModel({
    required this.id,
    this.coord,
    this.weather,
    this.baseParametr,
    this.main,
    this.visibility,
    this.wind,
    this.rain,
    this.snow,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.name,
    this.cod,
    this.dtTxt,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    final weather = <WeatherModel>[];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(WeatherModel.fromJson(v));
      });
    }
    return WeatherForecastModel(
      id: json['id'] ?? 0,
      coord: json['coord'] != null ? CoordModel.fromJson(json['coord']) : null,
      baseParametr: json['base'],
      main: json['main'] != null ? MainInfoModel.fromJson(json['main']) : null,
      visibility: json['visibility'],
      wind: json['wind'] != null ? WindModel.fromJson(json['wind']) : null,
      rain: json['rain'] != null ? RainModel.fromJson(json['rain']) : null,
      snow: json['snow'] != null ? SnowModel.fromJson(json['snow']) : null,
      clouds: json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null,
      dt: json['dt'],
      sys: json['sys'] != null ? SysModel.fromJson(json['sys']) : null,
      timezone: json['timezone'],
      name: json['name'],
      cod: json['cod'],
      weather: weather,
      dtTxt: json['dt_txt'] != null ? DateTime.tryParse(json['dt_txt']) : null,
    );
  }

  WeatherForecast toEntity() => WeatherForecast(
        id: id,
        coord: coord?.toEntity(),
        weather: weather?.map((item) => item.toEntity()).toList(),
        baseParametr: baseParametr,
        main: main?.toEntity(),
        visibility: visibility,
        wind: wind?.toEntity(),
        rain: rain?.toEntity(),
        snow: snow?.toEntity(),
        clouds: clouds?.toEntity(),
        dt: dt,
        sys: sys?.toEntity(),
        timezone: timezone,
        name: name,
        cod: cod,
        dtTxt: dtTxt,
      );

  @override
  List<Object?> get props => [
        baseParametr,
        main,
        visibility,
        wind,
        rain,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
        dtTxt,
      ];
}
