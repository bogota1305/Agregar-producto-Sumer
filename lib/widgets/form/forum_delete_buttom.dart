import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/ui_provider.dart';

class FormDeleteButton extends StatelessWidget {

  final int id;
   
  const FormDeleteButton({Key? key, required this.id,}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color.fromARGB(255, 241, 73, 61),
                        fixedSize: Size(360, 55),
                        onSurface: Color.fromARGB(255, 241, 73, 61)),
                    onPressed: 
                         () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Eliminar producto'),
                                  content: Text('Se eliminara definitivamente'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancelar'),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        uiProvider.deleteProduct(id);
                                        Navigator.pop(context, 'Eliminar');
                                      },
                                      child:  const Text('Eliminar',
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 241, 73, 61),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },

                    child: const Text(
                      "Eliminar producto",
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