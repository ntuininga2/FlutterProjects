//import 'dart:convert';

//import 'package:cartracker/data/models/car_model.dart';
import 'package:cartracker/data/datasources/car_api_service.dart';
import 'package:cartracker/domain/repositories/car_repository.dart';

class CarRepoImpl implements CarRepo {
  final carApi = CarApiService();

  //Call api service


  //Converts data into data models to send to domain repo
  //late CarModel car = CarModel.fromJson(jsonDecode(data));
}