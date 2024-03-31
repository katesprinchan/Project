import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/theme/colors_collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationBar extends StatefulWidget {
  final int currentIndex;

  const MainNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTabTapped,
      indicatorColor: ColorsCollection.secondaryContainer,
      destinations: <Widget>[
        NavigationDestination(
          selectedIcon: const Icon(Icons.assignment,
              color: ColorsCollection.onPrimaryContainer),
          icon: const Icon(Icons.assignment_outlined,
              color: ColorsCollection.outline),
          label: S.of(context).advertisement,
        ),
        NavigationDestination(
          selectedIcon: const Icon(Icons.favorite,
              color: ColorsCollection.onPrimaryContainer),
          icon: const Icon(Icons.favorite_border,
              color: ColorsCollection.outline),
          label: S.of(context).favorites,
        ),
        NavigationDestination(
          icon: const Badge(
            label: Text('3'),
            child: Icon(Icons.account_circle_outlined,
                color: ColorsCollection.outline),
          ),
          selectedIcon: const Badge(
            label: Text('3'),
            child: Icon(
              Icons.account_circle,
              color: ColorsCollection.onPrimaryContainer,
            ),
          ),
          label: S.of(context).profile,
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      if (index == 0) {
        context.go('/advListPage');
      } else if (index == 1) {
        context.go('/advertisementFavoritePage');
        currentIndex = 1;
      }
    });
  }
}
