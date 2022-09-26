// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:furniture_ecommerce_app/core/styles.dart';
// import 'package:furniture_ecommerce_app/features/auth/widgets/auth_button.dart';
// import 'package:furniture_ecommerce_app/features/auth/widgets/auth_input_field.dart';
// import 'package:furniture_ecommerce_app/features/auth/widgets/other_auth_button.dart';
// import 'package:gap/gap.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AuthLayout extends StatelessWidget {
//   final bool isLogin;
//   final String? headerText1;
//   final String headerText2;
//   final bool hasForgotPassword;
//   final List<Map<String, dynamic>> authFields;

//   const AuthLayout(
//       {Key? key,
//       this.headerText1,
//       required this.headerText2,
//       required this.authFields,
//       this.hasForgotPassword = false,
//       this.isLogin = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * 0.075),
//       height: MediaQuery.of(context).size.height,
//       width: double.infinity,
//       child: Column(
//         children: [
//           Expanded(
//               child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 const Gap(50),
//                 const AuthBar(),
//                 const Gap(25),
//                 HeaderText(headerText1: headerText1, headerText2: headerText2),
//                 const Gap(35),
//                 AuthFields(authFields: authFields),
//                 const Gap(25),
//                 if (hasForgotPassword) const ForgotPassword(),
//                 const Gap(35),
//                 AuthButton(
//                   buttonText: isLogin ? 'Log In' : 'Sign Up',
//                 ),
//                 const Gap(25),
//                 OtherAuthButton(
//                   buttonText: isLogin ? 'SIGN UP' : 'LOG IN',
//                   url: isLogin ? '/signup' : '/login',
//                 ),
//                 const Gap(15),
//               ],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }

// class ForgotPassword extends StatelessWidget {
//   const ForgotPassword({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Text('Forgot Password',
//           style: GoogleFonts.nunitoSans(
//               textStyle: const TextStyle(
//                   fontWeight: FontWeight.w600, fontSize: 18, color: black))),
//     );
//   }
// }

// class AuthFields extends StatelessWidget {
//   final List<Map<String, dynamic>> authFields;

//   const AuthFields({Key? key, required this.authFields}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: authFields.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               AuthInputField(
//                 fieldLabel: authFields[index]['fieldLabel'],
//                 isObscured: authFields[index]['isObscured'] ?? false,
//               ),
//               const Gap(25),
//             ],
//           );
//         });
//   }
// }

// class HeaderText extends HookWidget {
//   final String? headerText1;
//   final String headerText2;

//   const HeaderText({Key? key, this.headerText1, required this.headerText2})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           headerText1 != null
//               ? Text(
//                   headerText1!,
//                   style: GoogleFonts.merriweather(
//                       textStyle: const TextStyle(
//                           fontSize: 30,
//                           letterSpacing: 1.1,
//                           fontWeight: FontWeight.w400,
//                           color: lighterGray)),
//                 )
//               : Container(),
//           Gap(headerText1 != null ? 15 : 0),
//           Text(
//             headerText2,
//             style: GoogleFonts.merriweather(
//                 textStyle: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w700,
//               color: black,
//               letterSpacing: 1.1,
//             )),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AuthBar extends StatelessWidget {
//   const AuthBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const SideBar(left: true),
//         SizedBox(
//           width: 85,
//           height: 85,
//           child: SvgPicture.asset('assets/images/auth/auth_bar.svg'),
//         ),
//         const SideBar(left: false),
//       ],
//     );
//   }
// }

// class SideBar extends StatelessWidget {
//   final bool left;

//   const SideBar({
//     Key? key,
//     required this.left,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Padding(
//         padding: EdgeInsets.only(
//           left: !left ? MediaQuery.of(context).size.width * 0.025 : 0,
//           right: left ? MediaQuery.of(context).size.width * 0.025 : 0,
//         ),
//         child: const Divider(
//           color: black,
//           thickness: 0.5,
//         ),
//       ),
//     );
//   }
// }
