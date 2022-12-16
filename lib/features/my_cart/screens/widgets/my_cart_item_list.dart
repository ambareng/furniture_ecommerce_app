import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_bloc.dart';
import 'package:furniture_ecommerce_app/features/home/models/furniture.dart';
import 'package:furniture_ecommerce_app/features/my_cart/screens/widgets/promo_code_input.dart';
import 'package:furniture_ecommerce_app/features/my_cart/screens/widgets/total_price.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartItemList extends HookWidget {
  const MyCartItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<FurnitureBloc>(context).add(FurnitureGetMyCartEvent());
      return () {};
    });

    return Expanded(
      child: BlocBuilder<FurnitureBloc, FurnitureState>(
        builder: (context, state) {
          if (state.status == FurnitureStatus.loading) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: CircularProgressIndicator(
                  color: lightestGray,
                ),
              ),
            );
          }
          if (state is FurnitureListState) {
            if (state.furnitures!.isNotEmpty) {
              return ListView.builder(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  itemCount: state.furnitures != null
                      ? state.furnitures!.length + 1
                      : 0,
                  itemBuilder: (context, index) {
                    if (index == state.furnitures!.length) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const PromoCodeInput(),
                          const FloatingTotal(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/check_out');
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)))),
                              child: Text(
                                'Check out',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunitoSans(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20)),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                    if (state.furnitures != null) {
                      return FavoriteItem(furniture: state.furnitures![index]);
                    }
                    return Container();
                  });
            }
          }
          return const Center(
            child: Text('Sorry no items in your cart!'),
          );
        },
      ),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  final Furniture furniture;

  const FavoriteItem({Key? key, required this.furniture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: whiteGray))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FavoriteItemImage(
            furnitureImage: NetworkImage(furniture.imageURL),
          ),
          FavoriteItemDetails(
            furniture: furniture,
            furnitureName: furniture.name,
            furniturePrice: furniture.price,
            furnitureQuantity: furniture.quantity,
          ),
          FavoriteItemActions(
            furniture: furniture,
          )
        ],
      ),
    );
  }
}

class FavoriteItemActions extends StatelessWidget {
  final Furniture furniture;

  const FavoriteItemActions({Key? key, required this.furniture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10),
      child: Column(
        children: [
          FavoriteItemDeleteButton(
            furniture: furniture,
          ),
          // const Spacer(),
          // const FavoriteItemAddCartButton()
        ],
      ),
    );
  }
}

class FavoriteItemAddCartButton extends StatelessWidget {
  const FavoriteItemAddCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 17),
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: whiteGray,
        borderRadius: BorderRadius.circular(13),
      ),
      child: const Icon(
        Icons.shopping_bag_rounded,
        color: black,
        size: 20,
      ),
    );
  }
}

class FavoriteItemDeleteButton extends StatelessWidget {
  final Furniture furniture;

  const FavoriteItemDeleteButton({Key? key, required this.furniture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FurnitureBloc, FurnitureState>(
      builder: (context, state) {
        return SizedBox(
            width: 24,
            height: 24,
            child: GestureDetector(
              onTap: () {
                if (state is FurnitureListState) {
                  BlocProvider.of<FurnitureBloc>(context).add(
                      FurnitureRemoveFromMyCartEvent(
                          furnitureId: furniture.id,
                          furnitures: state.furnitures!));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: bgBlack),
                ),
                child: const Icon(
                  Icons.close_rounded,
                  size: 17,
                ),
              ),
            ));
      },
    );
  }
}

class FavoriteItemDetails extends StatelessWidget {
  final String furnitureName;
  final double furniturePrice;
  final int furnitureQuantity;
  final Furniture furniture;

  const FavoriteItemDetails(
      {Key? key,
      required this.furnitureName,
      required this.furniturePrice,
      required this.furnitureQuantity,
      required this.furniture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              furnitureName,
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14, color: gray)),
            ),
            const Gap(7.5),
            Text(
              '\$ $furniturePrice',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16, color: black)),
            ),
            const Spacer(),
            QuantityController(
                quantity: furnitureQuantity, furniture: furniture)
          ],
        ),
      ),
    );
  }
}

class QuantityController extends StatelessWidget {
  final int quantity;
  final Furniture furniture;

  const QuantityController(
      {Key? key, required this.quantity, required this.furniture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 13),
      width: MediaQuery.of(context).size.width * 0.3,
      child: BlocBuilder<FurnitureBloc, FurnitureState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (state is FurnitureListState) {
                    BlocProvider.of<FurnitureBloc>(context).add(
                        FurnitureAddQuantityEvent(
                            furnitures: state.furnitures!,
                            furnitureId: furniture.id));
                  }
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.05))),
                  child: const Icon(
                    Icons.add,
                    color: black,
                  ),
                ),
              ),
              Text(
                // '${state.furniture!.quantity < 10 ? "0" : ""}${state.furniture!.quantity}',
                '$quantity',
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: 1)),
              ),
              GestureDetector(
                onTap: () {
                  if (state is FurnitureListState) {
                    BlocProvider.of<FurnitureBloc>(context).add(
                        FurnitureRemoveQuantityEvent(
                            furnitures: state.furnitures!,
                            furnitureId: furniture.id));
                  }
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 0.5, color: Colors.black.withOpacity(0.05))),
                  child: const Icon(
                    Icons.remove,
                    color: black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FavoriteItemImage extends StatelessWidget {
  final NetworkImage furnitureImage;

  const FavoriteItemImage({Key? key, required this.furnitureImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: furnitureImage, fit: BoxFit.cover)),
    );
  }
}
