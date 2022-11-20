import 'package:camera/camera.dart';
import 'package:face_detction/Screens/home_page.dart';
import 'package:face_detction/utils/prefrences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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
  Future checkPermisson() async {
    bool cameraPermission = await Permission.camera.request().isGranted;

    if (cameraPermission != true) {
      await Permission.camera.request();
    }
  }

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
