import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/promo/bloc/promo_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoCodeInput extends HookWidget {
  const PromoCodeInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController promoCodeInputController =
        useTextEditingController();

    BlocProvider.of<PromoBloc>(context).add(PromoGetCurrentEvent());

    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 44,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.035),
        child: BlocConsumer<PromoBloc, PromoState>(
          listener: (context, state) {
            if (state.status == PromoStateStatus.loaded &&
                state.promo != null) {
              promoCodeInputController.text = state.promo!.name;
            }
          },
          builder: (context, state) {
            return TextField(
              style: GoogleFonts.nunitoSans(
                  textStyle: TextStyle(
                      color: state.promo == null ? black : lightestGray)),
              enabled: state.promo == null,
              controller: promoCodeInputController,
              decoration: InputDecoration(
                  hintText: 'Enter your promo code',
                  border: InputBorder.none,
                  hintStyle: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF999999)))),
            );
          },
        ),
      ),
      BlocBuilder<PromoBloc, PromoState>(
        builder: (context, state) {
          return Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {
                if (state.status == PromoStateStatus.loaded &&
                    state.promo != null) {
                  BlocProvider.of<PromoBloc>(context).add(
                      PromoRemoveCurrentEvent(
                          promoName: state.promo!.name, context: context));
                  promoCodeInputController.text = '';
                } else if (state.status == PromoStateStatus.loaded &&
                    state.promo == null) {
                  BlocProvider.of<PromoBloc>(context).add(PromoApplyEvent(
                      promoName: promoCodeInputController.text,
                      context: context));
                }
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(10)),
                child: state.status == PromoStateStatus.loading
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1,
                        ))
                    : Icon(
                        state.status == PromoStateStatus.loaded &&
                                state.promo != null
                            ? Icons.close_rounded
                            : Icons.arrow_forward_ios_rounded,
                        color: Colors.white),
              ),
            ),
          );
        },
      )
    ]);
  }
}
