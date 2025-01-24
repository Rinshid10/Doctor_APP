import 'package:doctor_app/view/Admin/AdminHomepage/adminhomepage.dart';
import 'package:doctor_app/view/Admin/AdminLoogin/adminuserpage.dart';
import 'package:doctor_app/view/Admin/Pichartes/AppoimentPiechart/appoimentpie.dart';
import 'package:doctor_app/view/Admin/view_model/dropdown.dart';
import 'package:doctor_app/view/Admin/view_model/userdetailsprovider.dart';
import 'package:doctor_app/view/User/AdminOrUser/adminoruser.dart';

import 'package:doctor_app/view/User/loginAndSignUP/LoginPage/loginpage.dart';
import 'package:doctor_app/view_model/addDcProvider.dart';
import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:doctor_app/view_model/bottombart.dart';
import 'package:doctor_app/view_model/datepicker.dart';
import 'package:doctor_app/view_model/otherprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottombartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Adddcprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Authenticationpovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DropdownAdmin(),
        ),
        ChangeNotifierProvider(
          create: (context) => Userdetailsprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppoimentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Adminlogin(),
        ),
        ChangeNotifierProvider(
          create: (context) => Otherprovider(),
        ),
      ],
      child: MaterialApp(
        home: Adminoruser(),
      ),
    );
  }
}
