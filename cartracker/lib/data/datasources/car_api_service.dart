import 'package:dio/dio.dart';

import 'package:cartracker/core/constants/api_constants.dart';

final dio = Dio();

void getHttp() async {
  final response = await dio.get('$BASE_URI?model=camry');
  print('http call: $response');
}