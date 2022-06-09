import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:custom_input_text/custom_input_text.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

List cardList=[
    Item1(),
    Item2(),
    Item3(),
    Item4(),
    Item5(),
  ];


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> { 
  bool status = false;
  bool status2 = false;

  int activeIndex = 0;

  int _currentIndex=0;

  List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }
      return result;
  }

  final imgList = [
    'https://images.unsplash.com/photo-1618354691373-d851c5c3a990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
    'https://images.unsplash.com/photo-1618354691438-25bc04584c23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
    'https://images.unsplash.com/photo-1618354691551-44de113f0164?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80',
    'https://images.unsplash.com/photo-1618354691229-88d47f285158?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'
  ];


  bool enable = false;
  bool twoFactor = false;

  var fields = {
    "nombre": 0,
    "precio": 0,
    "tipo": 0
  };

  void noEmptyFields() {
    int sum = 0;
    for (int v in fields.values) {
      sum += v;
    }

    if (sum == 4 && enable == false) {
      setState(() {
        enable = !enable;
      });
    } else if (sum != 4 && enable == true) {
      setState(() {
        enable = !enable;
      });
    }
  }

  bool visibilityObs = false;

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == "obs"){
        visibilityObs = visibility;
      }
    });
  }

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              Row(
                children: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.only(left: 16),
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                   Column(
                    children: <Widget>[ 
                      Container(
                width: 300,
                padding: const EdgeInsets.only(left: 20, top: 2),
                child: const Text(
                  "La mejor tienda de ropa",
                  style: TextStyle(
                      fontFamily: "Geometric Sans-Serif",
                      fontSize: 20,
                      ),
                ),
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.only(left: 20, top: 2, bottom: 15),
                child: const Text(
                  "Agregar nuevo producto",
                  style: TextStyle(
                      fontFamily: "Geometric Sans-Serif",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),

                     ],
                  ),

                ],
              ),

              Container( 
                height: 1.0, 
                decoration: BoxDecoration( 
                  color: Color.fromARGB(255, 201, 201, 201), 
                  ), 
              ),       
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 22, right: 160,),
                            child: Text(
                              "Foto: " + (_currentIndex ).toString() + " de " + (cardList.length-1).toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      margin: EdgeInsets.only(),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              "Editar fotos",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(Icons.edit, color: Colors.black),
                        ],
                      ),
                    )
                  ),

                          ],
                      ),
                    ),
                  SizedBox(width: 24.0),
                ],
              ),
              
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: Column(mainAxisAlignment: MainAxisAlignment.center,  children: [
                  CarouselSlider(
                options: CarouselOptions(
                height: 130, 
                viewportFraction: 0.33, 
                enableInfiniteScroll: false, 
                initialPage: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: cardList.map((card){
                return Builder(
                  builder:(BuildContext context){
                    return Container(
                      height: MediaQuery.of(context).size.height*0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  }
                );
              }).toList(),
            ),
                const SizedBox(height: 20,),
                buildIndicator(),

                ],)
                
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255, 170, 170, 170)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: 'Precio',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255, 170, 170, 170)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: 'Tipo',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(255, 170, 170, 170)),
                    ),
                  ),
                ),
              ),

              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 103, bottom: 20, top: 20),
                    child: Text(
                      "Agregar un vinculo de video",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 18.0,
                      value: status,
                      borderRadius: 15.0,
                      showOnOff: false,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      },
                    ),
                  ),         
                ],
              ),

              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 70, bottom: 20, top: 20),
                    child: Text(
                      "Agregar variaciones al producto",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    child: FlutterSwitch(
                      width: 40.0,
                      height: 25.0,
                      valueFontSize: 15.0,
                      toggleSize: 18.0,
                      value: status2,
                      borderRadius: 15.0,
                      showOnOff: false,
                      onToggle: (val2) {
                        setState(() {
                          status2 = val2;
                        });
                      },
                    ),
                  ),         
                ],
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  InkWell(
                    onTap: () {
                      visibilityObs ? null : _changed(true, "obs");
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 22, right: 130),
                            child: Text(
                              "Descripción",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: visibilityObs ? Colors.grey[400] : Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 25),
                            child: Text(
                              "(Opcional)",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: visibilityObs ? Colors.grey[200] : Colors.grey[200],
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_drop_down, color: visibilityObs ? Colors.grey[400] : Colors.grey[600]),
                        ],
                      ),
                    )
                  ),
                  SizedBox(width: 24.0),
                ],
              ),
              
                
              Container(
                margin: EdgeInsets.only(left: 22.0, right: 25.0, bottom: 20),
                  child: Column(
                  children: <Widget>[
                    visibilityObs ? Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                      Expanded(
                          flex: 11,
                          child: TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              isDense: true
                            ),
                          ),
                        ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                            color: Colors.grey[400],
                            icon: const Icon(Icons.cancel, size: 22.0,),
                            onPressed: () {
                              _changed(false, "obs");
                            },
                          ),
                        ),
                      ],
                    ) : Container(),
                  ],
                )
              ),
          
          
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    child: const Text(
                      "Crear producto",
                      style: TextStyle(
                        fontFamily: "Geometric Sans-Serif",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: const Color(0xFF3D5AF1),
                        fixedSize: Size(360, 55),
                        onSurface: const Color(0xFF3D5AF1)),
                    onPressed: 
                         () async {
                         
                          }
                        ,
                  ),
                ),
              ),
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
  
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: _currentIndex - 1,
    count: cardList.length-1,
    effect: WormEffect(
      dotWidth: 40,
      dotHeight: 5,
      dotColor: Color.fromARGB(255, 201, 201, 201),
      activeDotColor: Color.fromARGB(255, 104, 104, 104),
    ),
  );
  
}

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
  const Item2({Key? key}) : super(key: key);
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
                      image: NetworkImage('https://images.unsplash.com/photo-1618354691373-d851c5c3a990?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'), 
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

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);
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
                      image: NetworkImage('https://images.unsplash.com/photo-1618354691438-25bc04584c23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'), 
                      fit: BoxFit.cover,
                    ),
                    ),
                    Align(
                    // These values are based on trial & error method
                    alignment: Alignment(.9, -.9),
                    child: InkWell(
                        onTap: () {
                          cardList.remove(cardList[2]);
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

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);
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
                      image: NetworkImage('https://images.unsplash.com/photo-1618354691551-44de113f0164?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'), 
                      fit: BoxFit.cover,
                    ),
                    ),
                    Align(
                    // These values are based on trial & error method
                    alignment: Alignment(.9, -.9),
                    child: InkWell(
                        onTap: () {
                          cardList.remove(cardList[3]);
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

class Item5 extends StatelessWidget {
  const Item5({Key? key}) : super(key: key);
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
                      image: NetworkImage('https://images.unsplash.com/photo-1618354691229-88d47f285158?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=80'), 
                      fit: BoxFit.cover,
                    ),
                    ),
                    Align(
                    // These values are based on trial & error method
                    alignment: Alignment(.9, -.9),
                    child: InkWell(
                        onTap: () {
                          cardList.remove(cardList[4]);
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

