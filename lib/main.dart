import 'package:doctor_app/constents/Links%20Constants/supabaseconstants.dart';
import 'package:doctor_app/view/Admin/AddDoctor/adddoctor.dart';
import 'package:doctor_app/view/Admin/AdminHomepage/adminhomepage.dart';
import 'package:doctor_app/view/Admin/view_model/dropdown.dart';
import 'package:doctor_app/view/Admin/view_model/userdetailsprovider.dart';
import 'package:doctor_app/view/User/DoctorPage/doctorpage.dart';
import 'package:doctor_app/view/User/ViewDoctor/doctorviewpage.dart';

import 'package:doctor_app/view_model/addDcProvider.dart';
import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:doctor_app/view_model/appoiment.dart';
import 'package:doctor_app/view_model/authenticationpovider.dart';
import 'package:doctor_app/view_model/bottombart.dart';
import 'package:doctor_app/view_model/datepicker.dart';
import 'package:doctor_app/view_model/imagepicker.dart';
import 'package:doctor_app/view_model/otherprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: Supabaseconstants.url, anonKey: Supabaseconstants.key);
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
        ChangeNotifierProvider(
          create: (context) => ImageControllerss(),
        ),
      ],
      child: MaterialApp(
        home: Doctorpage(),
      ),
    );
  }
}
