import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_app/screens/loginpages/signup_or_login_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/custom_silder.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  List items = [
    Column(
      children: [
        Image.asset(
          "assets/images/chicken-cooked.png",
          height: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Delicious Food",
          style: customBoldTxtStyle(30, primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Lorem ipsum dolor sit amet,"
          "consectetur adipiscing elit. Nulla eu ex facilisis "
          "turpis sodales iaculis at eu libero.",
          textAlign: TextAlign.center,
          style: customTxtStyle(10, primary),
        ),
      ],
    ),
    Column(
      children: [
        Image.asset(
          "assets/images/shipping.png",
          // width: 250,
          // height: 150,
          // width: 400,
          height: 250,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Fast Shipping",
          style: customBoldTxtStyle(30, primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Lorem ipsum dolor sit amet,"
          "consectetur adipiscing elit. Nulla eu ex facilisis "
          "turpis sodales iaculis at eu libero.",
          textAlign: TextAlign.center,
          style: customTxtStyle(10, primary),
        ),
      ],
    ),
    Column(
      children: [
        Image.asset(
          "assets/images/badge.png",
          // width: 250,
          // height: 150,
          // width: 300,
          height: 250,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Certificate Food",
          style: customBoldTxtStyle(30, primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Lorem ipsum dolor sit amet,"
          "consectetur adipiscing elit. Nulla eu ex facilisis "
          "turpis sodales iaculis at eu libero.",
          textAlign: TextAlign.center,
          style: customTxtStyle(10, primary),
        ),
      ],
    ),
    Column(
      children: [
        Image.asset(
          "assets/images/payment-online.png",
          // width: 300,
          height: 250,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Payment Online",
          style: customBoldTxtStyle(30, primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Lorem ipsum dolor sit amet,"
          "consectetur adipiscing elit. Nulla eu ex facilisis "
          "turpis sodales iaculis at eu libero.",
          textAlign: TextAlign.center,
          style: customTxtStyle(10, primary),
        ),
      ],
    ),
    Container()
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondary,
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height - 20,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: ((index, reason) {
                    setActiveDot(index);
                    if (items.length - 1 == index) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUporLoginPage()));
                    }
                  })),
              items: List.generate(items.length, (index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 7),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [items[index]]),
                    ));
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length - 1,
                (idx) {
                  return activeIndex == idx
                      ? const ActiveDot()
                      : const InactiveDot();
                },
              ),
            ),
          ],
        ));
  }
}
