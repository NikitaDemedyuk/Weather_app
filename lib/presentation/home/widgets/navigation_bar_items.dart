import 'package:flutter/cupertino.dart';

class TodayForecastNavigationBarItem extends BottomNavigationBarItem {
  TodayForecastNavigationBarItem()
      : super(
          icon: Icon(
            CupertinoIcons.brightness,
          ),
          activeIcon: Builder(
            builder: (context) => Icon(
              CupertinoIcons.brightness_solid,
            ),
          ),
          label: 'Главная',
          tooltip: 'Главная',
        );
}

class WeeklyForecastNavigationBarItem extends BottomNavigationBarItem {
  WeeklyForecastNavigationBarItem()
      : super(
          icon: Icon(
            CupertinoIcons.brightness,
          ),
          activeIcon: Builder(
            builder: (context) => Icon(
              CupertinoIcons.brightness_solid,
            ),
          ),
          label: 'Главная',
          tooltip: 'Главная',
        );
}
