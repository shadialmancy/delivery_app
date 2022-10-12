import 'package:delivery_app/dummy/category_json.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List locationOptions = [
    {"name": "Bronx", "isSelected": false},
    {"name": "Manhattan", "isSelected": false},
    {"name": "Queens", "isSelected": false},
    {"name": "Brooklyn", "isSelected": false},
    {"name": "Staten Island", "isSelected": false},
    {"name": "Near me", "isSelected": false}
  ];

  List filterOptions = [
    {"name": "Open", "isSelected": false},
    {"name": "Sale off", "isSelected": false},
    {"name": "Pick up", "isSelected": false},
    {"name": "Verified", "isSelected": false},
    {"name": "Preferred", "isSelected": false},
    {"name": "Ordered", "isSelected": false}
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: customButton(() {
          Navigator.pop(context);
        },
            color: secondary,
            height: 55,
            width: MediaQuery.of(context).size.width,
            label: "Apply"),
      ),
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Filter",
        style: customTxtStyle(20, black),
      ),
      actions: [TextButton(onPressed: () {}, child: const Text("Clear all"))],
    );
  }

  Widget buildBody() {
    return ListView(
      children: [
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
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Location",
            style: customBoldTxtStyle(30, black),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildGridView(locationOptions),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Filter by",
            style: customBoldTxtStyle(30, black),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildGridView(filterOptions),
        const SizedBox(
          height: 20,
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
          // i did this to resize the image by using padding PS. width and height didnt work
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

  Widget buildOptions(String location, var color, var textColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color,
      ),
      child: Center(
          child: Text(
        location,
        style: TextStyle(color: textColor),
      )),
    );
  }

  Widget buildGridView(List list) {
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: (120 / 50),
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(list.length, (index) {
            return GestureDetector(
                onTap: () {
                  for (var element in list) {
                    element["isSelected"] = false;
                  }
                  list[index]["isSelected"] = !list[index]["isSelected"];
                  setState(() {});
                },
                child: list[index]["isSelected"]
                    ? buildOptions(list[index]["name"], secondary, primary)
                    : buildOptions(
                        list[index]["name"], black.withOpacity(0.05), black));
          }),
        ),
      ),
    );
  }
}

// rating bar

//  Row(
//           children: List.generate(5, (index) {
//             return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     selectedIndex = index;
//                   });
//                 },
//                 child: Icon(
//                   selectedIndex >= index ? Icons.star : Icons.star_border,
//                   size: 50,
//                 ));
//           }),
//         )
