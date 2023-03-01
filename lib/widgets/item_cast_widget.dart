import 'package:flutter/material.dart';

class ItemCastWidget extends StatelessWidget {
  const ItemCastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 14.0),
      constraints: const BoxConstraints(
        maxWidth: 110.0,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            backgroundImage: NetworkImage(
                "https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            radius: 44.0,
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Ramón Diaz Gonzales de los Portales",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
