import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/cart_icon.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/search_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:furniture_ecommerce_app/features/bottom_navbar/widgets/bottom_navbar.dart';
import 'package:furniture_ecommerce_app/features/favorites/widgets/favorite_item_list.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../home/widgets/top_bar.dart';

class FavoritesScreen extends HookWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<BottomNavbarBloc>(context)
          .add(const BottomNavbarSelectEvent(selectedIndex: 1));
      return () {};
    }, []);

    return Scaffold(
        floatingActionButton: const AddAllCartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: const BottomNavbar(),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  Gap(60),
                  TopBar(
                      leftIcon: SearchIconButton(),
                      bottomHeader: 'Favorites',
                      rightIcon: CartIconButton()),
                  FavoriteItemList()
                ],
              )),
        ));
  }
}

class AddAllCartButton extends StatelessWidget {
  const AddAllCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 50,
      decoration:
          BoxDecoration(color: bgBlack, borderRadius: BorderRadius.circular(7)),
      child: Center(
        child: Text(
          'Add all to my cart',
          style: GoogleFonts.nunitoSans(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
