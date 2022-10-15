import 'package:delivery_app/bloc/category/maincategory/category_bloc.dart';
import 'package:delivery_app/bloc/category/subcategory/subcategory_bloc.dart';
import 'package:delivery_app/screens/homepage/home_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/login/login_cubit.dart';
import 'bloc/auth/register/register_cubit.dart';
import 'bloc/restaurant/restaurant_bloc.dart';

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
          BlocProvider(
            create: (context) => CategoryBloc(),
          ),
          BlocProvider(
            create: (context) => SubCategoryBloc(),
          ),
          BlocProvider(
            create: (context) => RestaurantBloc()..add(LoadRestaurant()),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
