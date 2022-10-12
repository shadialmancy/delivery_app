import 'package:delivery_app/dummy/breakfast_json.dart';
import 'package:delivery_app/screens/homepage/searchpage/fliter_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/bottom_navigation_bar.dart';
import 'package:delivery_app/widgets/textfield.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> searchItems = [
    "Humburger",
    "Sushi",
    "Pizza",
    "Noodle",
    "Spaghetti",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leadingWidth: 30,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 25,
          color: black,
        ),
        onPressed: (() => Navigator.pop(context)),
      ),
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: black.withOpacity(0.1),
        ),
        child: customSearchTextField(hint: "Search"),
      ),
      actions: [
        IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: (() => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FilterPage()))),
            icon: Icon(
              Icons.filter_list_rounded,
              color: black,
            )),
      ],
    );
  }

  Widget buildBody() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: black.withOpacity(0.5),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search History",
                      style: customTxtStyle(15, black.withOpacity(0.5)),
                    )
                  ],
                ),
                Text(
                  "Clear all",
                  style: customTxtStyle(15, black.withOpacity(0.5)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(searchItems.length, (index) {
                    return ListTile(
                      leading: Text(
                        searchItems[index],
                        style: customTxtStyle(15, black),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            searchItems.remove(searchItems[index]);
                          });
                        },
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Popular",
                style: customBoldTxtStyle(40, black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(children: [
                Row(
                  children: List.generate(breakfastJSON.length, (index) {
                    return index % 2 == 0
                        ? rowBuildList(breakfastJSON[index]["image"]!,
                            breakfastJSON[index]["name"]!)
                        : Container();
                  }),
                ),
                Row(
                  children: List.generate(breakfastJSON.length, (index) {
                    return index % 2 == 1
                        ? rowBuildList(breakfastJSON[index]["image"]!,
                            breakfastJSON[index]["name"]!)
                        : Container();
                  }),
                )
              ]),
            ),
          ],
        ));
  }

  Widget rowBuildList(String image, String name) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: secondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        ),
        Text(
          name,
          style: customTxtStyle(15, black.withOpacity(0.8)),
        )
      ],
    );
  }
}
