import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/provider/ui_provider.dart';

import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../provider/db_provider.dart';
import 'create_page.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //DBProvider.db.database;

    final uiProvider = Provider.of<UiProvider>(context);

    final productos = uiProvider.productos;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.only(bottom: 80),
        itemBuilder: (context, i){
          return CustomCard2(producto: productos[i]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage(producto: ProductModel(tipo: '', nombre: '', precio: 0, disponibilidad: 1, imagen: 'https://static.wikia.nocookie.net/mitologa/images/a/a3/Imagen_por_defecto.png/revision/latest/top-crop/width/360/height/360?cb=20150824230838&path-prefix=es'),cambios:0)),
                        );
        },
      ),
    );
  }
}

