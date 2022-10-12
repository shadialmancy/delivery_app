import 'package:delivery_app/screens/homepage/home_page.dart';
import 'package:delivery_app/screens/profilepage/profile_page.dart';
import 'package:delivery_app/theme/colors.dart';
import 'package:delivery_app/theme/text_style.dart';
import 'package:delivery_app/widgets/bottomnavigationbaricon.dart';
import 'package:flutter/material.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int selectedIndex = 0;

//   List screens = [
//     const HomePage(),
//     const HomePage(),
//     const HomePage(),
//     const ProfilePage()
//   ];

//   PageStorageBucket bucket = PageStorageBucket();

//   Widget currentPage = HomePage();

//   void onItemTapped(int index) {
//     setState(() {
//       currentPage = screens[index];
//       selectedIndex = index;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(
//         bucket: bucket,
//         child: currentPage,
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.fastfood_outlined),
//             label: 'Order',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark_border),
//             label: 'My List',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//         unselectedItemColor: black.withOpacity(0.5),
//         currentIndex: selectedIndex,
//         selectedItemColor: Colors.amber,
//         onTap: onItemTapped,
//         iconSize: 30,
//       ),
//     );
//   }
// }

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      height: 60,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bnbIcons.length, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => bnbIcons[index]["screen"]!)));

                setState(() {
                  for (var element in bnbIcons) {
                    element['isSelected'] = false;
                  }
                  bnbIcons[index]['isSelected'] = true;
                });
              },
              child: Column(
                children: [
                  Icon(
                    bnbIcons[index]["isSelected"]
                        ? bnbIcons[index]["icon"]
                        : bnbIcons[index]["iconSelected"],
                    color: bnbIcons[index]["isSelected"]
                        ? secondary
                        : Colors.black.withOpacity(0.6),
                    size: 35,
                  ),
                  Text(
                    bnbIcons[index]["name"],
                    style: customTxtStyle(10, black.withOpacity(0.8)),
                  )
                ],
              ),
            );
          })),
    );
  }
}

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 5),
//       height: 60,
//       child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: List.generate(bnbIcons.length, (index) {
//             return GestureDetector(
//               onTap: () {
//                 setstate
//               },
//               child: Column(
//                 children: [
//                   Icon(
//                     bnbIcons[index]["icon"],
//                     color: bnbIcons[index]["color"],
//                     size: 35,
//                   ),
//                   Text(
//                     bnbIcons[index]["name"],
//                     style: customTxtStyle(10, black.withOpacity(0.8)),
//                   )
//                 ],
//               ),
//             );
//           })),
//     );
//   }
// }

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentScreen = 0;
  final List screens = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: secondary,
        currentIndex: currentScreen,
        unselectedItemColor: black.withOpacity(0.7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'My List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentScreen = index;
          });
        },
      ),
      body: screens[currentScreen],
    );
  }
}
