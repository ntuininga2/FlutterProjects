import 'package:cartracker/views/car.dart';

class CarManager {
  List<Car> cars = [];

  static final CarManager _instance = CarManager._internal();

  factory CarManager() {
    return _instance;
  }
  
  CarManager._internal() {
    // initialization logic 

    //Load all cars from json
  }
  
  void saveToJson() {

  }

  void addCar(Car car) {
    car.id = cars.length + 1;
    cars.add(car);

    int count = cars.length;

    print('Car added - Total Cars: $count');
  }
}
