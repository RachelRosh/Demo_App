import 'package:demo_app/HomePage/homepage.dart';
import 'package:demo_app/Provider/detailsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DetailsProvider()),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomePage()),
    );
  }
}
