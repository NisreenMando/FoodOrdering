// import 'dart:async';

// import 'package:easy_shopping/ui/views/map_view/map_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapView extends StatefulWidget {
//   final LocationData currentLocation;
//   const MapView({super.key, required this.currentLocation});

//   @override
//   State<MapView> createState() => MapViewState();
// }
// class MapViewState extends State<MapView> {

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: MapController(widget.currentLocation),
//       builder: (MapController mapController) {
//         return Scaffold(
//           body: GoogleMap(

//             mapType: MapType.normal,
//             initialCameraPosition: mapController.initalCameraPosition,
//             onMapCreated: (GoogleMapController controller) {
//               mapController.controller.complete(controller);

//               mapController.addMarker(
//                   markerId: 'Current',
//                   position: LatLng(
//                       mapController.currentLocation.latitude ??
//                           37.43296265331129,
//                       mapController.currentLocation.longitude ??
//                           -122.08832357078792));
//   mapController.getStreetName();
//             },
//             markers: mapController.markers,
//             onTap: (latlong) {
//               mapController.selectedLocation = latlong;

//               mapController.addMarker(
//                   markerId: 'Current',
//                   position: LatLng(mapController.selectedLocation.latitude,
//                       mapController.selectedLocation.longitude));

//            mapController.getStreetName();
//             },
//           ),
//           floatingActionButton: FloatingActionButton.extended(
//             onPressed: () {},
//             label: Text('${mapController.streetName.value}'),
//             icon: const Icon(Icons.directions_boat),
//           ),
//         );
//       },
//     );
//   }

import 'package:easy_shopping/ui/views/map_view/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;
  const MapView({super.key, required this.currentLocation});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(widget.currentLocation),
        builder: (MapController mapController) {
          return Scaffold(
            body: GoogleMap(
              initialCameraPosition: mapController.initalCameraPosition,
              onMapCreated: (GoogleMapController controller) {
                mapController.controller.complete(controller);
                mapController.addMarker(
                    markerId: 'Current',
                    position: LatLng(
                        mapController.currentLocation.latitude ??
                            37.43296265331129,
                        mapController.currentLocation.longitude ??
                            -122.08832357078792));
                mapController.getStreetName();
              },
              markers: mapController.markers,
              onTap: (latlong) {
                mapController.selectedLocation = latlong;
                mapController.addMarker(
                    markerId: 'Current',
                    position: LatLng(mapController.selectedLocation.latitude,
                        mapController.selectedLocation.longitude));
                mapController.getStreetName();
              },
              
            ),
            floatingActionButton:FloatingActionButton.extended(
            label: Text('${mapController.streetName.value}'),
            onPressed: (){},
            icon: const Icon(Icons.directions_boat) ,) ,
          );
        });
  }
}
