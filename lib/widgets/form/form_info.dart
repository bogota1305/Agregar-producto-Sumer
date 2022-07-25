import 'package:flutter/material.dart';

class FormInfo extends StatelessWidget {

  final String categoria;
  final String nombre;
  final int precio;
   
  const FormInfo({Key? key, 
    required this.categoria, 
    required this.nombre, 
    required this.precio
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  initialValue: nombre,
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
                  initialValue: "$precio",
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
                  initialValue: categoria,
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
      ],
    );
  }
}