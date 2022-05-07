import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../data/models/place.dart';
import '../../../data/models/place_direction.dart';
import '../../../data/models/place_suggession.dart';
import '../../../data/repo/maps_repo.dart';
part 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  MapsCubit(this.mapsRepository) : super(MapsInitial());
  final MapsRepository mapsRepository;

  void emitPlaceSuggestions(String place, String sessionToken) {
    mapsRepository.fetchSuggestions(place, sessionToken).then((suggestions) {
      emit(PlacesLoaded(suggestions));
    });
  }

  void emitPlaceLocation(String placeId, String sessionToken) {
    mapsRepository.getPlaceLocation(placeId, sessionToken).then((place) {
      emit(PlaceLocationLoaded(place));
    });
  }

  void emitPlaceDirections(LatLng origin, LatLng destination) {
    mapsRepository.getDirections(origin, destination).then((directions) {
      emit(DirectionsLoaded(directions));
    });
  }
}
