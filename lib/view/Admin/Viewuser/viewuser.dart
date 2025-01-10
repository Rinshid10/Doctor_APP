import 'package:doctor_app/utils/colors/colors.dart';
import 'package:doctor_app/view/Admin/view_model/userdetailsprovider.dart';
import 'package:doctor_app/view/User/widgets/ReUse/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Viewuser extends StatefulWidget {
  const Viewuser({super.key});

  @override
  State<Viewuser> createState() => _ViewuserState();
}

class _ViewuserState extends State<Viewuser> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Userdetailsprovider>(context, listen: false)
        .getAllUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstents.backGroundColor,
      appBar: AppBar(),
      body: Consumer<Userdetailsprovider>(
        builder: (context, value, child) {
          if (value.listUserData.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.listUserData.length,
                  itemBuilder: (context, index) {
                    final datas = value.listUserData[index];
                    return Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: 120,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                ),
                              ),
                              Gap(20),
                              Column(
                                spacing: 10,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textDemo(
                                      text: 'Name  : ${datas.username}',
                                      fontwight: FontWeight.bold,
                                      fontsized: 15),
                                  textDemo(
                                      text: 'Phone : ${datas.phonenumber}',
                                      fontsized: 15),
                                  textDemo(
                                      text: 'Email : ${datas.email}',
                                      fontsized: 15),
                                  textDemo(
                                      text: 'Enter : ${datas.date}',
                                      fontsized: 15),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
