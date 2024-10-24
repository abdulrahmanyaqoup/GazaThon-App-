import 'package:feutric_app/view/more_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController controller = MapController();
  LatLng? selectedLocation;
  final LatLng gazaCityCenter =
      const LatLng(31.5, 34.4667); // Coordinates of Gaza City

  void _onTap(TapPosition tapPosition, LatLng latlng) {
    setState(() {
      selectedLocation = latlng;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          ' قم تحديد الموقع ',
          style: GoogleFonts.rubik(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: FlutterMap(
        mapController: controller,
        options: MapOptions(
          initialCenter: gazaCityCenter,
          initialZoom: 13.0,
          onTap: _onTap, // Handles map tap to select location
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          if (selectedLocation != null)
            MarkerLayer(
              markers: [
                Marker(
                  child: const Icon(Icons.location_on,
                      color: Colors.red, size: 40),
                  width: 80.0,
                  height: 80.0,
                  point: selectedLocation!,
                ),
              ],
            ),
        ],
      ),
      floatingActionButton: selectedLocation != null
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MoreInformation(),
                  ),
                );
              },
              backgroundColor:
                  const Color(0xFF800020), // Example function to re-center map
              child: const Icon(Icons.directions),
            )
          : null,
    );
  }
}
