import 'package:delivery_app/dummy/menu_json.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/textButton.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> quantity = [];

  void run() {
    for (int i = 0; i < menuJSON.length; i++) {
      quantity.add(0);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      title: Text(
        "Cart",
        style: customBoldTxtStyle(30, black),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          Column(
            children: [
              buildListTile(),
              const SizedBox(
                height: 30,
              ),
              buildDiscountCode(),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: customTxtStyle(15, black),
                  ),
                  Text(
                    "\$ 88.98",
                    style: customBoldTxtStyle(19, secondary),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              customButton(() {},
                  color: secondary,
                  colorText: primary,
                  height: 55,
                  label: "Checkout",
                  width: MediaQuery.of(context).size.width)
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListTile() {
    return Column(
      children: List.generate(menuJSON.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(menuJSON[index]["image"]!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
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
                        menuJSON[index]["name"]!,
                        style: customBoldTxtStyle(25, black.withOpacity(0.8)),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 20,
                            color: black.withOpacity(0.3),
                          ),
                          Text(
                            "999+ | ",
                            style: customTxtStyle(15, black.withOpacity(0.3)),
                          ),
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: black.withOpacity(0.3),
                            size: 20,
                          ),
                          Text(
                            "120",
                            style: customTxtStyle(15, black.withOpacity(0.3)),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width + 80) / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${menuJSON[index]["price"]!}",
                              style: customBoldTxtStyle(18, secondary),
                            ),
                            Row(
                              children: [
                                quantity[index] != 0
                                    ? Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: black.withOpacity(0.1),
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                quantity[index] =
                                                    quantity[index] - 1;
                                              });
                                            },
                                            icon: const Icon(Icons.remove)),
                                      )
                                    : Container(),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(quantity[index].toString()),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: secondary, shape: BoxShape.circle),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity[index] = quantity[index] + 1;
                                        });
                                      },
                                      icon: const Icon(Icons.add)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }

  Widget buildDiscountCode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Discount Code",
          style: customTxtStyle(15, black),
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "Enter or choose a code",
                style: customTxtStyle(10, black.withOpacity(0.3)),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: black.withOpacity(0.6),
            )
          ],
        )
      ],
    );
  }
}
