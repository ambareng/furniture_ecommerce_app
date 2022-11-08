import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteItemList extends StatelessWidget {
  const FavoriteItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 25, bottom: 125),
          itemCount: 12,
          itemBuilder: (context, index) {
            return const FavoriteItem();
          }),
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 2, color: whiteGray))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FavoriteItemImage(),
          FavoriteItemDetails(),
          FavoriteItemActions()
        ],
      ),
    );
  }
}

class FavoriteItemActions extends StatelessWidget {
  const FavoriteItemActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 10),
      child: Column(
        children: const [
          FavoriteItemDeleteButton(),
          Spacer(),
          FavoriteItemAddCartButton()
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
  const FavoriteItemDeleteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: bgBlack),
      ),
      child: const Icon(
        Icons.close_rounded,
        size: 17,
      ),
    );
  }
}

class FavoriteItemDetails extends StatelessWidget {
  const FavoriteItemDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Coffee Table',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14, color: gray)),
            ),
            const Gap(7.5),
            Text(
              '\$ 50.00',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16, color: black)),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteItemImage extends StatelessWidget {
  const FavoriteItemImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://ae01.alicdn.com/kf/Hf5625dadb50549f6a9f25bc7cab9d1afc/Modern-Dinning-Chairs-Single-Lounge-Chair-Cafe-Office-Restaurant-Furniture-Bedroom-Study-Nordic-Minimalist-Chair-Sofa.jpg'))),
    );
  }
}
