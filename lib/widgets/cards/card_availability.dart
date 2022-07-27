import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
   
class CardAvailability extends StatefulWidget {

  final bool availability;

  const CardAvailability({Key? key, required this.availability}) : super(key: key);

  @override
  State<CardAvailability> createState() => _CardAvailabilityState();
}

class _CardAvailabilityState extends State<CardAvailability> {

  bool productAvailability = true;

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
                        setState(() {

                          productAvailability = val;

                          if(productAvailability == false){
                            textColor = Colors.grey;
                          }

                        });
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
}