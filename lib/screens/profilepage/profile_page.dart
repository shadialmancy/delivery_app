import 'package:delivery_app/screens/loginpages/login_page.dart';
import 'package:delivery_app/screens/profilepage/change_password_page.dart';
import 'package:delivery_app/screens/profilepage/payment_settings_page.dart';
import 'package:delivery_app/screens/profilepage/profile_info_page.dart';
import 'package:delivery_app/screens/profilepage/voucher_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/bottom_navigation_bar.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> optionsList = [
    {"name": "My Profile", "screen": const ProfileInfoPage()},
    {"name": "Change Password", "screen": const ChangePasswordPage()},
    {"name": "Payment Settings", "screen": const PaymentSettingsPage()},
    {"name": "My Voucher", "screen": const VoucherPage()}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
      ),
      body: buildBody(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/shadi.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Shadi Ahmed",
                    style: customBoldTxtStyle(20, black),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "01018540042",
                    style: customTxtStyle(15, black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (var item in optionsList)
              buildOption(item["name"], item["screen"]),
          ],
        ),
        const SizedBox(
          height: 110,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: customButton(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
          },
              colorText: black,
              height: 50,
              label: "Sign out",
              width: MediaQuery.of(context).size.width,
              color: black.withOpacity(0.2)),
        )
      ],
    );
  }

  Widget buildOption(String optionText, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => page)));
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              optionText,
              style: customTxtStyle(20, black),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
