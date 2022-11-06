import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_bloc.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_order_quantity_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureScreen extends StatelessWidget {
  const FurnitureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnitureBloc, FurnitureState>(
      builder: (context, state) {
        return Scaffold(
            floatingActionButton: const AddToCartStickBar(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: state.furniture != null
                              ? Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.55,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(50)),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              state.furniture!.imageURL),
                                          fit: BoxFit.cover)))
                              : Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.6,
                                  decoration: const BoxDecoration(
                                    color: lighterGray,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50)),
                                  ))),
                      const BackButton(),
                      const ColorSelector(),
                    ],
                  ),
                  const FurnitureDetails(),
                ],
              ),
            ));
      },
    );
  }
}

class AddToCartStickBar extends StatelessWidget {
  const AddToCartStickBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [BookmarkButton(), Gap(15), AddToCartButton()],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: bgBlack, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              'Add to cart',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
            ),
          )),
    );
  }
}

class BookmarkButton extends StatelessWidget {
  const BookmarkButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnitureBloc, FurnitureState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: whiteGray, borderRadius: BorderRadius.circular(10)),
            child: Icon(
              state.furniture!.isBookmarked
                  ? Icons.bookmark_rounded
                  : Icons.bookmark_border_rounded,
              color: black,
              size: 24,
            ),
          ),
        );
      },
    );
  }
}

class FurnitureDetails extends StatelessWidget {
  const FurnitureDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnitureBloc, FurnitureState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
              top: 25,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.furniture!.name,
                style: GoogleFonts.gelasio(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: black)),
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${state.furniture!.price}',
                    style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 30)),
                  ),
                  BlocBuilder<FurnitureOrderQuantityBloc,
                      FurnitureOrderQuantityState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<FurnitureOrderQuantityBloc>(
                                        context)
                                    .add(FurnitureOrderQuantityAddEvent(
                                        currentQuantity: state.quantity));
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF3F3F3),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.black.withOpacity(0.05))),
                                child: const Icon(
                                  Icons.add,
                                  color: black,
                                ),
                              ),
                            ),
                            Text(
                              '${state.quantity < 10 ? "0" : ""}${state.quantity}',
                              style: GoogleFonts.nunitoSans(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      letterSpacing: 1)),
                            ),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<FurnitureOrderQuantityBloc>(
                                        context)
                                    .add(FurnitureOrderQuantityRemoveEvent(
                                        currentQuantity: state.quantity));
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF3F3F3),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 0.5,
                                        color: Colors.black.withOpacity(0.05))),
                                child: const Icon(
                                  Icons.remove,
                                  color: black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
              const Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(0xFFF2C94C),
                    size: 35,
                  ),
                  const Gap(5),
                  Text(
                    '4.5',
                    style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: black,
                            height: 1.75)),
                  ),
                  const Gap(20),
                  Text(
                    '(50 reviews)',
                    style: GoogleFonts.nunitoSans(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: lightGray,
                            height: 1.75)),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        color: gray,
                        height: 1.75)),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.2,
          left: MediaQuery.of(context).size.width * 0.065),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          width: MediaQuery.of(context).size.width * 0.175,
          height: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: lighterGray.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.brown[300],
                    border: Border.all(color: lighterGray, width: 5),
                    borderRadius: BorderRadius.circular(25)),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.yellow[200],
                    border: Border.all(color: whiteGray, width: 5),
                    borderRadius: BorderRadius.circular(25)),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.red[200],
                    border: Border.all(color: whiteGray, width: 5),
                    borderRadius: BorderRadius.circular(25)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.075,
          left: MediaQuery.of(context).size.width * 0.0875),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.125,
          height: MediaQuery.of(context).size.width * 0.125,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.5),
              boxShadow: [
                BoxShadow(
                  color: lighterGray.withOpacity(0.15),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black.withOpacity(0.75),
          ),
        ),
      ),
    );
  }
}
