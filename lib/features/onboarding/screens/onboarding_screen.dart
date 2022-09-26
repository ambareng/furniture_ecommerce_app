import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/onboarding/onboarding.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Gap(250),
                      OnboardingTitleText(),
                      Gap(35),
                      OnboardingText(),
                      Gap(175),
                      GetStartedButton()
                    ],
                  ),
                )),
              ],
            )));
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: bgBlack,
              fixedSize: const Size(159, 54),
              elevation: 5),
          child: const Text(
            'Get Started',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ));
  }
}

class OnboardingText extends StatelessWidget {
  const OnboardingText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.1),
      child: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'The best simple place where you discover most wonderful furnitures and make your home beautiful',
            style: TextStyle(
                color: lightGray,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.25,
                height: 2),
          )),
    );
  }
}

class OnboardingTitleText extends StatelessWidget {
  const OnboardingTitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'MAKE YOUR',
          style: TextStyle(
              color: gray,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5),
        ),
        Gap(10),
        Text(
          'HOME BEAUTIFUL',
          style: TextStyle(
              color: black,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.25),
        ),
      ],
    );
  }
}
