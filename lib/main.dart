import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/wishlist/wishlist_bloc.dart';
import 'screens/home/home_screen.dart';
import 'package:newapp/config/app_router.dart';
import 'package:newapp/config/theme.dart';
import 'package:newapp/screens/screens.dart';
import 'screens/home/home_screen.dart';

void main() => runApp(create());
  // home: HomeScreen(),
// ));


class create extends StatelessWidget {
  // const create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
      ],
    child: MaterialApp(
      title: 'Bhavs Created App',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      home: HomeScreen(),
    ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Bhavs Created App'),
//       bottomNavigationBar: CustomNavBar(),
//     );
//   }
// }

// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.black,
//       child: Container(
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//           IconButton(
//               icon: Icon(Icons.home, color: Colors.white),
//               onPressed: () {
//             Navigator.pushNamed(context, '/');
//           }), IconButton(
//               icon: Icon(Icons.shopping_cart, color: Colors.white),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/cart');
//               }), IconButton(
//               icon: Icon(Icons.person, color: Colors.white),
//               onPressed: () {
//                 Navigator.pushNamed(context, '/user');
//               })
//         ],),
//       ),
//     );
//   }
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
//   const CustomAppBar({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.indigo,
//       elevation: 0,
//       title: Container(
//         color: Colors.white,
//         // padding: const EdgeInsets.symmetric(
//         //   horizontal: 20,
//         //   vertical: 10,
//         // ),
//         child: Text('Bhavs Created App',
//           style: TextStyle(
//               color: Colors.black,
//               fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       iconTheme: IconThemeData(color: Colors.white),
//       actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size.fromHeight(50.0);
// }


