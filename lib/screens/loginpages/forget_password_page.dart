import 'package:delivery_app/screens/loginpages/otp_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:delivery_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController forgetPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forget Password",
          style: customBoldTxtStyle(50, black),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Enter your phone",
          style: customTxtStyle(20, black.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 20,
        ),
        customTextField(forgetPasswordController,
            validator: () {},
            hintText: "Phone number",
            icon: const Icon(Icons.phone),
            textType: TextInputType.phone),
        const SizedBox(
          height: 20,
        ),
        customButton(() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const OTPPage())));
        },
            color: secondary,
            height: 50,
            width: MediaQuery.of(context).size.width,
            label: "Next")
      ],
    );
  }
}
