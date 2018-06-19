import 'package:flutter/material.dart';
import 'package:tlv_bloc_core_flutter_master/screens/login/login_screen.dart';
import 'package:tlv_bloc_core_flutter_master/screens/home/home_screen.dart';
final routes={
  '/': (BuildContext context)=>new LoginScreen(),
  '/home':         (BuildContext context) => new HomeScreen(),
  '/login':(BuildContext context)=>new LoginScreen()
};