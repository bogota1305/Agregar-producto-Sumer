import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
   
  const FormButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
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
                         () async {
                         
                          }
                        ,
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