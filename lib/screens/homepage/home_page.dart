import 'package:delivery_app/screens/homepage/restaurantpage/restaurant_page.dart';
import 'package:delivery_app/screens/homepage/searchpage/search_page.dart';
import 'package:delivery_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/dummy/breakfast_json.dart';
import 'package:delivery_app/dummy/category_json.dart';
import 'package:delivery_app/dummy/resturant_json.dart';
import 'package:delivery_app/dummy/subcategory_json.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';

import '../../widgets/textfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: buildBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: primary,
      title: GestureDetector(
        onTap: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SearchPage())));
        }),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(left: 10, right: 10, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: black.withOpacity(0.1),
          ),
          child: customSearchTextField(
            enabled: false,
            hint: "Search",
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: black.withOpacity(0.6),
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text("None", style: customTxtStyle(15, black.withOpacity(0.8))),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categoryJSON.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      for (var element in categoryJSON) {
                        element["isSelected"] = false;
                      }
                      categoryJSON[index]["isSelected"] =
                          !categoryJSON[index]["isSelected"];

                      setState(() {});
                    },
                    child: categoryJSON[index]["isSelected"]!
                        ? buildCategory(categoryJSON[index]["name"]!,
                            categoryJSON[index]["image"]!, secondary)
                        : buildCategory(
                            categoryJSON[index]["name"]!,
                            categoryJSON[index]["image"]!,
                            black.withOpacity(0.05)),
                  );
                }),
              ),
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "Food Menu",
            style: customBoldTxtStyle(30, black.withOpacity(0.8)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(children: [
              Row(
                children: List.generate(subCategoryJSON.length, (index) {
                  return index % 2 == 0
                      ? rowBuildSubCategory(subCategoryJSON[index]["image"]!,
                          subCategoryJSON[index]["name"]!)
                      : Container();
                }),
              ),
              Row(
                children: List.generate(subCategoryJSON.length, (index) {
                  return index % 2 == 1
                      ? rowBuildSubCategory(subCategoryJSON[index]["image"]!,
                          subCategoryJSON[index]["name"]!)
                      : Container();
                }),
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildHeaderWithText("Near me"),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: List.generate(resturantJSON.length, (index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RestaurantPage(),
                    )),
                child: buildTile(resturantJSON[index]["name"]!,
                    resturantJSON[index]["image"]!),
              );
            }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 230,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/burger-offer-2.jpg"),
                fit: BoxFit.fill),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sale off",
                  style: customTxtStyle(30, Colors.white),
                ),
                Text(
                  "50%",
                  style: customBoldTxtStyle(40, Colors.white),
                ),
                Text(
                  "For breakfast",
                  style: customTxtStyle(30, Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildHeaderWithText("For BreakFast"),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
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
        ),
      ],
    );
  }

  Widget buildCategory(String name, String image, var color) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          name,
          style: customTxtStyle(15, black.withOpacity(0.8)),
        )
      ],
    );
  }

  Widget rowBuildSubCategory(String image, String name) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: secondary.withOpacity(0.8),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25), bottomLeft: Radius.circular(25))),
      child: Stack(
        children: [
          Positioned(
              left: 10,
              top: 50,
              child: Image.asset(
                image,
                height: 100,
                width: 200,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Text(
              name,
              style: customTxtStyle(20, black.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTile(String name, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
                borderRadius: BorderRadius.circular(15)),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
              height: 105,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: customTxtStyle(25, black.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: black.withOpacity(0.3),
                      ),
                      Text(
                        "13th Street, 47 W 13th St, NY",
                        style: customTxtStyle(15, black.withOpacity(0.3)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: black.withOpacity(0.3),
                      ),
                      Text(
                        "3 min - 1.5km",
                        style: customTxtStyle(15, black.withOpacity(0.3)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          int selectedIndex = 3;
                          return Icon(
                            selectedIndex >= index
                                ? Icons.star
                                : Icons.star_border,
                            size: 20,
                            color: secondary,
                          );
                        }),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(4.6)",
                        style: customTxtStyle(13, black.withOpacity(0.3)),
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget buildHeaderWithText(String header) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: customBoldTxtStyle(30, black.withOpacity(0.8)),
          ),
          Text(
            "See all",
            style: customTxtStyle(15, black.withOpacity(0.8)),
          )
        ],
      ),
    );
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
