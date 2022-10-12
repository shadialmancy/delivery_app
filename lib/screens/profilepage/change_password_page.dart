import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:delivery_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController oldPasswordcontroller = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmNewPasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Text(
          "Change Password",
          style: customBoldTxtStyle(20, black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
          color: black,
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavigationBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Old Password",
                style: customBoldTxtStyle(20, black),
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField(oldPasswordcontroller,
                  hintText: "Enter Old Password",
                  icon: const Icon(Icons.lock_outline),
                  isSecure: true,
                  validator: () {}),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enter New Password",
                style: customBoldTxtStyle(20, black),
              ),
              const SizedBox(
                height: 20,
              ),
              customTextField(newPasswordcontroller,
                  hintText: "Enter Old Password",
                  icon: const Icon(Icons.lock_outline),
                  isSecure: true,
                  validator: () {}),
              const SizedBox(
                height: 10,
              ),
              customTextField(confirmNewPasswordcontroller,
                  hintText: "Enter Old Password",
                  icon: const Icon(Icons.lock_outline),
                  isSecure: true,
                  validator: () {}),
            ],
          ),
          customButton(() {
            Navigator.pop(context);
          },
              colorText: primary,
              height: 50,
              label: "Sign out",
              width: MediaQuery.of(context).size.width,
              color: secondary),
        ],
      ),
    );
  }
}
