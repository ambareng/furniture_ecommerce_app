import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/my_cart/bloc/my_cart_total_bloc.dart';
import 'package:furniture_ecommerce_app/features/promo/bloc/promo_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingTotal extends HookWidget {
  const FloatingTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<MyCartTotalBloc>(context).add(GetMyCartTotalEvent());
      return () {};
    }, []);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.075, vertical: 10),
      child: BlocBuilder<PromoBloc, PromoState>(
        builder: (context, state) {
          return Column(
            children: [
              BlocBuilder<PromoBloc, PromoState>(
                builder: (context, state) {
                  if (state.promo != null) {
                    return const PromoItem();
                  }
                  return Container();
                },
              ),
              const TotalItem(),
            ],
          );
        },
      ),
    );
  }
}

class TotalItem extends StatelessWidget {
  const TotalItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total:',
          textAlign: TextAlign.left,
          style: GoogleFonts.nunitoSans(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: 20, color: lightGray)),
        ),
        BlocBuilder<MyCartTotalBloc, MyCartTotalState>(
          builder: (context, state) {
            if (state.status == MyCartTotalStatus.loading) {
              return const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: black,
                  strokeWidth: 1.0,
                ),
              );
            }
            return Text(
              state.total != null ? '${state.total}' : 'ERROR',
              textAlign: TextAlign.right,
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20, color: black)),
            );
          },
        )
      ],
    );
  }
}

class PromoItem extends StatelessWidget {
  const PromoItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PromoBloc, PromoState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${state.promo?.name}:',
              textAlign: TextAlign.left,
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: lightGray)),
            ),
            Text(
              '-${state.promo?.discount}',
              textAlign: TextAlign.right,
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 20, color: black)),
            )
          ],
        );
      },
    );
  }
}
