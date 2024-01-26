import 'dart:async';
import 'package:geolocator/geolocator.dart';


abstract class TrackLocation {
  TrackLocation();

  StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100
  )).listen(
    (Position? position) {
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
}

