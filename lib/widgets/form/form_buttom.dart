import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../provider/ui_provider.dart';

class FormButton extends StatelessWidget {
   
  const FormButton({Key? key, required this.tipo, required this.nombre, required this.precio, required this.disponibilidad, required this.imagen, required this.cambios}) : super(key: key);

  final String tipo;
  final String nombre;
  final int precio;
  final int disponibilidad;
  final String imagen;
  final int cambios;
  
  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: const Color(0xFF3D5AF1),
                        fixedSize: Size(360, 55),
                        onSurface: const Color(0xFF3D5AF1)),
                    onPressed: 
                         () {
                            //uiProvider.updateProduct(ProductModel(tipo: tipo, nombre: nombre, precio: precio, disponibilidad: disponibilidad, imagen: imagen));
                            print('Cuantos cambios se han realizado $cambios');
                            String alerta = '';
                            int falta = 0;

                            if(tipo == ''){ 
                              alerta = 'Complete el campo de tipo';
                              falta++;
                            }
                            if(nombre == ''){
                              alerta = 'Complete el campo de nombre';
                              falta++;
                            }
                            if(precio == 0){
                              alerta = 'Complete el campo de precio';
                              falta++;
                            }
                            if(falta > 1){
                              alerta = 'Complete todos los campos';
                            }


                            if(tipo != '' && nombre != '' && precio != 0){

                              if(cambios == 0){
                                uiProvider.producto(ProductModel(tipo: tipo, nombre: nombre, precio: precio, disponibilidad: disponibilidad, imagen: imagen));
                              }
                              else{
                                uiProvider.updateProduct(ProductModel(tipo: tipo, nombre: nombre, precio: precio, disponibilidad: disponibilidad, imagen: imagen));
                              }
                              
                              Navigator.pop(context);
                            }
                            else{
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Formulario incompleto'),
                                  content: Text(alerta),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                            
                            },

                    child: const Text(
                      "Guardar cambios",
                      style: TextStyle(
                        fontFamily: "Geometric Sans-Serif",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
  }
}