import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  List titles = ["My Name", "Phone Number", "Email", "My Address"];

  String? imagePath;

  List info = [
    "Shadi Ahmed",
    "01018540042",
    "shady.almancy@gmail.com",
    "27 Thabet Street cross to Al Shahid Tarek Khalaf Street"
  ];

  void pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath = image.path;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Text(
          "My Profile Page",
          style: customBoldTxtStyle(20, black),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
          color: black,
        ),
      ),
      body: buildBody(),
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
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: black.withOpacity(0.02)),
                      child: imagePath == null
                          ? const Icon(
                              Icons.person,
                              size: 60,
                            )
                          : Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: black.withOpacity(0.02),
                                image: DecorationImage(
                                    image: FileImage(File(imagePath!)),
                                    fit: BoxFit.cover),
                              ),
                            )),
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
                  TextButton(
                    onPressed: pickImage,
                    child:
                        Text("Change Photo", style: customTxtStyle(15, black)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (int i = 0; i < titles.length - 1; i++)
              buildInfo(titles[i], info[i]),
            buildInfo(titles[3],
                info[3].length > 10 ? "${info[3].substring(0, 9)}..." : info[3])
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: customButton(() {},
              colorText: primary,
              height: 50,
              label: "Sign out",
              width: MediaQuery.of(context).size.width,
              color: secondary),
        )
      ],
    );
  }

  Widget buildInfo(String title, String info) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: customTxtStyle(18, black.withOpacity(0.3)),
            textAlign: TextAlign.start,
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
