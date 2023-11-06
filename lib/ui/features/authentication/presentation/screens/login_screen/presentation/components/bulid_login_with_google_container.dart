// import 'package:flutter/material.dart';
//
// import '../../../../../../../../../generated/l10n.dart';
//
// InkWell bulidLoginWithGoogle({
//   required BuildContext context,
//   required VoidCallback onTap,
// }) {
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: MediaQuery.of(context).size.width / 25,
//         vertical: MediaQuery.of(context).size.height / 100,
//       ),
//       decoration: BoxDecoration(
//         // color: const Color(AppColors.kLoginWithGoogleColor),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Logo(
//             Logos.google,
//             size: MediaQuery.of(context).size.height / 25,
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width / 25,
//           ),
//           Text(
//             S.of(context).loginScreenLoginWithGoogleButton,
//             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
