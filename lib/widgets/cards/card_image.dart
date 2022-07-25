import 'package:flutter/material.dart';
import 'card_buttons.dart';

class CardImage extends StatelessWidget {
   
  final String img;

  const CardImage({Key? key, required this.img}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return
      Image(
        image: NetworkImage(img),
        width: 110,
        height: 110,                 
      );
  }
}