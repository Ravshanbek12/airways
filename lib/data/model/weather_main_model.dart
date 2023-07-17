import 'package:n8_default_project/data/model/clouds/clouds_model.dart';
import 'package:n8_default_project/data/model/crood/crood_model.dart';
import 'package:n8_default_project/data/model/main/main_model.dart';
import 'package:n8_default_project/data/model/sys/sys_model.dart';
import 'package:n8_default_project/data/model/weather/weather_model.dart';
import 'package:n8_default_project/data/model/wind/wind_model.dart';

class WeatherMainModel {
  final CroodModel croodModel;
  final List<WeatherModel> weatherModel;
  final String base;
  final MainModel mainModel;
  final int visibility;
  final WindModel windModel;
  final CloudsModel cloudsModel;
  final int dt;
  final SysModel sysModel;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherMainModel({
    required this.croodModel,
    required this.weatherModel,
    required this.base,
    required this.mainModel,
    required this.visibility,
    required this.windModel,
    required this.cloudsModel,
    required this.dt,
    required this.sysModel,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) {
    return WeatherMainModel(
      croodModel: CroodModel.fromJson(json["crood"]),
      weatherModel: (json["weather"] as List)
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      base: json['base'],
      mainModel: MainModel.fromJson(json['main']),
      visibility: json['visibility'],
      windModel: WindModel.fromJson(json['wind']),
      cloudsModel: CloudsModel.fromJson(json['clouds']),
      dt: json['dt'],
      sysModel: SysModel.fromJson(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
