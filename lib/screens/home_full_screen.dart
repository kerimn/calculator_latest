// import 'package:calculator/constants/colors.dart';
// import 'package:calculator/constants/images.dart';
// import 'package:calculator/screens/loan_info.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class HomeDataScreen extends StatelessWidget {
//   const HomeDataScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColor,
//       appBar: AppBar(
//         backgroundColor: bgColor,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         title: Text(
//           "YOUR MORTGAGES",
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 100,
//                 child: ListView.separated(
//                   itemCount: 5,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         if (index == 0)
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const LoanInfo()),
//                               );
//                             },
//                             child: Container(
//                               height: 125,
//                               width: 40,
//                               decoration: BoxDecoration(
//                                 color: mainColor,
//                                 borderRadius: BorderRadius.circular(11),
//                               ),
//                               child: Center(
//                                 child: SvgPicture.asset(
//                                   AppImages.add,
//                                   width: 18,
//                                   height: 18,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         const SizedBox(width: 11),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "HOUSE",
//                               style: Theme.of(context).textTheme.titleSmall,
//                             ),
//                             const SizedBox(height: 10),
//                             Text(
//                               "Your monthly payment: 125,25\$",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall!
//                                   .copyWith(
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.normal),
//                             ),
//                             Text(
//                               "Already paid: 31 225,25\$",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .titleSmall!
//                                   .copyWith(
//                                       color: Colors.grey,
//                                       fontWeight: FontWeight.normal),
//                             ),
//                             const SizedBox(height: 10),
//                             const SizedBox(
//                               width: 150,
//                               height: 2,
//                               child: LinearProgressIndicator(
//                                 value:
//                                     0.3, // Set the percentage as a decimal (e.g., 0.1 for 10%)
//                                 valueColor: AlwaysStoppedAnimation<Color>(
//                                     mainColor), // Replace with your mainColor
//                                 backgroundColor:
//                                     Colors.grey, // Transparent background
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   },
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(width: 11),
//                 ),
//               ),
//               const SizedBox(height: 35),
//               const Divider(
//                 color: Colors.grey,
//                 thickness: 0.5,
//                 height: 1,
//               ),
//               const SizedBox(height: 35),
//               Text(
//                 "Transactions",
//                 style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey,
//                     ),
//               ),
//               const SizedBox(height: 35),
//               SizedBox(
//                 height: 500,
//                 child: ListView.separated(
//                     physics: const BouncingScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const LoanInfo()),
//                           );
//                         },
//                         child: Container(
//                           color: bgColor,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text('Payment "House"',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall),
//                                   const SizedBox(height: 7),
//                                   Text('10.08.2023 | 16:09',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .titleSmall!
//                                           .copyWith(
//                                               fontSize: 10, color: Colors.grey))
//                                 ],
//                               ),
//                               Text("- \$1 500",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .titleMedium!
//                                       .copyWith(color: mainColor))
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                     separatorBuilder: (context, index) =>
//                         const SizedBox(height: 50),
//                     itemCount: 5),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
