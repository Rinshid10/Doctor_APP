import 'dart:developer';

import 'package:doctor_app/services/AdminLogin/adminlogin.dart';
import 'package:doctor_app/view/UserSide/widgets/ReUse/widgets.dart';
import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Adminoruser extends StatelessWidget {
  const Adminoruser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<Adminlogin>(
        builder: (context, value, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    value.adminAlredyLogin(context);
                  },
                  child: Text('admin ')),
              ElevatedButton(onPressed: () {}, child: Text(' user')),
            ],
          ),
        ),
      )),
    );
  }
}
