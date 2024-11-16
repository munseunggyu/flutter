import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:map/screens/home_screen.dart';

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
  checkPermission() async {
    // 위치 기능을 활성화하였는지 여부 체크
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      throw Exception('위치 기능을 활성화 해주세요');
    }

    // 위치 권한 설정 확인
    LocationPermission checkPermission = await Geolocator.checkPermission();

    // 최초 권한 확인
    if (checkPermission == LocationPermission.denied) {
      checkPermission = await Geolocator.requestPermission();
    }

    // 위치 권한 체크
    if (checkPermission != LocationPermission.always &&
        checkPermission != LocationPermission.whileInUse) {
      throw Exception('위치 권한을 활성화 해주세요');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: checkPermission(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('에러 발생'),
            );
          }
          return const HomeScreen();
        },
      ),
    );
  }
}
