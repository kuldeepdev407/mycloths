import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mycloths/pages/add_item.dart';
import 'package:mycloths/pages/inventory.dart';
import 'package:mycloths/pages/laundary.dart';

class HomeNavigation extends StatefulWidget {
  final Widget child;
  const HomeNavigation({super.key, required this.child});
  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _navIndex = 0;
  final route = ['/', '/laundary', '/'];
  void _toggleNavIndex(index) {
    setState(() {
      _navIndex = index;
    });
    context.go(route[_navIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _navIndex,
          onTap: _toggleNavIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_outlined), label: "Cloths"),
            BottomNavigationBarItem(
                icon: Icon(Icons.wash_outlined), label: "Laundary"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "more"),
          ]),
    );
  }
}

class MyClothssRouter {
  final GoRouter router = GoRouter(initialLocation: '/', routes: [
    ShellRoute(
        builder: (context, state, child) {
          return HomeNavigation(child: child);
        },
        routes: [
          GoRoute(
              path: "/",
              name: "Inventory",
              pageBuilder: (context, state) {
                return const MaterialPage(child: InventoryPage());
              }),
          GoRoute(
              path: "/laundary",
              name: "Laundary",
              pageBuilder: (context, state) {
                return const MaterialPage(child: LaundaryPage());
              }),
        ]),
    GoRoute(
        path: '/addItem',
        name: 'AddItem',
        pageBuilder: (context, state) {
          return const MaterialPage(child: AddItemPage());
        })
  ]);
}
