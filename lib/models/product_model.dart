// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    ProductModel({
        this.id,
        required this.tipo,
        required this.nombre,
        required this.precio,
        required this.disponibilidad,
        required this.imagen,
    });

    int? id;
    String tipo;
    String nombre;
    int precio;
    int disponibilidad;
    String imagen;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        tipo: json["tipo"],
        nombre: json["nombre"],
        precio: json["precio"],
        disponibilidad: json["disponibilidad"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "nombre": nombre,
        "precio": precio,
        "disponibilidad": disponibilidad,
        "imagen": imagen,
    };
}
