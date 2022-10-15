import 'package:delivery_app/screens/homepage/home_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:delivery_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bloc/auth/register/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController checkPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          elevation: 0,
          leading: IconButton(
            color: black,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: primary,
        resizeToAvoidBottomInset: false,
        body: getBody());
  }

  Widget getBody() {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
        } else if (state is RegisterFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Error something went wrong")));
        } else if (state is RegisterEmailDuplicated) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Email already registered")));
        }
      },
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          if (state is RegisterLoading) {
            return const CircularProgressIndicator();
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign up",
                            style: customBoldTxtStyle(40, black),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        customTextField(emailController, validator: () {
                          if (emailController.text.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (!emailController.text.contains("@") ||
                              !emailController.text.contains(".com")) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                            hintText: "Enter Email",
                            icon: const Icon(
                              Icons.person,
                              size: 30,
                            ),
                            textType: TextInputType.emailAddress),
                        const SizedBox(
                          height: 15,
                        ),
                        customTextField(passwordController,
                            isSecure: context.read<RegisterCubit>().isVisible,
                            validator: () {
                          String text1 = passwordController.text;
                          String text2 = checkPasswordController.text;
                          if (text1.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text1.length < 8) {
                            return 'Password too short. minimum required 8';
                          }
                          if (text1 != text2) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                            hintText: "Enter Password",
                            icon: const Icon(
                              Icons.lock,
                              size: 30,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        customTextField(checkPasswordController,
                            isSecure: context.read<RegisterCubit>().isVisible,
                            validator: () {
                          String text1 = passwordController.text;
                          String text2 = checkPasswordController.text;
                          if (text2.isEmpty) {
                            return 'Can\'t be empty';
                          }
                          if (text2.length < 8) {
                            return 'Password too short. minimum required 8';
                          }
                          if (text1 != text2) {
                            return 'Password doesn\'t match';
                          }
                          return null;
                        },
                            hintText: "Re-Enter Password",
                            icon: const Icon(
                              Icons.lock,
                              size: 30,
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: context.read<RegisterCubit>().isVisible,
                              onChanged: (value) {
                                context
                                    .read<RegisterCubit>()
                                    .changeVisibility();
                              },
                              activeColor: secondary,
                            ),
                            Text(
                              "Show Password",
                              style: customTxtStyle(15, black.withOpacity(0.6)),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        customButton(() {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().sendUserData(
                                emailController.text, passwordController.text);
                          }
                        },
                            color: secondary,
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            label: "Sign up")
                      ]),
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
      padding: const EdgeInsets.only(right: 20, top: 4),
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
                        right: -50,
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
      // mainAxisAlignment: MainAxisAlignment.end,
      // crossAxisAlignment: CrossAxisAlignment.start,
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
