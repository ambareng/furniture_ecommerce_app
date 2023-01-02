import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPaymentCard extends StatelessWidget {
  const CheckOutPaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CreditCardBloc>(context).add(GetAllCreditCardEvent());

    return Container(
      width: double.infinity,
      height: 69,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: lighterGray.withOpacity(0.025),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ]),
      child: BlocBuilder<CreditCardBloc, CreditCardState>(
        builder: (context, state) {
          if (state.status == CreditCardStatus.loading) {
            return const Center(
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: black,
                    strokeWidth: 1.0,
                  )),
            );
          }
          if (state.status == CreditCardStatus.loaded &&
              state.creditCards == null) {
            return Center(
              child: Text(
                'No credit cards',
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        color: black, fontWeight: FontWeight.w600)),
              ),
            );
          }
          return Row(
            children: [
              Container(
                width: 64,
                height: 38,
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: lighterGray.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 7,
                      )
                    ]),
                child: Image.asset(
                  state.defaultCreditCard!.brand == 'MASTERCARD'
                      ? 'assets/images/credit_card_logos/mastercard.png'
                      : 'assets/images/credit_card_logos/visa_blue.png',
                ),
              ),
              const Gap(20),
              Text(
                state.defaultCreditCard!.masked_number,
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: black)),
              )
            ],
          );
        },
      ),
    );
  }
}
