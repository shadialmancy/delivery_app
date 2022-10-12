import 'package:delivery_app/screens/loginpages/login_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:delivery_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
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
          "An OTP code sent to your phone. Enter it here:",
          style: customTxtStyle(20, black.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 20,
        ),
        customTextField(forgetPasswordController,
            validator: () {},
            hintText: "Enter OTP code",
            textType: TextInputType.phone),
        const SizedBox(
          height: 20,
        ),
        customButton(() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const LoginPage())));
        },
            color: secondary,
            height: 50,
            width: MediaQuery.of(context).size.width,
            label: "Next")
      ],
    );
  }
}
