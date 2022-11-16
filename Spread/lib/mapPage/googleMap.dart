import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spread/dbObjects/foodItem.dart';
import 'package:spread/dbObjects/restaurant.dart';
import 'package:cloud_functions/cloud_functions.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsViewState createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late GoogleMapController mapController;
  Geolocator location = Geolocator();
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Set<Marker> markersToDisplay = {};
  List<Marker> _markers = [];
  int numOfMarkers = 0;

  Future<String> getPositionString() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String coordinates = "(${position.longitude}, ${position.latitude})";
    print(coordinates);
    return coordinates;
  }

  void createMarker() async {
    String coordinates = await getPositionString();
    String markerID = numOfMarkers.toString();
    numOfMarkers++;
    String longitude = coordinates.split(", ")[0].replaceAll("(", "");
    String latitude = coordinates.split(", ")[1].replaceAll(")", "");
    double long = double.parse(longitude);
    double lat = double.parse(latitude);

    Marker temp = Marker(
      markerId: MarkerId(markerID),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, long),
      visible: true,
    );

    _markers.add(temp);
    print("length: " + _markers.length.toString());
    setState(() {
      markersToDisplay = _markers.toSet();
    });
  }

  Future<Map<FoodItem, restaurant>> getFoodItemRestruant() async {

    FoodItem item = FoodItem(
        foodItemID: "1",
        itemName: "whopper",
        categoryOfFood: "fast food",
        rating: 3,
        ingredients: [""],
        allergens: ["none"],
        restaurantName: "restaurantName",
        restaurantID: "restaurantId",
        imageURL: "imageURL",
        tags: ["okay"]
    );

    String coordinates = await getPositionString();

    restaurant rest = restaurant(restaurantID: 1,
        regionID: 2,
        restaurantName: "Burger King",
        menuID: 1,
        coordinates: coordinates,
        tags: ["tags"],
        rating: 4,
        foodTypeIDs: [0]
    );

    Map<FoodItem, restaurant> pair = {item : rest};

    return pair;
  }

  void createMarkerVersion2() async {
    Map<FoodItem, restaurant> itemRestaurantPair = await getFoodItemRestruant();
    FoodItem item = itemRestaurantPair.keys.elementAt(0);
    restaurant rest = itemRestaurantPair[item]!;
    String coordinates = rest.coordinates;

    String markerID = numOfMarkers.toString();
    numOfMarkers++;
    String longitude = coordinates.split(", ")[0].replaceAll("(", "");
    String latitude = coordinates.split(", ")[1].replaceAll(")", "");
    double long = double.parse(longitude);
    double lat = double.parse(latitude);

    Marker temp = Marker(
      markerId: MarkerId(markerID),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, long),
      infoWindow: InfoWindow(title: item.itemName, snippet: rest.restaurantName, anchor: Offset(0.5, 0.0)),
      visible: true,
    );

    _markers.add(temp);
    print("length: " + _markers.length.toString());
    setState(() {
      markersToDisplay = _markers.toSet();
    });
  }

  void createMarkerVersion3() async {

    _markers.clear();

    final result = await FirebaseFunctions.instance
        .httpsCallable('getFoodMarkers').call();
    print(result.data);

    var items = result.data["markers"];
    print(items);

    for (var item in items) {
      String markerID = numOfMarkers.toString();
      numOfMarkers++;
      double long = double.parse(item['longitude']);
      double lat = double.parse(item['latitude']);

      Marker temp = Marker(
        markerId: MarkerId(markerID),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(lat, long),
        infoWindow: InfoWindow(title: item['itemName'], snippet: item['restaurantName'], anchor: Offset(0.5, 0.0)),
        visible: true,
      );
      _markers.add(temp);
    }

    setState(() {
      markersToDisplay = _markers.toSet();
    });
  }


  var _msuDenver2 = null;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    setState(() {});
  }

  Future<bool> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position!.latitude, position!.longitude),
            zoom: 17.0,
          ),
        ),
      );
      setState(() {});
    });

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
          ? const Center(
              child: Text("Loading..."),
            )
          : Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      onMapCreated: (GoogleMapController controller) {
                        mapController = controller;
                      },
                      myLocationEnabled: true,
                      initialCameraPosition: _msuDenver2,
                      markers: Set<Marker>.of(_markers),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
        // onPressed: createMarkerVersion2,
        onPressed: createMarkerVersion3,
        label: const Text('Refresh Map'),
        icon: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
