import 'package:camera/camera.dart';
import 'package:face_detction/main.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController controller = TextEditingController();
  late CameraController _cameraController;
  bool flash = false;
  bool isControllerInitialized = false;
  // late FaceDetector _faceDetector;
  // final MLService _mlService = MLService();
  // List<Face> facesDetected = [];

  Future initializeCamera() async {
    await _cameraController.initialize();
    isControllerInitialized = true;
    _cameraController.setFlashMode(FlashMode.off);
    setState(() {});
  }

  @override
  void initState() {
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    initializeCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: isControllerInitialized
                    ? CameraPreview(_cameraController)
                    : null),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 100),
                  //     child: Lottie.asset("assets/loading.json",
                  //         width: MediaQuery.of(context).size.width * 0.7),
                  //   ),
                  // ),
                  TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        fillColor: Colors.white, filled: true),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        // child: CWidgets.customExtendedButton(
                        //     text: "Capture",
                        //     context: context,
                        //     isClickable: true,
                        //     onTap: () {
                        //       bool canProcess = false;
                        //       _cameraController
                        //           .startImageStream((CameraImage image) async {
                        //         if (canProcess) return;
                        //         canProcess = true;
                        //         _predictFacesFromImage(image: image)
                        //             .then((value) {
                        //           canProcess = false;
                        //         });
                        //         return null;
                        //       });
                        //     }),
                      ),
                      IconButton(
                          icon: Icon(
                            flash ? Icons.flash_on : Icons.flash_off,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () {
                            setState(() {
                              flash = !flash;
                            });
                            flash
                                ? _cameraController
                                    .setFlashMode(FlashMode.torch)
                                : _cameraController.setFlashMode(FlashMode.off);
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
