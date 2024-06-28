import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onboarding_flow_part1/constants/gaps.dart';
import 'package:onboarding_flow_part1/constants/sizes.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late final AnimationController _buttonAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );

  late final Animation<double> _buttonAnimation =
      Tween(begin: 76.0, end: 64.0).animate(_buttonAnimationController);

  late final AnimationController _progressAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
    lowerBound: 0.0,
    upperBound: 1.0,
  );

  late bool _isFlash = false;
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();
    initPermissions();
    WidgetsBinding.instance.addObserver(this);
    _progressAnimationController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _progressAnimationController.dispose();
    _buttonAnimationController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_hasPermission) return;
    if (!_cameraController.value.isInitialized) return;
    if (state == AppLifecycleState.inactive) {
      _cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
    }
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 0 : 1],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );

    await _cameraController.initialize();

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> initPermissions() async {
    final cameraPermission = await Permission.camera.request();
    final micPermission = await Permission.microphone.request();

    final cameraDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    final micDenied =
        micPermission.isDenied || micPermission.isPermanentlyDenied;

    if (!cameraDenied && !micDenied) {
      _hasPermission = true;
      await initCamera();
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await initCamera();
    if (mounted) {
      setState(() {});
    }
  }

  void _setFlashMode() {
    _isFlash = !_isFlash;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _onTapCapture() async {
    await _buttonAnimationController.forward();
    final image = await _cameraController.takePicture();
    await _buttonAnimationController.reverse();

    final result =
        await GallerySaver.saveImage(image.path, albumName: "Home_work");

    if (result == true) {
      _onClose([image]);
    }
  }

  void _onClose([List<XFile> files = const []]) {
    Navigator.of(context).pop(files);
  }

  Future<void> _onPickImagePressed() async {
    final files = await ImagePicker().pickMultiImage();
    if (files.isEmpty) return;
    _onClose(files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: !_hasPermission || !_cameraController.value.isInitialized
            ? const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Initializing...",
                    style:
                        TextStyle(color: Colors.white, fontSize: Sizes.size20),
                  ),
                  Gaps.v20,
                  CircularProgressIndicator.adaptive()
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0,
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(Sizes.size30),
                          bottomRight: Radius.circular(Sizes.size30),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CameraPreview(_cameraController),
                    ),
                  ),
                  Positioned(
                    top: Sizes.size40,
                    left: Sizes.size20,
                    child: IconButton(
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.chevron_left,
                        size: Sizes.size36,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Sizes.size40,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              color: _isFlash == true
                                  ? Colors.amber.shade200
                                  : Colors.white,
                              onPressed: _setFlashMode,
                              icon: _isFlash == true
                                  ? const Icon(Icons.flash_on_rounded)
                                  : const Icon(Icons.flash_off),
                            ),
                            Gaps.h56,
                            GestureDetector(
                              onTap: _onTapCapture,
                              child: AnimatedBuilder(
                                animation: _buttonAnimation,
                                builder: (context, child) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: Sizes.size80,
                                        height: Sizes.size80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 4.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: _buttonAnimation.value,
                                        height: _buttonAnimation.value,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Gaps.h56,
                            IconButton(
                              color: Colors.white,
                              onPressed: _toggleSelfieMode,
                              icon: const Icon(Icons.cameraswitch),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Camera',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: _onPickImagePressed,
                child: const Text(
                  'Library',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
