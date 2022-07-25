import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/provider/db_provider.dart';

import 'card_availability.dart';
import 'card_buttons.dart';
import 'card_info.dart';
import 'card_image.dart';

class CustomCard2 extends StatelessWidget {
  const CustomCard2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    String categoria = "Ropa";
    String nombre = "Hoddie";
    int precio = 15000;
    bool availability = true;
    String img = 'https://cf.shopee.com.co/file/6210e2b09b1b9d9c7866719fce3c9d5f_tn';

    final tempProducto = new ProductModel(tipo: "Ropa", nombre: "Hoddie", precio: 15000, disponibilidad: true, imagen: 'https://cf.shopee.com.co/file/6210e2b09b1b9d9c7866719fce3c9d5f_tn');
    DBProvider.db.getProductById(1).then((product) => print(product!.id));
     

   
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

                CardInfo(categoria: categoria, nombre: nombre, precio: precio, availability: availability, ),

                CardAvailability()
              ],
            ),

            
            
            const SizedBox(width: 73,),

            Column(
              children: [
                CardImage(img: img),

                CardButtons(categoria: categoria, nombre: nombre, precio: precio, img: img,),
              ],
            ),

            
          
          ],
        ),
      ),
    );
  }

}

