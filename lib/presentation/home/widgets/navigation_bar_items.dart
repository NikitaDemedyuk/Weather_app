import 'package:flutter/cupertino.dart';

class TodayForecastNavigationBarItem extends BottomNavigationBarItem {
  TodayForecastNavigationBarItem()
      : super(
          icon: const Icon(CupertinoIcons.brightness),
          activeIcon: Builder(
            builder: (context) => const Icon(
              CupertinoIcons.brightness_solid,
              color: CupertinoColors.systemBlue,
            ),
          ),
          label: 'Today',
          tooltip: 'Today',
        );
}

class WeeklyForecastNavigationBarItem extends BottomNavigationBarItem {
  WeeklyForecastNavigationBarItem()
      : super(
          icon: const Icon(CupertinoIcons.cloud_sun),
          activeIcon: Builder(
            builder: (context) => const Icon(
              CupertinoIcons.cloud_sun_fill,
              color: CupertinoColors.systemBlue,
            ),
          ),
          label: 'Forecast',
          tooltip: 'Forecast',
        );
}
