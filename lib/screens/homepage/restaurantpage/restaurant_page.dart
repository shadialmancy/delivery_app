import 'package:delivery_app/model/restaurant.dart';
import 'package:delivery_app/screens/homepage/restaurantpage/cart_page.dart';
import 'package:delivery_app/screens/homepage/restaurantpage/information_page.dart';
import 'package:delivery_app/screens/homepage/restaurantpage/order_food_page.dart';
import 'package:delivery_app/screens/homepage/restaurantpage/review_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import "package:flutter/material.dart";

class RestaurantPage extends StatefulWidget {
  List restModel;
  RestaurantPage({required this.restModel, super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List optionList = ["Order", "Review", "Infomation"];

  int pageIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined))
        ],
        leading: IconButton(
            onPressed: (() => Navigator.pop(context)),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: buildBody(),
      floatingActionButton: pageIndex == 0
          ? FloatingActionButton(
              backgroundColor: secondary,
              child: SizedBox(
                width: 30,
                height: 30,
                child: Stack(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: primary,
                    ),
                    Positioned(
                        top: 12,
                        left: 15,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: primary),
                          child: Center(
                            child: Text(
                              OrderFoodPageState.count.toString(),
                              style: customTxtStyle(10, secondary),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CartPage()));
              })
          : null,
    );
  }

  Widget buildBody() {
    return ListView(
      padding: const EdgeInsets.only(
        top: 0,
      ),
      children: [
        Image.network(
          "https://www.bighospitality.co.uk/var/wrbm_gb_hospitality/storage/images/publications/"
          "hospitality/bighospitality.co.uk/article/2018/04/24/over-half-of-kfc-s-restaurants-are-still"
          "-unable-to-offer-a-full-menu-after-delivery-issues/2805670-1-eng-GB/Over-half-of-KFC-s-"
          "restaurants-are-still-unable-to-offer-a-full-menu-after-delivery-issues.png",
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Food Order Resturant ",
              style: customBoldTxtStyle(25, black),
            ),
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
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
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "(4.6)",
                  style: customTxtStyle(13, black.withOpacity(0.3)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(optionList.length, (index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        pageIndex = index;
                      });
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    child: buildCustomBottom(optionList[index], index));
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  pageIndex = value;
                  setState(() {});
                },
                children: const [
                  OrderFoodPage(),
                  ReviewPage(),
                  InformationPage()
                ],
              ),
            )
          ]),
        ),
      ],
    );
  }

  Widget buildCustomBottom(String label, int pageIndex) {
    return Column(
      children: [
        Text(
          label,
          style: customTxtStyle(20, black),
        ),
        Container(
          width: 5,
          height: 5,
          decoration: pageIndex == this.pageIndex
              ? BoxDecoration(shape: BoxShape.circle, color: secondary)
              : const BoxDecoration(),
        )
      ],
    );
  }
}
