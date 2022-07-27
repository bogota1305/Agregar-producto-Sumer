import 'package:flutter/material.dart';

import 'form_buttom.dart';
import 'form_extras.dart';
import 'forum_delete_buttom.dart';

class FormInfo extends StatefulWidget {

  final String categoria;
  final String nombre;
  final int precio;
  final int disponibilidad;
  final String imagen;
  final int cambios;

  final int id;


  FormInfo({Key? key, 
    required this.categoria, 
    required this.nombre, 
    required this.precio, 
    required this.disponibilidad, 
    required this.imagen, 
    required this.cambios, 
    required this.id
  }) : super(key: key);

  @override
  State<FormInfo> createState() => _FormInfoState();
}

class _FormInfoState extends State<FormInfo> {

  String nom = '';
  String tip = '';
  int pre = 0;

  void setNombre(String n){
    setState(() {
      nom = n;
    });
  }

  void setTipo(String n){
    setState(() {
      tip = n;
    });
  }

  void setPrecio(String n){
    if(n != null && n != ''){
      setState(() {
      pre = int.tryParse(n)!;
    });
    }  
  }

  void setAll(){
    setState(() {
      nom = widget.nombre;
      tip = widget.categoria;
      pre = widget.precio;
    });
  }
  

  @override
  Widget build(BuildContext context) {

  if(widget.cambios == 1){
    setAll();
  }
    
    return Column(
      children: [
        Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
                child: TextFormField(
                  initialValue: widget.nombre,
                  onChanged: (value) {
                     setNombre(value);
                  },
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
                  keyboardType: TextInputType.number,
                  initialValue: "${widget.precio}",
                  onChanged: (value) {
                    setPrecio(value);
                  },
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
                  initialValue: widget.categoria,
                  onChanged: (value) {
                     setTipo(value);
                  },
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
              
              const FormExtras(),
              
              FormButton(tipo: tip, nombre: nom, precio: pre, disponibilidad: widget.disponibilidad, imagen: widget.imagen, cambios: widget.cambios,),

              FormDeleteButton(id: widget.id,)
      ],
    );
  }
}