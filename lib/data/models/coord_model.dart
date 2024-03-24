import 'package:equatable/equatable.dart';

import '../../domain/entities/coord.dart';

class CoordModel extends Equatable {
  final double? lon;
  final double? lat;

  const CoordModel({
    this.lon,
    this.lat,
  });

  CoordModel.fromJson(Map<String, dynamic> json)
      : lon = json['lon'],
        lat = json['lat'];

  Coord toEntity() => Coord(
        lat: lat,
        lon: lon,
      );

  @override
  List<Object?> get props => [lon, lat];
}
