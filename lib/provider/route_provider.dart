import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:gritstone_task_shamsu/route_model.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteProvider with ChangeNotifier {
  String url =
      "https://track.elthorenergy.com/api/v1.0/DeviceData/List?uniqueid=230304558&limit=5000&fromTime=2023-06-14T00:00:00Z&toTime=2023-06-14T15:23:57Z";
  bool isLoading = true;
  GoogleMapController? controller;
  List<RouteModel> routeModels = [];

  CameraPosition? initialCameraPosition;
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  Map<MarkerId, Marker> markers = {};

  loadRoutes() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      routeModels = List<RouteModel>.from(
          decodedResponse.map((e) => RouteModel.fromJson(e)));
      isLoading = false;

      var first = routeModels.first;
      initialCameraPosition = CameraPosition(
        target: LatLng(first.latitude, first.longitude),
        zoom: 16,
      );

      routeModels.forEach((e) {
        polylineCoordinates.add(e.toLatLng);
      });
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id,
          color: Colors.red,
          points: polylineCoordinates,
          endCap: Cap.roundCap,
          startCap: Cap.roundCap,
          width: 3,
          jointType: JointType.round);
      polylines[id] = polyline;

      _addMarker(routeModels.first.toLatLng, "origin",
          BitmapDescriptor.defaultMarker);

      /// destination marker
      _addMarker(routeModels!.last.toLatLng, "destination",
          BitmapDescriptor.defaultMarkerWithHue(90));

      notifyListeners();
    }
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position,infoWindow: InfoWindow(title: id));
    markers[markerId] = marker;
  }
}
