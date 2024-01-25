class CarModel {
  final String? make;
  final String? model;
  final String? year;

  CarModel (
    this.make, 
    this.model,
    this.year
    );  

  factory CarModel.fromJson(dynamic json) {
    return CarModel(json['make'] as String, json['model'] as String, json['year'] as String);
  }

  @override
  String toString() {
    return '{ $make $model $year}';
  }
}