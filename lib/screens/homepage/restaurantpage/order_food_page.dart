import 'package:delivery_app/dummy/menu_json.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../theme/text_style.dart';

class OrderFoodPage extends StatefulWidget {
  const OrderFoodPage({super.key});

  @override
  State<OrderFoodPage> createState() => OrderFoodPageState();
}

class OrderFoodPageState extends State<OrderFoodPage> {
  List<int> quantity = [];

  static int count = 0;
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
                                                count--;
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
                                          count++;
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

          // ListTile(
          //   leading: Image.asset(
          //     image,
          //     width: 100,
          //     height: 100,
          //   ),
          //   subtitle: Row(
          //     children: [
          //       Icon(
          //         Icons.location_on_outlined,
          //         color: black.withOpacity(0.3),
          //       ),
          //       SizedBox(
          //         width: 5,
          //       ),
          //       Text("13th Street, 47 W 13th St, NY")
          //     ],
          //   ),
          //   title: Text(
          //     name,
          //     style: customTxtStyle(25, black.withOpacity(0.8)),
          //   ),
          // )
        );
      }),
    );
  }

  @override
  void dispose() {
    count = 0;
    super.dispose();
  }
}
