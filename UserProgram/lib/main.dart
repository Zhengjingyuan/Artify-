import 'package:flutter/material.dart';
import 'package:userprogram/util/size_fit.dart';
import 'common/Routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    HYSizeFit.initialize();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashRoute,
      onGenerateRoute: Routes.generateRoute,

    );
  }
}
