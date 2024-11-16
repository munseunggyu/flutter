import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LatLng latLng = const LatLng(
    37.523373,
    126.921252,
  );
  final CameraPosition initialPosition = const CameraPosition(
    target: LatLng(
      37.523373,
      126.921252,
    ),
    zoom: 15,
  );

  late final GoogleMapController controller;

  bool choolCheckDone = false;
  bool canChoolCheck = false;

  double distance = 100;

  @override
  void initState() {
    super.initState();
    Geolocator.getPositionStream().listen((event) {
      final LatLng start = latLng;
      final end = LatLng(event.latitude, event.longitude);

      final oKdistance = Geolocator.distanceBetween(
          start.latitude, start.longitude, end.latitude, end.longitude);

      setState(() {
        if (oKdistance < distance) {
          canChoolCheck = true;
        } else {
          canChoolCheck = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '오늘도 출근',
        ),
        actions: [
          IconButton(
            onPressed: myLocaionPressed,
            icon: const Icon(
              Icons.my_location,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GoogleMap(
              initialCameraPosition: initialPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                this.controller = controller;
              },
              markers: {
                const Marker(
                    markerId: MarkerId(
                      '12',
                    ),
                    position: LatLng(
                      37.523372,
                      126.921252,
                    )),
              },
              circles: {
                Circle(
                  circleId: const CircleId(
                    'inDistance',
                  ),
                  center: const LatLng(
                    37.523373,
                    126.921252,
                  ),
                  radius: distance,
                  fillColor: Colors.blue.withOpacity(0.5),
                  strokeColor: Colors.green,
                  strokeWidth: 2,
                ),
              },
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                choolCheckDone ? Icons.check : Icons.timelapse_outlined,
              ),
              const SizedBox(
                height: 20,
              ),
              if (!choolCheckDone)
                OutlinedButton(
                  onPressed: choolCheckPressed,
                  child: Text(
                    '출췤',
                    style: TextStyle(
                        color: canChoolCheck ? Colors.blue : Colors.red),
                  ),
                ),
            ],
          ))
        ],
      ),
    );
  }

  myLocaionPressed() async {
    final location = await Geolocator.getCurrentPosition();

    controller.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(location.latitude, location.longitude),
      ),
    );
  }

  choolCheckPressed() async {
    final result = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text(
              '출근하기',
            ),
            content: const Text(
              'sad',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        });

    if (result) {
      setState(() {
        choolCheckDone = result;
      });
    }
  }
}
