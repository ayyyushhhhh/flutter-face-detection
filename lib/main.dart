import 'package:camera/camera.dart';
import 'package:face_detction/Screens/home_page.dart';
import 'package:face_detction/utils/prefrences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  if (kDebugMode) {
    print(cameras?.length);
  }
  Prefrences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
