
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/cardList.dart';
import 'package:flutter_application_1/provider/ui_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          primarySwatch: Colors.blue,
        ),
        home: CardScreen(),
      ),
    );
  }
}