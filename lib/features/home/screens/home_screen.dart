import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/blocs/category_bar/category_bar_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/category_bar.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/furniture_feed.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBarBloc()
        ..add(const CategoryBarSelectedEvent(categoryIndex: 0)),
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const [
                Gap(60),
                TopBar(),
                Gap(25),
                CategoryBar(),
                Gap(25),
                FurnitureFeed()
              ],
            )),
      )),
    );
  }
}
