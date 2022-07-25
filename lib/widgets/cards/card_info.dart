import 'package:flutter/material.dart';

import 'card_availability.dart';

class CardInfo extends StatelessWidget {

  final String categoria;
  final String nombre;
  final int precio;
  final bool availability;

 
  const CardInfo({
    Key? key, 
    required this.categoria, 
    required this.nombre, 
    required this.precio, 
    required this.availability
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    bool ava = availability;
    Color? tipe1 = const Color.fromARGB(255, 255, 136, 0);
    Color? tipe2 = const Color.fromARGB(255, 255, 209, 172);
    Color? textColor = Colors.black;

    if(ava == false){
      tipe1 = Colors.grey[800];
      tipe2 = Colors.grey[350];
      textColor = Colors.grey;
    }

    return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                
                TextButton(
                  onPressed: (){}, 
                  style: TextButton.styleFrom(
                    primary: tipe1,
                    backgroundColor: tipe2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ) 
                  ), 
                  child: Text( categoria ),
                ),

                const SizedBox(height: 10,),
                
                Text(
                  nombre,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 5,),

                Text(
                  "\$ $precio",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

              ],
        
    );
  }
}