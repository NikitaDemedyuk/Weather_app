import 'package:equatable/equatable.dart';

import '../../domain/entities/weather.dart';

class WeatherModel extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const WeatherModel({this.id, this.main, this.description, this.icon});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        main = json['main'],
        description = json['description'],
        icon = json['icon'];

  Weather toEntity() => Weather(
        id: id,
        main: main,
        description: description,
        icon: icon,
      );

  @override
  List<Object?> get props => [id, main, description, icon];
}
