import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:cartracker/data/models/car_model.dart';

class CarApiService {
  final dio = Dio();
  final cancelToken = CancelToken();

  List<CarModel>? cars;

  Future<dynamic> getCars() async {
    try {
      final response = await dio.get('https://api.api-ninjas.com/v1/cars',
        queryParameters: {'model':'camry', 'X-Api-Key':'xJQcudrPdvzXaKHoQdpX5Q==5LAYQ7p5DfwiZbXC'},
        cancelToken: cancelToken);
      
      CarModel car = CarModel.fromJson(jsonDecode(response.data));
      print(car.make);
      return (response.data);
      //print(response.data);
    } on DioException catch (e) {
        print(e.requestOptions);
        print(e.message);
        return 'fail';
    }

  }
}
