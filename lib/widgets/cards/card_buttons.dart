import 'package:flutter/material.dart';

import '../../pages/create_page.dart';

class CardButtons extends StatelessWidget {

  final String categoria;
  final String nombre;
  final int precio;
  final String img;
   
  const CardButtons({Key? key, 
    required this.categoria, 
    required this.nombre, 
    required this.precio, 
    required this.img
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(categoria: categoria, nombre: nombre, precio: precio, img: img,)),
                        );
                      }, 
                      icon: const Icon(Icons.edit), 
                      color: Colors.grey,
                      padding: const EdgeInsets.all(0),
                    ),

                    const SizedBox(width: 30,),

                    IconButton(
                      onPressed: (){}, 
                      icon: const Icon(Icons.share), 
                      color: Colors.grey,
                      padding: const EdgeInsets.all(0),
                    ),
                    
                  ],
                  );      
  }
}