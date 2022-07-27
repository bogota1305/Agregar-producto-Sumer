import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/widgets/form/carousel_index.dart';
import 'package:flutter_application_1/widgets/form/form_buttom.dart';
import 'package:flutter_application_1/widgets/form/form_extras.dart';
import 'package:flutter_application_1/widgets/form/form_header.dart';
import 'package:flutter_application_1/widgets/form/form_info.dart';
import 'package:flutter_application_1/widgets/form/image_carousel.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';



String ruta = "";

class MyHomePage extends StatelessWidget {


  final ProductModel producto;
  final int cambios;

 
  int activeIndex = 0;

  final int _currentIndex=0;

  MyHomePage({Key? key, 
    required this.producto, 
    required this.cambios
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    ruta = producto.imagen;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: 690,
        height: 2000,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              FormHeader(),

              Container( 
                height: 1.0, 
                decoration: BoxDecoration( 
                  color: Color.fromARGB(255, 201, 201, 201), 
                  ), 
              ),       

              ImageCarousel(currentIndex: _currentIndex, cardList: cardList),
              
              FormInfo(categoria: producto.tipo, nombre: producto.nombre, precio: producto.precio, disponibilidad: producto.disponibilidad, imagen: producto.imagen, cambios: cambios, id: producto?.id ?? 0,), 
              
            ],
          ),
        ),
      ),
    );
  }
  
  Widget buildImage(String imgLis, int index) => Container(
    margin : EdgeInsets.symmetric(horizontal: 5),
    color: Colors.grey,
    child: Image.network(
      imgLis, 
      fit: BoxFit.cover,
    ),
  );
  
}

List cardList=[
    Item1(),
    Item2(img: ruta,)
  ];


class Item1 extends StatelessWidget {
 
  final ImagePicker _picker = ImagePicker();
  String bannerPicUrl = "";
  late File bannerPicFile;
  String profilePicUrl = "";
  late File profilePicFile;

  _imgFromCamera(String name) async {
    // var status = await Permission.camera.status;

    // if (await Permission.camera.isDenied) {
    //   await Permission.camera.request();
    // }

    // if (await Permission.camera.isGranted) {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (image != null) {
      File file = File(image.path);
      cardList.add(Item6(file));
    }
    // }
  }

  _imgFromGallery(String name) async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (image != null) {
      File file = File(image.path);
      cardList.add(Item6(file));
      
    }
  }

  void _showPicker(context, String name) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery(name);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera(name);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
@override
  Widget build(BuildContext context) {
    return  SizedBox.fromSize(
      child: Material(
        color: Color.fromARGB(255, 255, 255, 255),
        child: InkWell(
          splashColor: Color(0xFF3D5AF1), 
          onTap: () {
             _showPicker(context, 'banner');  
          }, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.camera_alt, size: 35, color: Color(0xFF3D5AF1),),
              Text("Agregar una foto", textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Geometric Sans-Serif",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D5AF1),
                ),
              ), 
            ],
          ),
        ),
      ),
    );
  }
}

class Item2 extends StatelessWidget {

  final String img;

  const Item2({Key? key, required this.img}) : super(key: key);
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
       ),
                height: 300.0,
                width: 300.0,
                child: Stack(
                children: <Widget>[         

                    Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                    ),
                    child: Image(
                      image: NetworkImage(img), 
                      fit: BoxFit.cover,
                    ),
                    ),
                    Align(
                    // These values are based on trial & error method
                    alignment: Alignment(.9, -.9),
                    child: InkWell(
                        onTap: () {
                          cardList.remove(cardList[1]);
                        },
                        child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(48, 0, 0, 0),
                            borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                        ),
                        ),
                    ),
                    ),
                ],
                ),
            );          
  }
}

class Item6 extends StatelessWidget {

late File imagenC;

Item6(File img){
  imagenC = img;
}

@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
       ),
                height: 300.0,
                width: 300.0,
                child: Stack(
                children: <Widget>[         

                    Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                    ),
                    child: Image(
                      image: Image.file(imagenC).image, 
                      fit: BoxFit.cover,
                    ),
                    ),
                    Align(
                    // These values are based on trial & error method
                    alignment: Alignment(.9, -.9),
                    child: InkWell(
                        onTap: () {
                          cardList.remove(cardList[cardList.length-1]);
                        },
                        child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(48, 0, 0, 0),
                            borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                        ),
                        ),
                    ),
                    ),
                ],
                ),
            );          
  }
}

