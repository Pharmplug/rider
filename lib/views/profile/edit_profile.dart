import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/views/profile/widgets/header.dart';

import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../dashboard/dashboard.dart';
import '../navbar/nav.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  final _registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildHeader(_getSize, context,"Edit Profile"),
              SizedBox(
                height: _getSize.height * 0.05,
              ),
             
              Stack(
                children: [
                  Image.asset(
                    AppImages.placeHolder,
                    width: _getSize.width * 0.25,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.edit_note_rounded,
                      size: _getSize.width * 0.08,
                      color: Pallete.primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.025,
              ),
              Form(
                key: _registerFormKey,
                child: Column(children: [
                  CustomInput(
                      hint: "First Name",
                      label: "Enter First Name",
                      onChanged: (c) => {},
                      onSaved: (s) => {}),
                  SizedBox(
                    height: _getSize.height * 0.035,
                  ),
                  CustomInput(
                      hint: "Last Name",
                      label: "Enter Last Name",
                      onChanged: (c) => {},
                      onSaved: (s) => {}),
                  SizedBox(
                    height: _getSize.height * 0.035,
                  ),
                  CustomInput(
                      hint: "Gender",
                      label: "Gender",
                      onChanged: (c) => {},
                      onSaved: (s) => {}),
                  SizedBox(
                    height: _getSize.height * 0.035,
                  ),
                  CustomInput(
                      hint: "Date of Birth",
                      label: "Enter Date of Birth",
                      onChanged: (c) => {},
                      onSaved: (s) => {}),
                  SizedBox(
                    height: _getSize.height * 0.035,
                  ),
                  CustomInput(
                      hint: "Phone",
                      label: "Enter Phone Number",
                      onChanged: (c) => {},
                      onSaved: (s) => {}),
                  SizedBox(
                    height: _getSize.height * 0.035,
                  ),
                  CustomInput(
                      hint: "Home Address",
                      label: "Enter Home Address",
                      onChanged: (c) => {},
                      onSaved: (s) => {}),
                  SizedBox(
                    height: _getSize.height * 0.035,
                  ),
                ]),
              ),
              SizedBox(
                height: _getSize.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWithFunction(
                    text: "Save",
                    onPressed: () => {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavBar(
                                      initialScreen: const Dashboard(),
                                      initialTab: 0,
                                    )),
                            (route) => false,
                          )
                        }),
              ),
              SizedBox(
                height: _getSize.height * 0.04,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
