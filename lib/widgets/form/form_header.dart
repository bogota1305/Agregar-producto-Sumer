import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
   
  const FormHeader({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
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
                
              );
  }
}