import 'package:dio/dio.dart';

final dio = Dio();
final cancelToken = CancelToken();

void getHttp() async {
  try {
    final response = await dio.get('https://api.api-ninjas.com/v1/cars',
      queryParameters: {'model':'camry', 'X-Api-Key':'xJQcudrPdvzXaKHoQdpX5Q==5LAYQ7p5DfwiZbXC'},
      cancelToken: cancelToken);
    print(response.data);
  } on DioException catch (e) {
      print(e.requestOptions);
      print(e.message);
  }

}