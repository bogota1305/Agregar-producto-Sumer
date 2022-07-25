import 'package:flutter/material.dart';

class CarouselIndex extends StatelessWidget {

  final int index;

  final List cardList;

  CarouselIndex({Key? key, required int this.index, required List this.cardList}) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 22, right: 160,),
                            child: Text(
                              "Foto: " + (index ).toString() + " de " + (cardList.length-1).toString(),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      margin: EdgeInsets.only(),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            child: Text(
                              "Editar fotos",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(Icons.edit, color: Colors.black),
                        ],
                      ),
                    )
                  ),

                          ],
                      ),
                    ),
                  SizedBox(width: 24.0),
                ],
              );
              
  }
}