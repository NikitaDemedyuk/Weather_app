import 'package:equatable/equatable.dart';

import '../../domain/entities/clouds.dart';

class CloudsModel extends Equatable {
  final int? all;

  const CloudsModel({this.all});

  CloudsModel.fromJson(Map<String, dynamic> json) : all = json['all'];

  Clouds toEntity() => Clouds(all: all);

  @override
  List<Object?> get props => [all];
}
