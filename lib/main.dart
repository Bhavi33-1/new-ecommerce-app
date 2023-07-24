import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/blocs/cart/cart_bloc.dart';
import 'package:newapp/blocs/cart/cart_event.dart';
import 'package:newapp/blocs/category/category_bloc.dart';
import 'package:newapp/blocs/category/category_event.dart';
import 'package:newapp/blocs/product/product_bloc.dart';
import 'package:newapp/blocs/product/product_event.dart';
import 'package:newapp/repositories/category/category_repository.dart';
import 'package:newapp/repositories/product/product_repository.dart';

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
        BlocProvider(
            create: (_) => CategoryBloc(
                categoryRepository: CategoryRepository(),
            )..add(LoadCategories()),
        ),
        // BlocProvider(
        //   create: (_) => ProductBloc(
        //     productRepository: ProductRepository(),
        //   )..add(LoadProducts()),
        // ),
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




