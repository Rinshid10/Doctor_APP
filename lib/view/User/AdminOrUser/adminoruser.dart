import 'package:doctor_app/view_model/adminlogin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:doctor_app/services/AdminLogin/adminlogin.dart';
import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/User/loginAndSignUP/LoginPage/loginpage.dart';

class AdminAnimationProvider with ChangeNotifier {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  AdminAnimationProvider(TickerProvider vsync) {
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 800),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
            begin: const Offset(0, 0.2), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  Animation<double> get opacityAnimation => _opacityAnimation;
  Animation<Offset> get slideAnimation => _slideAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Adminoruser extends StatefulWidget {
  const Adminoruser({super.key});

  @override
  _AdminoruserState createState() => _AdminoruserState();
}

class _AdminoruserState extends State<Adminoruser>
    with TickerProviderStateMixin {
  late AdminAnimationProvider _animationProvider;

  @override
  void initState() {
    super.initState();
    _animationProvider = AdminAnimationProvider(this);
  }

  @override
  void dispose() {
    _animationProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AdminAnimationProvider>.value(
      value: _animationProvider,
      child: Scaffold(
        backgroundColor: ColorsConstents.backGroundColor,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<AdminAnimationProvider>(
                    builder: (context, provider, child) => FadeTransition(
                      opacity: provider.opacityAnimation,
                      child: SlideTransition(
                        position: provider.slideAnimation,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                ColorsConstents.buttonColors
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image(
                                image: AssetImage(
                                    'asset/baground-removebg-preview.png')),
                          )),
                        ),
                      ),
                    ),
                  ),
                  const Gap(30),

                  // Welcome Text with Animation
                  Consumer<AdminAnimationProvider>(
                    builder: (context, provider, child) => FadeTransition(
                      opacity: provider.opacityAnimation,
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: ColorsConstents.textBlueColor,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Consumer<AdminAnimationProvider>(
                    builder: (context, provider, child) => FadeTransition(
                      opacity: provider.opacityAnimation,
                      child: Text(
                        'Please select your role to continue',
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsConstents.textBlueColor.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const Gap(40),

                  //
                  Consumer<AdminAnimationProvider>(
                    builder: (context, provider, child) => FadeTransition(
                      opacity: provider.opacityAnimation,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.blueAccent,
                          elevation: 5,
                        ),
                        onPressed: () {
                          Provider.of<Adminlogin>(context, listen: false)
                              .adminAlredyLogin(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.admin_panel_settings,
                                color: Colors.white),
                            const Gap(10),
                            Text(
                              'Continue as Admin',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),

                  // User Button
                  Consumer<AdminAnimationProvider>(
                    builder: (context, provider, child) => FadeTransition(
                      opacity: provider.opacityAnimation,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          side: BorderSide(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.person, color: Colors.blueAccent),
                            const Gap(10),
                            Text(
                              'Continue as User',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
