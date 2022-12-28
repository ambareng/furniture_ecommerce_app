import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fxendit/fxendit.dart';

class CheckOutPaymentCard extends StatelessWidget {
  const CheckOutPaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<void> testXenditTokenization() async {
    //   String? xenditPublicKey = dotenv.env["XENDIT_PUBLIC_API_KEY"];

    //   if (xenditPublicKey != null) {
    //     Xendit xendit = Xendit(xenditPublicKey);

    //     XCard card = XCard(
    //       creditCardNumber: '4000000000001000',
    //       creditCardCVN: '123',
    //       expirationMonth: '09',
    //       expirationYear: '2023',
    //     );

    //     TokenResult result = await xendit.createMultipleUseToken(card);

    //     if (result.isSuccess) {
    //       String tokenId = result.token!.id;
    //       debugPrint('==================================');
    //       debugPrint(tokenId);
    //       debugPrint('Token ID: ${result.token!.id}');
    //       debugPrint('==================================');
    //     } else {
    //       debugPrint('==================================');
    //       debugPrint(
    //           'SingleUseToken Error: ${result.errorCode} - ${result.errorMessage}');
    //       debugPrint('==================================');
    //     }
    //   }
    // }

    // testXenditTokenization();

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
                    'assets/images/credit_card_logos/mastercard.png'),
              ),
              const Gap(20),
              Text(
                '**** **** **** 3947',
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
