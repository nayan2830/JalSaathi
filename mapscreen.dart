import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Asset Locations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AssetMapScreen(), // Your map screen widget
      debugShowCheckedModeBanner: false,
    );
  }
}

class AssetMapScreen extends StatefulWidget {
  @override
  _AssetMapScreenState createState() => _AssetMapScreenState();
}

class _AssetMapScreenState extends State<AssetMapScreen> {
  // Initial location (latitude, longitude) of Pune, Maharashtra
  final LatLng _initialPosition = LatLng(18.5204, 73.8567); // Pune, India
  late GoogleMapController _controller;

  // Set of asset locations in Pune
  final List<Marker> _assetMarkers = [
    const Marker(
      markerId: MarkerId('asset1'),
      position: LatLng(18.5204, 73.8567), // Pune Main City
      infoWindow: InfoWindow(title: 'Asset 1', snippet: 'Installed on 2021-08-15'),
    ),
    const Marker(
      markerId: MarkerId('asset2'),
      position: LatLng(18.5314, 73.8446), // Deccan Gymkhana
      infoWindow: InfoWindow(title: 'Asset 2', snippet: 'Installed on 2022-03-10'),
    ),
    const Marker(
      markerId: MarkerId('asset3'),
      position: LatLng(18.5606, 73.8055), // Aundh
      infoWindow: InfoWindow(title: 'Asset 3', snippet: 'Installed on 2023-01-12'),
    ),
    const Marker(
      markerId: MarkerId('asset4'),
      position: LatLng(18.5094, 73.8297), // Koregaon Park
      infoWindow: InfoWindow(title: 'Asset 4', snippet: 'Installed on 2023-05-20'),
    ),
    const Marker(
      markerId: MarkerId('asset5'),
      position: LatLng(18.5222, 73.8790), // Viman Nagar
      infoWindow: InfoWindow(title: 'Asset 5', snippet: 'Installed on 2022-10-30'),
    ),
    const Marker(
      markerId: MarkerId('asset6'),
      position: LatLng(18.6172, 73.8037), // Hinjewadi
      infoWindow: InfoWindow(title: 'Asset 6', snippet: 'Installed on 2023-07-15'),
    ),
    const Marker(
      markerId: MarkerId('asset7'),
      position: LatLng(18.4966, 73.8625), // Katraj
      infoWindow: InfoWindow(title: 'Asset 7', snippet: 'Installed on 2021-12-05'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asset Locations'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12, // Adjusted zoom for Pune
        ),
        markers: Set.from(_assetMarkers), // Add the asset markers to the map
        onMapCreated: (controller) {
          _controller = controller;
        },
        mapType: MapType.normal,
      ),
    );
  }
}
