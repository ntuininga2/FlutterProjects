part of 'geolocation_bloc.dart';

sealed class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object?> get props => [];


}

class GeolocationLoading extends GeolocationState {}
class GeolocationLoaded extends GeolocationState {
  final Position position;

  GeolocationLoaded({required this.position});

  @override
  List<Object?> get props => [position];
}

final class GeolocationInitial extends GeolocationState {}
