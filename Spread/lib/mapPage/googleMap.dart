import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsDemo extends StatefulWidget {
  @override
  _GoogleMapsDemoState createState() => _GoogleMapsDemoState();
}

class _GoogleMapsDemoState extends State<GoogleMapsDemo> {
  late GoogleMapController mapController;
  Geolocator location = Geolocator();
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );


  Marker marker = Marker(markerId: MarkerId("user_location"));

  var _msuDenver2 = null;

  //
  // void _add() {
  //   var markerIdVal = MyWayToGenerateId();
  //   final MarkerId markerId = MarkerId(markerIdVal);
  //
  //   // creating a new MARKER
  //   final Marker marker = Marker(
  //     markerId: markerId,
  //     position: LatLng(0, 0),
  //     infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
  //   );

  //   setState(() {
  //     // adding a new marker to map
  //     markers[markerId] = marker;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    if (_determinePosition() == true) {
      StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
              (Position? position) {
            if (position != null) {
              mapController?.moveCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 20.0,
                  ),
                ),
              );
            }
          });
    }
    // StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
    //         (Position? position) {
    //           if (position != null) {
    //             mapController?.moveCamera(
    //               CameraUpdate.newCameraPosition(
    //                 CameraPosition(
    //                   target: LatLng(position.latitude, position.longitude),
    //                   zoom: 20.0,
    //                 ),
    //               ),
    //             );
    //             // mapController.moveCamera(cameraUpdate)
    //           }
    //
    //           // if(marker != null) {
    //           //   mapController.removeMarker(marker);
    //           // }
    //           // marker = await mapController?.addMarker(MarkerOptions(
    //           //   position: LatLng(location["latitude"], location["longitude"]),
    //           // ));
    //           // mapController?.moveCamera(
    //           //   CameraUpdate.newCameraPosition(
    //           //     CameraPosition(
    //           //       target: LatLng(
    //           //         location["latitude"],
    //           //         location["longitude"],
    //           //       ),
    //           //       zoom: 20.0,
    //           //     ),
    //           //   ),
    //           // );
    //     });

  }

  Future<bool> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, print a message to the console
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, print a message to the console
        print('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever.
      print('Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // _msuDenver2 = CameraPosition(
    //   target: LatLng(position.latitude, position.longitude),
    //   zoom: 17,
    // );

    setState(() {
      _msuDenver2 = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 17,
      );
    });

    return true;
  }

  static final CameraPosition _msuDenver = CameraPosition(
    target: LatLng(39.745096, -105.008167),
    zoom: 17,
  );

  Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _msuDenver2 == null
        ? const Center(child: Text("Loading..."),)
        :Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              myLocationEnabled: true,
              initialCameraPosition: _msuDenver2,
              ),
            ),
        ],
      ),
    );
  }
}