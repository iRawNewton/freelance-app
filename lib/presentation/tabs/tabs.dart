// no use as of now

// import 'package:flutter/material.dart';
// import 'package:freelance_app/presentation/global/home/home.dart';

// class AppTabBar extends StatelessWidget {
//   const AppTabBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const SafeArea(
//       child: DefaultTabController(
//         length: 3,
//         animationDuration: Duration(seconds: 1),
//         child: Scaffold(
//           body: Column(
//             children: [
//               TabBar(
//                 tabs: [
//                   Tab(
//                     icon: Icon(Icons.home),
//                   ),
//                   Tab(
//                     icon: Icon(Icons.settings),
//                   ),
//                   Tab(
//                     icon: Icon(Icons.person),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: TabBarView(
//                   physics: AlwaysScrollableScrollPhysics(),
//                   children: [
//                     SizedBox.expand(child: HomePage()),
//                     SizedBox.expand(child: HomePage()),
//                     SizedBox.expand(child: HomePage()),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
