import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ArCoreController arCoreController;

  _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController.onNodeTap = (name) => onTapHandler(name);
    arCoreController.onPlaneTap = _onPlaneTapHandler;
  }

  onTapHandler(String name) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          AlertDialog(
            content: Text("onNodeTap on $name"),
          );
        });
  }

  void _onPlaneTapHandler(List<ArCoreHitTestResult> hits) {
    //final hit = hits.first;
    final moonMaterial = ArCoreMaterial(color: Colors.grey);
    final moonShape = ArCoreSphere(
      materials: [moonMaterial],
      radius: 0.03,
    );
    final moon = ArCoreNode(
      shape: moonShape,
      position: vector.Vector3(0.2, 0, 0),
      rotation: vector.Vector4(0, 0, 0, 0),
    );

    // final earthMaterial = ArCoreMaterial(
    //   color: Color.fromARGB(120, 66, 134, 244),
    //   textureBytes: Uint8List(10),
    // );

    // final earthShape = ArCoreSphere(
    //   materials: [earthMaterial],
    //   radius: 0.1,
    // );
    // final earth = ArCoreNode(
    //   shape: earthShape,
    //   children: [moon],
    //   // rotation: plane.pose.rotation,
    //   // position:
    // );
    arCoreController.addArCoreNodeWithAnchor(moon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Core App Demo"),
        centerTitle: true,
      ),
      body: ArCoreView(
        enableTapRecognizer: true,
        onArCoreViewCreated: _onArCoreViewCreated(arCoreController),
      ),
    );
  }
}
