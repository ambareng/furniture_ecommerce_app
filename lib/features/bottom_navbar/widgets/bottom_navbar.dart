import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/bottom_navbar/bloc/bottom_navbar_bloc.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarBloc, BottomNavbarState>(
      builder: (context, state) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: state.selectedIndex,
            onTap: ((value) => BlocProvider.of<BottomNavbarBloc>(context)
                .add(BottomNavbarSelectEvent(selectedIndex: value))),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: 'home',
                  activeIcon: Icon(
                    Icons.home,
                    color: black,
                  ),
                  icon: Icon(
                    Icons.home_outlined,
                    color: lighterGray,
                  )),
              BottomNavigationBarItem(
                  label: 'bookmarks',
                  activeIcon: Icon(
                    Icons.bookmark_rounded,
                    color: black,
                  ),
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: lighterGray,
                  )),
              BottomNavigationBarItem(
                  label: 'notifications',
                  activeIcon: Icon(
                    Icons.notifications_rounded,
                    color: black,
                  ),
                  icon: Icon(
                    Icons.notifications_none,
                    color: lighterGray,
                  )),
              BottomNavigationBarItem(
                  label: 'settings',
                  activeIcon: Icon(
                    Icons.person_rounded,
                    color: black,
                  ),
                  icon: Icon(
                    Icons.person_outline_rounded,
                    color: lighterGray,
                  ))
            ]);
      },
    );
  }
}
