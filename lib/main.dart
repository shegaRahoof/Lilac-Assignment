import 'package:flutter/material.dart';
import 'package:lilac_assignmnt_app/Screens/Home_page.dart';
import 'package:lilac_assignmnt_app/viewmodels/commonviewmodel.dart';
import 'package:provider/provider.dart';

import 'Screens/splash_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider<commonviewmodel>(
      create: (context) => commonviewmodel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(canvasColor: Colors.grey[400]),
        home: SplashScreen(),
      ),
    ),
  );
}
