// import 'package:geolocator/geolocator.dart';
// import 'package:geolocator_apple/geolocator_apple.dart';
// import 'package:geolocator_android/geolocator_android.dart';



// class GeolocationSettings {
//   late LocationSettings locationSettings;

//   GeolocationSettings(){
//       if (defaultTargetPlatform == TargetPlatform.android) {
//     locationSettings = AndroidSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 100,
//       forceLocationManager: true,
//       intervalDuration: const Duration(seconds: 10),
//       //(Optional) Set foreground notification config to keep the app alive 
//       //when going to the background
//       foregroundNotificationConfig: const ForegroundNotificationConfig(
//           notificationText:
//           "Example app will continue to receive your location even when you aren't using it",
//           notificationTitle: "Running in Background",
//           enableWakeLock: true,
//       )
//     );
//   } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
//     locationSettings = AppleSettings(
//       accuracy: LocationAccuracy.high,
//       activityType: ActivityType.fitness,
//       distanceFilter: 100,
//       pauseLocationUpdatesAutomatically: true,
//       // Only set to true if our app will be started up in the background.
//       showBackgroundLocationIndicator: false,
//     );
//   } else {
//       locationSettings = LocationSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 100,
//     );
//   }
//   }

// }
