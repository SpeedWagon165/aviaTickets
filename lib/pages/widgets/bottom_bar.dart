import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_items.dart';

class NavigationBarAvia extends StatelessWidget {
  const NavigationBarAvia({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      shape: const CircularNotchedRectangle(),
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 0.5, // Высота разделителя
            color: Colors.grey[700],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                BottomBarButton(
                  icon: 'assets/images/airoplan.svg',
                  text: 'Авиабилеты',
                ),
                BottomBarButton(
                  icon: 'assets/images/hotels.svg',
                  text: 'Отели',
                ),
                BottomBarButton(
                  icon: 'assets/images/place.svg',
                  text: 'Короче',
                ),
                BottomBarButton(
                  icon: 'assets/images/subscription.svg',
                  text: 'Подписки',
                ),
                BottomBarButton(
                  icon: 'assets/images/profile.svg',
                  text: 'Профиль',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
