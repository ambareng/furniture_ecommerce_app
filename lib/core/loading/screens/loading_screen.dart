import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/core/utils.dart';
import 'package:furniture_ecommerce_app/features/furniture/bloc/furniture_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    late String toLoadURL;

    if (arguments.containsKey('toLoadURL')) {
      toLoadURL = arguments['toLoadURL'];
    } else {
      toLoadURL = '/home';
    }

    return WillPopScope(
      onWillPop: () => exitAppDialog(context: context),
      child: Scaffold(
          body: Center(
        child: BlocListener<FurnitureBloc, FurnitureState>(
          listener: (context, state) {
            if (state.status == FurnitureStatus.loaded) {
              Navigator.popAndPushNamed(context, toLoadURL);
            }
          },
          child: const CircularProgressIndicator(
            color: lightestGray,
          ),
        ),
      )),
    );
  }
}
