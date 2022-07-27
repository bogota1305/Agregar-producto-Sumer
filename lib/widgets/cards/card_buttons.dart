import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'dart:async';

import 'package:flutter_share/flutter_share.dart';

import '../../pages/create_page.dart';

class CardButtons extends StatelessWidget {

  final ProductModel producto;
 
   
  const CardButtons({Key? key, 
    required this.producto
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(producto: producto, cambios: 1,)),
                        );
                      }, 
                      icon: const Icon(Icons.edit), 
                      color: Colors.grey,
                      padding: const EdgeInsets.all(0),
                    ),

                    const SizedBox(width: 30,),

                    IconButton(
                      onPressed: (){
                        Future<void> share() async {
                        await FlutterShare.share(
                          title: 'Example share',
                          text: 'Example share text',
                          chooserTitle: 'Example Chooser Title'
                        );
  }

                      }, 
                      icon: const Icon(Icons.share), 
                      color: Colors.grey,
                      padding: const EdgeInsets.all(0),
                    ),
                    
                  ],
                  );      
  }
}