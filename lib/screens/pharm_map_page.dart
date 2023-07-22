import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';

const googleApiKey = 'AIzaSyBslSLIMkVmO4zgH3YQcoEJVo28LuMlq1w';

class Pharmacy {
  final String name;
  final LatLng location;

  Pharmacy(this.name, this.location);
}

class PharmMapPage extends StatefulWidget {
  const PharmMapPage({super.key});

  @override
  State<PharmMapPage> createState() => _PharmMapPageState();
}

class _PharmMapPageState extends State<PharmMapPage> {
  final Completer<GoogleMapController> _controller = Completer();

  Position _currentPosition = Position(
    latitude: 37.33500926,
    longitude: -122.03272188,
    altitude: 0,
    accuracy: 0,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
    timestamp: DateTime.now(),
  );
  LatLng? _userLocation;
  LatLng destination = const LatLng(37.33429383, -122.06600055);
  late GoogleMapController _mapController;
  Set<Marker> selectedMarker = {};
  Set<Marker> markers = {};
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _userLocation = LatLng(_currentPosition.latitude, _currentPosition.longitude);
      _focusOnMap(_userLocation!);
    });    
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void _focusOnMap(LatLng pharmacyLocation) {
    final cameraPosition = CameraPosition(target: pharmacyLocation, zoom: 16);
    _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  List<LatLng> nearbyPharmacyLocations = [];

  @override
  Widget build(BuildContext context) {
    return  MediaQuery(
        data: const MediaQueryData(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Pharmacys",
              style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: _userLocation != null
                  ? CameraPosition(target: _userLocation!, zoom: 16)
                  : const CameraPosition(
                      target: LatLng(0, 0),
                    ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _mapController = controller;
              },
              mapToolbarEnabled: true,
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              markers: {...selectedMarker, ...markers},
              polylines: {
                Polyline(polylineId: const PolylineId("route"),
                points: polylineCoordinates,
                color: const Color(0xFF7B61FF),
                width: 7
                ),
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 0, 151, 178),
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 10, 8, 6),
                  child: Text(
                    "Pharmacys Near Me",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            // ignore: unnecessary_null_comparison
            child: _currentPosition != null
            ? FutureBuilder<List<Pharmacy>>(
                future: _getNearbyPharmacys(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error fetching nearby pharmacys',
                      style: TextStyle(color: Color.fromARGB(255, 0, 151, 178), fontSize: 16),
                      ),
                    );
                  } else {
                    final nearbyPharmacys = snapshot.data;
                    if (nearbyPharmacys!.isEmpty) {
                      return const Center(
                        child: Text('No nearby pharmacys',
                        style: TextStyle(color: Color.fromARGB(255, 0, 151, 178), fontSize: 16),),
                      );
                    } else {
                      nearbyPharmacyLocations = nearbyPharmacys.map((pharmacy) => pharmacy.location).toList();
                      return Container(
                        color: const Color.fromARGB(255, 0, 151, 178),
                        child: ListView.builder(
                          itemCount: nearbyPharmacys.length,
                          itemBuilder: (context, index) {
                            final pharmacy = nearbyPharmacys[index];
                            return Container(
                              margin: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  pharmacy.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 0, 151, 178),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _onPharmacyLocTap(index);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10), // Add spacing between the icons
                                    Container(
                                      width: 42,
                                      height: 42,
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 0, 151, 178),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.location_pin,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _onPharmacyTrackTap(index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                    
                              ),
                            );
                          },
                        ),
                      );
                    }
                  }
                },
              )
              : const SizedBox(height: 200),
            ),
            
          ],
        ),
      ));
      
  }
  Future<List<Pharmacy>> _getNearbyPharmacys() async {
    const apiKey = googleApiKey;

    // final position = await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.high,
    // );

    final latitude = _currentPosition.latitude;
    final longitude = _currentPosition.longitude;
    const radius = 1000; // Radius in meters
    const types = 'pharmacy|health'; // bar|lodging'; // Specify the types here
    const rankBy = 'prominence'; 

    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude,$longitude&radius=$radius&types=$types&rankby=$rankBy&key=$apiKey';
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final results = data['results'] as List<dynamic>;

      final nearbyPharmacys = results.map((result) {
        final name = result['name'] as String;
        final geometry = result['geometry'];
        final location = geometry['location'];
        final lat = location['lat'] as double;
        final lng = location['lng'] as double;

        return Pharmacy(name, LatLng(lat, lng));
      }).toList();

      return nearbyPharmacys;
    } else {
      throw Exception('Failed to fetch nearby pharmacys');
    }
  }

  void _onPharmacyLocTap(int index) {
    final LatLng pharmacyLocation = nearbyPharmacyLocations[index];

    // Check if the marker is within the visible region
    _controller.future.then((controller) {
      controller.getVisibleRegion().then((visibleRegion) {
        if (visibleRegion.contains(pharmacyLocation)) {
          // Marker is already visible on the map
        } else {
          // Marker is not visible on the map, animate the camera to focus on the marker
          final LatLngBounds bounds = LatLngBounds(
            southwest: LatLng(
              pharmacyLocation.latitude,
              pharmacyLocation.longitude,
            ),
            northeast: LatLng(
              pharmacyLocation.latitude,
              pharmacyLocation.longitude,
            ),
          );

          final CameraUpdate cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 100);
          controller.animateCamera(cameraUpdate);
        }
      });
    });
  }

  void _onPharmacyTrackTap(int index) {

    final LatLng pharmacyLocation = nearbyPharmacyLocations[index];

    setState(() {
      destination = pharmacyLocation;
      selectedMarker = {
        Marker(
          markerId: MarkerId('pharmacy_$index'),
          position: pharmacyLocation,
        )
      };
      polylineCoordinates.clear();
      getPolyPoints();
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey, 
      PointLatLng(_currentPosition.latitude, _currentPosition.longitude), 
      PointLatLng(destination.latitude, destination.longitude)
    );

    

    if(result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)
        );
      }
      setState(() {
        final cameraPosition = CameraPosition(target: _userLocation!, zoom: 15);
        _mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      });
    }
  }
}