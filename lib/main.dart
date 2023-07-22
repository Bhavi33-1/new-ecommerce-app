import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/cart/cart_bloc.dart';
import 'package:newapp/blocs/cart/cart_event.dart';

import 'blocs/wishlist/wishlist_bloc.dart';
import 'screens/home/home_screen.dart';
import 'package:newapp/config/app_router.dart';
import 'package:newapp/config/theme.dart';
import 'package:newapp/screens/screens.dart';
import 'screens/home/home_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
      runApp(create());
}
  // home: HomeScreen(),
// ));



// import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}



class create extends StatelessWidget {
  // const create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
      ],
    child: MaterialApp(
      title: 'Bhavs Created App',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      // home: SplashScreen(),
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


