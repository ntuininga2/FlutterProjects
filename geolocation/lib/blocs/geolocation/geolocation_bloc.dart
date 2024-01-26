import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocation/repositories/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:meta/meta.dart';

part 'geolocation_event.dart';
part 'geolocation_state.dart';

class GeolocationBloc extends Bloc<GeolocationEvent, GeolocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geolocationSubscription;

  GeolocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepository = geolocationRepository,
        super(GeolocationLoading()) {
          on<GeolocationEvent>((event, emit) {
            print("$event");
            if (event is LoadGeolocation){
              _mapLoadGeolocationToState();
            }
            else if (event is UpdateGeolocation){
              _mapUpdateGeolocationToState(event);
              emit(GeolocationLoaded(position: event.position));
            }
          });

          geolocationRepository.positionStream.listen((event) {
            _mapLoadGeolocationToState();
          });
        }


  Future<GeolocationState?> _mapLoadGeolocationToState() async {
    print("Loading geo to state");
    _geolocationSubscription?.cancel();
    final Position position = await _geolocationRepository.getCurrentLocation();
    add(UpdateGeolocation(position: position));
  }

  Future<GeolocationState?> _mapUpdateGeolocationToState(
    UpdateGeolocation event) async {
    await GeolocationLoaded(position: event.position);
  }

  @override
  Future<void> close() {
    _geolocationSubscription?.cancel();
    return super.close();
  }
}
