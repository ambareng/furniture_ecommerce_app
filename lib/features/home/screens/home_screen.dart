import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/bottom_navbar/widgets/bottom_navbar.dart';
import 'package:furniture_ecommerce_app/features/home/blocs/category_bar/category_bar_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/repositories/furniture_repo.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/category_bar.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/furniture_feed.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FurnitureRepo(),
      child: BlocProvider(
        create: (context) => CategoryBarBloc(
            furnitureRepo: RepositoryProvider.of<FurnitureRepo>(context),
            authRepo: RepositoryProvider.of<AuthRepo>(context))
          ..add(const CategoryBarSelectedEvent(index: 0)),
        child: Scaffold(
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
                        topHeader: 'Make home',
                        bottomHeader: 'BEAUTIFUL',
                      ),
                      Gap(25),
                      CategoryBar(),
                      Gap(25),
                      FurnitureFeed()
                    ],
                  )),
            )),
      ),
    );
  }
}
