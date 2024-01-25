import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocation/blocs/geolocation/geolocation_bloc.dart';
import 'package:geolocation/repositories/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocation/geolocater_service.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //late Position _position;
  String? _address = "";

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //       'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

  _getAddressFromCoords(Position position) async {
    try{
      List<Placemark> newPlace = await GeocodingPlatform.instance.placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = newPlace[0];
      String? name = place.name;
      String? locality = place.locality;
      String? subLocality = place.subLocality;
      String? administrativeArea = place.administrativeArea;
      String? postalCode = place.postalCode;
      String? country = place.country;

      String? address = "$name, $country, $postalCode, $locality, $subLocality, $administrativeArea";
      setState(() {
        _address = address;
      });
    } catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository(),)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository:
                      context.read<GeolocationRepository>())
                ..add(LoadGeolocation()))
        ],
        child: MaterialApp(
          home: Scaffold(
            body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Geolocation",
                      style: TextStyle(fontSize: 30),),
                    SizedBox(height: 50,),
                    Container(
                      child: BlocBuilder<GeolocationBloc, GeolocationState>(
                        builder: (context, state) {
                          if (state is GeolocationLoading)
                          {
                            return Text("Loading Geolocation Data");
                          }
                          else if (state is GeolocationLoaded)
                          {
                            return Column(
                              children: [
                                Text("Coordinatesss"),
                                Text("Longitude: ${state.position.longitude}, Latitude: ${state.position.latitude}"),
                                SizedBox(height: 30,),
                                ElevatedButton(onPressed: (){_getAddressFromCoords(state.position);}, child: Text("Get Address")),
                                Text("${_address}")
                              ],
                            );
                          }
                          else
                          {
                            return const Text("Something went wrong");
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
