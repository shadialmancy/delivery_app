import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  String text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      "Vestibulum id ante quis arcu sodales laoreet. Sed eu lacus at magna tincidunt tincidunt."
      "Sed aliquet non leo et finibus. Donec diam ligula, pulvinar non velit eget, vehicula blandit"
      "ligula. Nulla aliquam vestibulum tellus, vitae pharetra metus cursus quis. Vivamus non "
      "dolor metus. Proin vitae imperdiet tortor. In ac magna sapien. Ut sit amet mattis dui."
      "Praesent sed nulla hendrerit, suscipit sem ac, viverra orci. Donec magna justo, dignissim"
      "ut bibendum eu, scelerisque eu neque.";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              buildHeader(),
              Text(
                text,
              )
            ],
          ),
        );
      }),
    );
  }
}

Widget buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/shadi.jpg"),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shadi Ahmed",
                style: customBoldTxtStyle(10, black),
              ),
              Row(
                children: List.generate(5, (index) {
                  int selectedIndex = 3;
                  return Icon(
                    selectedIndex >= index ? Icons.star : Icons.star_border,
                    size: 20,
                    color: secondary,
                  );
                }),
              ),
            ],
          )
        ],
      ),
      Text(
        "Yesterday 9:23",
        style: customTxtStyle(15, black.withOpacity(0.2)),
      )
    ],
  );
}
