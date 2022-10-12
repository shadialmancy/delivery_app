import 'package:delivery_app/screens/homepage/home_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/auth/login/login_cubit.dart';
import 'controller/auth/register/register_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: primary,
        colorScheme: ThemeData().colorScheme.copyWith(primary: secondary),
      ),
      title: 'Delviro',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
