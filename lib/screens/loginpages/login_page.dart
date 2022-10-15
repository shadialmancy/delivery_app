import 'package:delivery_app/screens/loginpages/forget_password_page.dart';
import 'package:delivery_app/screens/homepage/home_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:delivery_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/auth/login/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
      resizeToAvoidBottomInset: false,
      backgroundColor: primary,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is GetUserSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        } else if (state is GetUserFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid email and password")));
        } else if (state is ChangeVisibility) {
        } else {
          const Text("Something went wrong");
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is GetUserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Form(
              key: formKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sign in",
                              style: customBoldTxtStyle(40, black),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          customTextField(
                            emailController,
                            hintText: "Email",
                            icon: const Icon(
                              Icons.person,
                              size: 30,
                            ),
                            textType: TextInputType.emailAddress,
                            validator: () {
                              if (emailController.text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              if (!emailController.text.contains("@") ||
                                  !emailController.text.contains(".com")) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          customTextField(
                            passwordController,
                            hintText: "Password",
                            isSecure: !context.read<LoginCubit>().isVisible,
                            icon: const Icon(
                              Icons.lock,
                              size: 30,
                            ),
                            textType: TextInputType.emailAddress,
                            validator: () {
                              if (passwordController.text.isEmpty) {
                                return 'Can\'t be empty';
                              }
                              return null;
                            },
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: context.read<LoginCubit>().isVisible,
                                onChanged: (value) {
                                  context.read<LoginCubit>().changeVisibility();
                                },
                                activeColor: secondary,
                              ),
                              Text(
                                "Show Password",
                                style:
                                    customTxtStyle(15, black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          customButton(() {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().checkUserData(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                              color: secondary,
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              label: "Sign in"),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                  onPressed: (() => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetPasswordPage()))),
                                  child: Text(
                                    "Forgot Password?",
                                    style: customTxtStyle(
                                        15, black.withOpacity(0.5)),
                                  ))),
                        ],
                      ),
                    ),
                    buildNavigationBottom()
                  ],
                ),
              ),
            );
          }
        },
      ),
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
