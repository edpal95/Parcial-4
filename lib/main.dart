import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parcial 4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Edwin Palacios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController _controller;

  List<Marker> _markers = [];

  void _onMapCreated(GoogleMapController controller) {
    _markers.add(
      Marker(
        markerId: MarkerId("id-1"),
        position: LatLng(13.986647, -89.678950),
        infoWindow: InfoWindow(
          title: "Chalchuapa",
          snippet:
              "Chalchuapa es una ciudad del distrito homónimo del departamento de Santa Ana, en la zona occidental de El Salvador",
        ),
      ),
    );

    _markers.add(
      Marker(
        markerId: MarkerId("id-2"),
        position: LatLng(13.902388, -89.502525),
        infoWindow: InfoWindow(
          title: "El congo",
          snippet:
              "El Congo es un municipio salvadoreño ubicado en la zona occidental, en el Distrito de Santa Ana del Departamento de Santa Ana",
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(14.015188, -89.527545), zoom: 10),
        mapType: MapType.normal,
        onMapCreated: _onMapCreated,
        markers: _markers.map((e) => e).toSet(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ),
    );
  }
}
