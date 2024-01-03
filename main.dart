import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("korean"),),
        body:   SizedBox( 
            width: double.infinity,
            child: Container(
              color: Colors.yellow,
              child: CameraScreen()
            ),
          ),
      )
    );
  }  
}

class CameraScreen extends StatefulWidget{
  @override
  _CameraScreenState createState() => _CameraScreenState();
}
class _CameraScreenState extends State<CameraScreen> {
  
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    _controller = CameraController(
      CameraDescription(
        sensorOrientation: 1,
        name: '0',
        lensDirection: CameraLensDirection.back,
      ),
      ResolutionPreset.medium,
        );
    _initializeControllerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  // ========================= ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: ((context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller);
        } else {
          return Center(
            child: CircularProgressIndicator()
          );
        }
      })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
        onPressed: () async {
          try {
            final image = await _controller.takePicture();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PreviewScreen(imagePath: image.path),
            ));
          } catch (e) {}
        },
      ),
    );
  }
}
// ============================= preview

class PreviewScreen extends StatelessWidget {
  final String imagePath;

  const PreviewScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('preview'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
