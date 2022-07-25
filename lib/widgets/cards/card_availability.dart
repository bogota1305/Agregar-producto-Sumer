import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool productAvailability = true;
   
class CardAvailability extends StatelessWidget {

  const CardAvailability({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Color? textColor =  const Color.fromARGB(255, 0, 221, 99);

    if(productAvailability == false){
      textColor = Colors.grey;
    }

    return Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 5, bottom: 10, top: 10),
                    child: FlutterSwitch(
                    width: 45.0,
                    height: 30.0,
                    toggleSize: 22.0,
                    value: productAvailability,
                    borderRadius: 30.0,
                    showOnOff: false,
                    activeColor: const Color.fromARGB(255, 0, 221, 99),
                     onToggle: (val) {
                        
                      },
                  ),
                  ),
                  
                  Text(
                      "Disponible",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),         
                ],
              );
  }

  bool get availability{
    return productAvailability;
  }
}