import 'package:flutter_application_1/Features/views/homepage.dart';
import 'package:flutter_application_1/Features/views/loginpage/forget.dart';
import 'package:flutter_application_1/Features/views/loginpage/login.dart';
import 'package:flutter_application_1/Features/views/loginpage/signup.dart';

import 'package:flutter_application_1/Features/views/screen1.dart';
import 'package:flutter_application_1/Features/views/screen2.dart';
import 'package:flutter_application_1/Features/views/screen3.dart';
import 'package:flutter_application_1/Features/views/settings/about.dart';
import 'package:flutter_application_1/Features/views/settings/faq.dart';

import 'package:get/get.dart';

List<GetPage> approutes() {
  
  return [
    GetPage(name: '/login', page: () => LoginPage()),
    GetPage(name: '/forget', page: () => ForgotPasswordPage()),
    GetPage(name: '/signup', page: () => SignUpPage()),
    GetPage(name: '/home', page: () => Homepage()),
    GetPage(name: '/createsession', page: () => Createsession()),
    GetPage(name: '/athletes', page: () => athletespage()),
    GetPage(name: '/history', page: () => Historypage()),
    GetPage(name: '/faq', page: () => faq()),
    GetPage(name: '/aboutpage', page: () => aboutpage()),
      ];
}
