import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';


class MapaScreen extends StatefulWidget {
   
  const MapaScreen({Key? key}) : super(key: key);

  @override
  State<MapaScreen> createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {

  MapboxMapController? mapController;
  final direction = LatLng(-2.897594, -79.019844);
  final selectedStyle = 'mapbox://styles/johnca/cl0m176mv000014qc555ktv15';
  var isLight = true;

  _onMapCreated(MapboxMapController controller ){
    mapController = controller;

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: createMap(),
    );
  }

    MapboxMap createMap() {
    return MapboxMap(
        styleString: selectedStyle,
        accessToken: 'sk.eyJ1Ijoiam9obmNhIiwiYSI6ImNsM2NoNjE0NzA5Ym0zbHBhODlycnBtejIifQ.GGON8P3YradR8wuQ2yc4sA',
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: direction,
          zoom: 16.0
          ),
        // onStyleLoadedCallback: _onStyleLoadedCallback,
      );
  }
}

class _OptionsParada extends StatelessWidget {
  const _OptionsParada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      color: Colors.indigo,
      
    );
  }
}