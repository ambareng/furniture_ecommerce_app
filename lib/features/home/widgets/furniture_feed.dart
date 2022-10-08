import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FurnitureFeed extends StatelessWidget {
  const FurnitureFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: GridView.builder(
          physics: const ScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return const FurnitureCard();
          }),
    );
  }
}

class FurnitureCard extends StatelessWidget {
  const FurnitureCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  image: const DecorationImage(
                      image: AssetImage('assets/images/home/items/item_01.png'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.all(15),
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
                'Black Simple Lamp',
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
                '\$ 12.00',
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
    );
  }
}
