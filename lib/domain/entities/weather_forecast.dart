import 'package:equatable/equatable.dart';
import 'package:weather_app/domain/entities/snow.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main_info.dart';
import 'rain.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class WeatherForecast extends Equatable {
  final Coord? coord;
  final List<Weather>? weather;
  final String? baseParametr;
  final MainInfo? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Snow? snow;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int id;
  final String? name;
  final int? cod;
  final DateTime? dtTxt;

  const WeatherForecast.empty():
    id = 0,
    coord = null,
    weather = null,
    baseParametr = null,
    main = null,
    visibility = null,
    wind = null,
    rain = null,
    snow = null, 
    clouds = null,
    dt = null,
    sys = null,
    timezone = null,
    name = null,
    cod = null,
    dtTxt = null;

  const WeatherForecast({
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

  
  @override
  List<Object?> get props => [
        id,
        coord,
        weather,
        baseParametr,
        main,
        visibility,
        wind,
        rain,
        snow,
        clouds,
        dt,
        sys,
        timezone,
        name,
        cod,
        dtTxt,
      ];
}
