import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/provider/db_provider.dart';

class UiProvider extends ChangeNotifier{

  List<ProductModel> _productos = [];

  final productStreamController = StreamController<List<ProductModel>>.broadcast();

  UiProvider(){
    getProductsFromDatatbase();
  }

  List<ProductModel> get productos{
    return this._productos;
  }
  

  void producto(ProductModel pro){
    //this._productos.add(pro);
    DBProvider.db.nuevoProducto(pro);
    notifyListeners();
    getProductsFromDatatbase();
  }
  
  void getProductsFromDatatbase() async {
    this._productos = await DBProvider.db.getTodosLosProductos();
    notifyListeners();
  }

  void updateProduct(ProductModel pro){
    DBProvider.db.updateProduct(pro);
    notifyListeners();
    getProductsFromDatatbase();
  }

  void deleteProduct(int i){
    DBProvider.db.deleteProduct(i);
    notifyListeners();
    getProductsFromDatatbase();
  }

  Function(List<ProductModel>) get productSink{
    return productStreamController.sink.add;
  }

  Stream<List<ProductModel>> get productStream{
    return productStreamController.stream;
  }

  void dispose(){
    productStreamController.close();
  }
}