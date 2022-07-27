import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/provider/db_provider.dart';

import 'card_availability.dart';
import 'card_buttons.dart';
import 'card_info.dart';
import 'card_image.dart';

class CustomCard2 extends StatelessWidget {
  CustomCard2({Key? key, required this.producto}) : super(key: key);
  
  ProductModel producto;

  @override
  Widget build(BuildContext context) {

    //String categoria = "Ropa";
    //String nombre = "Hoddie";
    //int precio = 15000;
    //int availability = 1;
    //String img = 'https://cf.shopee.com.co/file/6210e2b09b1b9d9c7866719fce3c9d5f_tn';

    String categoria = producto.tipo;
    String nombre = producto.nombre;
    int precio = producto.precio;
    int availability = producto.disponibilidad;
    String img = producto.imagen;

    
    //final tempProducto = ProductModel(tipo: categoria, nombre: "Prueba", precio: precio, disponibilidad: availability, imagen: img);
    //print(tempProducto.nombre);
    
    //DBProvider.db.nuevoProducto(tempProducto);

    //DBProvider.db.getProductById(5).then((product) => print(product!.nombre));
    //DBProvider.db.getProductById(5).then((product) => nombre = product!.nombre);

    //void asignarProducto(ProductModel ?pro){

      //producto = ProductModel(tipo: pro!.tipo, nombre: pro.nombre, precio: pro.precio, disponibilidad: pro.disponibilidad, imagen: pro.imagen);
      //nombre = producto!.nombre;
      //print('Producto1: $nombre');

    //}

    print('Producto1:');
    print(img);

    //DBProvider.db.getProductById(5).then((product) => productos.add(product!));

    //ProductModel(tipo: product!.tipo, nombre: product.nombre, precio: product.precio, disponibilidad: product.disponibilidad, imagen: product.imagen)
 
    //producto = DBProvider.db.getProductById(5);

    //print('Producto2:');
    //print(productos.length);

    bool disponible = true;

    if(availability == 0){
      disponible = false;
    }
   
    return Card(
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
        ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15),
        child: Row(
        
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [

                CardInfo(categoria: categoria, nombre: nombre, precio: precio, availability: disponible, ),

                CardAvailability(availability: disponible,)
              ],
            ),

            
            
            const SizedBox(width: 250,),

            Column(
              children: [
                CardImage(img: img),

                CardButtons(producto: producto,),
              ],
            ),

            
          
          ],
        ),
      ),
    );
  }

}

