import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: primary.withOpacity(.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
