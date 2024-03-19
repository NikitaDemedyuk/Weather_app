import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../widgets/navigation_bar_items.dart';
import 'selected_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const HomePageView();
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final selectedTab = context.select((HomeCubit cubit) => cubit.state.tab);

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          TodayForecastNavigationBarItem(),
          WeeklyForecastNavigationBarItem(),
        ],
      ),
      tabBuilder: (_, index) => CupertinoTabView(
        //navigatorKey: context.read<HomeCubit>().getTabNavigatorKey(index),
        builder: (_) => SelectedPage(tab: selectedTab),
      ),
    );
  }
}
