import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Variables
  Completer<GoogleMapController> controller = Completer();
  LatLng tourEiffel = const LatLng(48.858278, 2.29425);
  LatLng montParnasse = const LatLng(48.842036, 2.322128);
  LatLng leLouvre = const LatLng(48.861013, 2.33585);
  CameraPosition cameraPosition =
    CameraPosition(target:LatLng(48.858278, 2.29425),zoom: 14);




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: bodyPage()

    );
  }

  Widget bodyPage(){
    return GoogleMap(
        initialCameraPosition: cameraPosition,
      onMapCreated: (GoogleMapController control) async {
          String styleMap = await DefaultAssetBundle.of(context).loadString("lib/style/mapStyle.json");
          control.setMapStyle(styleMap);
          controller.complete(control);
      },
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
    );
  }
}
