import 'package:dex_course/core/domain/intl/generated/l10n.dart';
import 'package:dex_course/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final StatefulNavigationShell child;
  const HomePage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: child.currentIndex,
        onTap: (value) => _onBottomBarItemTap(value, context),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.assignment_outlined),
            label: S.of(context).advertisement,
            activeIcon: const Icon(Icons.assignment),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: S.of(context).favorites,
            activeIcon: const Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: const Badge(
              label: Text('3'),
              child: Icon(Icons.account_circle_outlined),
            ),
            label: S.of(context).profile,
            activeIcon: const Badge(
              label: Text('3'),
              child: Icon(Icons.account_circle),
            ),
          ),
        ],
      ),
    );
  }
}

_onBottomBarItemTap(int value, BuildContext context) {
  switch (value) {
    case 0:
      return context.go(AppRouteList.advertisementListPage);
    case 1:
      return context.go(AppRouteList.advertisementFavoritePage);
    case 2:
      return context.go(AppRouteList.profilePage);
  }
}
