//import 'package:json_annotation/json_annotation.dart';

//@JsonSerializable()
class Car {
  int? id;
  String? make;
  String? model;
  String? year;

  Car({this.id, this.make, this.model, this.year});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    make = json['make'] as String?;
    model = json['model'] as String?;
    year = json['year'] as String?;
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'make' : make,
    'model' : model,
    'year' : year
  };
}