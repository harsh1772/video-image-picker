import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final CameraPosition _kLake = const CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(21.1702, 72.8311),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  final Set<Marker> _markers = {};
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("111"),
        position: latLng,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  late LatLng latLng;
  late LocationData currentLocation;
  // getLocation() async {
  //   var location = new Location();
  //  const location.onLocationChanged().listen((currentLocation) {
  //     print(currentLocation.latitude);
  //     print(currentLocation.longitude);
  //     setState(() {
  //       latLng = LatLng(currentLocation.latitude, currentLocation.longitude);
  //     });
  //     print("getLocation:$latLng");
  //     var loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Completer<GoogleMapController> _controller = Completer();
    //
    // final CameraPosition _kGooglePlex = CameraPosition(
    //   target: LatLng(21.1702, 72.8311),
    //   zoom: 14.4746,
    // );
    // final CameraPosition _kLake = CameraPosition(
    //     bearing: 192.8334901395799,
    //     target: LatLng(21.1702, 72.8311),
    //     tilt: 59.440717697143555,
    //     zoom: 19.151926040649414);

    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),

      /*GoogleMap(
        mapType: MapType.normal,
        zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),*/
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
