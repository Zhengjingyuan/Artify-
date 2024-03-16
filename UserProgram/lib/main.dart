import 'package:flutter/material.dart';

import 'common/Routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=>_MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: Routes.generateRoute,

    );
  }
}
