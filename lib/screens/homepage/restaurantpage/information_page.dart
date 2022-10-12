import 'package:delivery_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../theme/text_style.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  List<Map<String, dynamic>> title = [
    {"name": "Phone", "icon": Icons.phone_outlined},
    {"name": "Email", "icon": Icons.mail_outlined},
    {"name": "Cuisines", "icon": Icons.restaurant_outlined},
    {"name": "Average Cost", "icon": Icons.wallet_outlined}
  ];

  List info = ["123456789", "food@email.com", "Italia", "\$30-\$50"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(title.length, (index) {
        return buildInfo(
            title[index]["name"], title[index]["icon"], info[index]);
      }),
    );
  }

  Widget buildInfo(String title, IconData icon, String info) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: black.withOpacity(0.3),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: customTxtStyle(18, black.withOpacity(0.3)),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Text(
            info,
            style: customTxtStyle(18, black),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
