import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:medicine_app/services/geolocator_service.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Position? position;

  getLocation() async {
    final l = await determinePosition();
    setState(() {
      position = l;
    });
  }

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialZoom: 9.2),
      children: [
        TileLayer(
          // Bring your own tiles
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
          userAgentPackageName: 'com.example.app', // Add your app identifier
          // And many more recommended properties!
        ),
        MarkerLayer(
          markers: [
            Marker(
              child: Icon(Icons.location_pin, color: Colors.red, size: 50),
              point: LatLng(
                position?.latitude ?? 0.0,
                position?.longitude ?? 0.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
