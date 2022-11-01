import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/blocs/category_bar/category_bar_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureFeed extends HookWidget {
  const FurnitureFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();
    // scrollController.addListener(() {});

    return BlocBuilder<CategoryBarBloc, CategoryBarState>(
      builder: (context, state) {
        if (state is CategoryBarSelectedState) {
          if (state.furnitures.isEmpty) {
            return Text(
              'No items...',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400, color: gray)),
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: NotificationListener<ScrollUpdateNotification>(
              child: GridView.builder(
                  controller: scrollController,
                  physics: const ScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state.furnitures.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return FurnitureCard(
                      furniture: state.furnitures[index],
                    );
                  }),
              onNotification: (notification) {
                // double maxScrollLength =
                //     scrollController.position.maxScrollExtent;
                // double currentScrollPosition = scrollController.position.pixels;
                // double scrollLengthTrigger = 0.00;

                // if ((maxScrollLength - currentScrollPosition) ==
                //     scrollLengthTrigger) {
                //   BlocProvider.of<CategoryBarBloc>(context).add(
                //       CategoryBarOnScrollEvent(
                //           furnitures: state.furnitures, index: state.index));
                // }
                return true;
              },
            ),
          );
        } else if (state is CategoryBarLoadingState) {
          return Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: const CircularProgressIndicator(
              color: lightestGray,
            ),
          );
        }
        return Container();
      },
    );
  }
}

class FurnitureCard extends StatelessWidget {
  final Furniture furniture;

  const FurnitureCard({Key? key, required this.furniture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<FurnitureBloc>(context)
            .add(FurnitureSelectedEvent(furniture: furniture));
        Navigator.pushNamed(context, '/furniture');
      },
      child: SizedBox(
        width: 155,
        height: 205,
        child: Column(
          children: [
            Stack(children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(furniture.imageURL),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    child: SvgPicture.asset(
                        'assets/images/home/add_to_cart_icon.svg'),
                  )),
            ]),
            const Gap(5),
            Padding(
              padding: const EdgeInsets.only(left: 17.5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  furniture.name,
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: gray)),
                ),
              ),
            ),
            const Gap(2),
            Padding(
              padding: const EdgeInsets.only(left: 17.5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '\$ ${furniture.price}',
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
