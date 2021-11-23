import 'package:flutter/material.dart';
import 'package:mini/src/pages/apartment/apartment_page.dart';
import 'package:mini/src/pages/condo/condo_page.dart';
import 'package:mini/src/pages/dormitory/dormitory_page.dart';
import 'package:mini/src/pages/home/home_page.dart';
import 'package:mini/src/pages/info/info_page.dart';
import 'package:mini/src/pages/login/login_page.dart';
import 'package:mini/src/pages/mansion/mansion_page.dart';
import 'package:mini/src/pages/register/register_page.dart';
import 'package:mini/src/pages/roomtype/room_type_page.dart';
import 'package:mini/src/pages/roomtype/roomadd_page.dart';



class AppRoute{
  static const homeRoute = 'home';
  static const infoRoute = 'info';
  static const loginRoute = 'login';
  static const registerRoute = 'register';
  static const condoRoutr = 'condo';
  static const apartmentRoutr = 'apartment';
  static const mansionRoutr = 'mansion';
  static const dormitoryRoutr = 'dormitory';
  static const roomtypeRoutr = 'roomtype';
  static const roomaddRoutr = 'roomadd';





  final _route = <String, WidgetBuilder>{
    homeRoute: (comtext) => HomePage(),
    infoRoute: (comtext) => InfoPage(),
    loginRoute: (comtext) => LoginPage(),
    registerRoute: (comtext) => RegisterPage(),
    condoRoutr: (comtext) => CondoPage(),
    apartmentRoutr: (comtext) => ApartmentPage(),
    mansionRoutr: (comtext) => MansionPage(),
    dormitoryRoutr: (comtext) => DormitoryPage(),
    roomtypeRoutr: (comtext) => RoomtypePage(),
    roomaddRoutr: (comtext) => RoomaddPage(),


  };

  get getAll => _route;
}//end class