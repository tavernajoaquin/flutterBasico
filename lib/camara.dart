import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
//importa main para poder usar el listado de camaras
import 'mainOriginal.dart';

//Stateless widget que le da la posicion a Square que es el widget de la camara
class Camara extends StatelessWidget {
  build(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                // margin: EdgeInsets.only(bottom: 30),
                child: Square(),
              ),
            ),
          ),
          // Square(),
        ],
      ),
    );
  }
}

class Square extends StatefulWidget {
  final color;
  final size;

  Square({this.color, this.size});

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    //setea a la camara de la posicion 0 de la lista como variable controller
    controller = CameraController(cameras![0], ResolutionPreset.medium);
    //inicializa la camara, si retorna algo distinto a montado, no retorna nada
    controller.initialize().then((_) {
      //el then esta porque initialize de vuelve una promesa,
      // la cual devuelve CameraException si falla
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  //libera los recursos de la camara
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //si la camara no esta inicializada, retornar un contenedor vacio
    if (!controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        //Camera preview muestra lo que esta tomando la camara
        child: CameraPreview(controller));
  }
}
