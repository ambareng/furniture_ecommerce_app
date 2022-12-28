import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsList extends StatelessWidget {
  const PaymentMethodsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CreditCardBloc>(context).add(GetAllCreditCardEvent());

    return BlocBuilder<CreditCardBloc, CreditCardState>(
      builder: (context, state) {
        if (state.status == CreditCardStatus.loading) {
          return const Center(
            child: SizedBox(
                width: 35,
                height: 35,
                child: CircularProgressIndicator(
                  color: bgBlack,
                  strokeWidth: 1.0,
                )),
          );
        }
        if (state.status == CreditCardStatus.loaded &&
            state.creditCards == null) {
          return const Center(
            child: Text(
              'No credit cards',
            ),
          );
        }
        return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 333,
                      decoration: BoxDecoration(
                          color: bgBlack,
                          borderRadius: BorderRadius.circular(10)),
                      child: const CardDetails(), // Foreground widget here
                    ),
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: true,
                            activeColor: bgBlack,
                            onChanged: (bool? value) {}),
                        Text(
                          'Use as default payment method',
                          style: GoogleFonts.nunitoSans(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: bgBlack)),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }));
      },
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/images/credit_card_logos/mastercard.png',
              width: 50,
            ),
          ),
          Text(
            '**** **** **** **** 1000',
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white)),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card Holder Name',
                  style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8))),
                ),
                Text(
                  'Expiry Date',
                  style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.8))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Arvin M. Bareng',
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white)),
                ),
                Text(
                  '09/24',
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
