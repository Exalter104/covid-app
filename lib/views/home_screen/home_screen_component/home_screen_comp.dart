// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_flutter_boilerplate/utils/utils.dart';

class HomeScreenComponents extends StatelessWidget {
  String title, value;
  HomeScreenComponents({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    // double responsiveWidth = MediaQuery.of(context).size.width;
    double responsiveHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: SafeGoogleFont(
                  "Monsterrate",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(value)
            ],
          ),
          SizedBox(
            height: responsiveHeight * 0.020,
          ),
          const Divider()
        ],
      ),
    );
  }
}
