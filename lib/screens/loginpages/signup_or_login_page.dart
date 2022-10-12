import 'package:delivery_app/screens/loginpages/login_page.dart';
import 'package:delivery_app/screens/loginpages/register_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUporLoginPage extends StatefulWidget {
  const SignUporLoginPage({super.key});

  @override
  State<SignUporLoginPage> createState() => _SignUporLoginPageState();
}

class _SignUporLoginPageState extends State<SignUporLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
      ),
      resizeToAvoidBottomInset: false,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: (size.height + 70) / 3,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/burger-2.jpg"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 15,
              ),
              customButton(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const LoginPage())));
              },
                  color: secondary,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  label: "Sign in"),
              const SizedBox(
                height: 15,
              ),
              customButton(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const RegisterPage())));
              },
                  color: black.withOpacity(0.05),
                  colorText: black,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  label: "Sign up"),
            ],
          ),
        ),
        buildNavigationBottom()
      ],
    );
  }

  Widget buildNavigationBottom() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                  child: Divider(
                height: 36,
                thickness: 2,
              )),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Or connect with",
                style: customTxtStyle(13, black.withOpacity(0.5)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width) / 2,
                height: 160,
                child: Stack(
                  children: [
                    Positioned(
                        left: -170,
                        top: -60,
                        child: Image.asset(
                          "assets/images/salad.png",
                          width: 450,
                          height: 400,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
              ),
              iconbuttons(),
            ],
          )
        ],
      ),
    );
  }

  Widget iconbuttons() {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              // ignore: todo
              //TODO g+
            },
            icon: const Icon(
              FontAwesomeIcons.googlePlus,
              color: Color(0xFFdb4a39),
            ),
            iconSize: 35),
        const SizedBox(width: 1),
        IconButton(
            onPressed: () {
              // ignore: todo
              //TODO face
            },
            icon: const Icon(
              FontAwesomeIcons.facebook,
              color: Color(0xFF4267B2),
            ),
            iconSize: 35),
        const SizedBox(width: 1),
        IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesomeIcons.apple),
            iconSize: 35),
      ],
    );
  }
}
