import 'package:codigo6_movieapp/ui/general/colors.dart';
import 'package:flutter/material.dart';

class ItemFilterWidget extends StatelessWidget {
  const ItemFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            "Action",
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: 50,
            height: 3.5,
            color: kBrandSecondaryColor,
          ),
        ],
      ),
    );
  }
}
