import 'package:equatable/equatable.dart';

import '../../domain/entities/sys.dart';

class SysModel extends Equatable {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;

  const SysModel({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  SysModel.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        id = json['id'],
        country = json['country'],
        sunrise = json['sunrise'],
        sunset = json['sunset'];

  Sys toEntity() => Sys(
        type: type,
        id: id,
        country: country,
        sunrise: sunrise,
        sunset: sunset,
      );

  @override
  List<Object?> get props => [
        id,
        country,
        sunrise,
        sunset,
      ];
}
