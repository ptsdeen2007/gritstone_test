import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../provider/route_provider.dart';



class RouteMap extends StatelessWidget {


  RouteMap({Key? key}):super(key: key);
  // BitmapDescriptor? _markerIcon;
   RouteProvider? provider;
  @override
  Widget build(BuildContext context) {
     provider = Provider.of<RouteProvider>(context);
    return!provider!.isLoading? GoogleMap(
      initialCameraPosition:provider!.initialCameraPosition! ,
      markers: provider!.markers.values.toSet(),
      polylines: provider!.polylines.values.toSet(),
      onMapCreated: _onMapCreated,
    ):const Center(child: CupertinoActivityIndicator());
  }

  void _onMapCreated(GoogleMapController controller) {
    provider!.controller=controller;
  }
}
