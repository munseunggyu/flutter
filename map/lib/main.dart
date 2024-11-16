import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];

  // 플랫폼 채널을 통해 iOS에 API 키 전달
  const platform = MethodChannel('com.example.map/apiKey');
  await platform.invokeMethod('setApiKey', apiKey);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CameraPosition initialPosition =
      const CameraPosition(target: LatLng(37.523373, 126.921252));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Column(
        children: [
          Expanded(
            child: GoogleMap(initialCameraPosition: initialPosition),
          ),
        ],
      ),
    );
  }
}
