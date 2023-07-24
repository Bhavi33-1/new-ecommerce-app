import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newapp/models/category_model.dart';
// import 'package:flutter/material.dart'hide Element;
import 'package:newapp/models/modals.dart';

import '../../blocs/category/category_bloc.dart';
import '../../blocs/category/category_state.dart';
import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/product_state.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
static const String routeName = '/home';

static Route route() {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => HomeScreen(),
  );
}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: CustomAppBar(title: 'Bhavs'),
      bottomNavigationBar: CustomNavBar(),
      body: Column(
      children: [
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if(state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CategoryLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.5,
                  viewportFraction: 0.9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),
                items: state.categories
                    .map((category) => HeroCarouselCard(category: category))
                    .toList(),
              );
            }
            else {
              return Text('Something went wrong');
            }
          },
        ),
        SectionTitle(title: 'Recommended'),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductLoading) {
              return Center(child: CircularProgressIndicator(),
              );
            }
            if(state is ProductLoaded) {
              return ProductCarousel(products: state.products
                  .where((product) => product.isRecommended)
                  .toList(),
              );
            }
            else {
               {return Text('Something went wrong');
               }
            }
          },
        ),
        SectionTitle(title: 'Most popular'),
        BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if(state is ProductLoading) {
              return Center(child: CircularProgressIndicator(),
              );
            }
            if(state is ProductLoaded) {
              return ProductCarousel(products: state.products
                  .where((product) => product.isPopular)
                  .toList(),
              );
            }
            else {
              {return Text('Something went wrong');
              }
            }
          },
        ),
        ],
      ),
    );
  }
}

// class ProductCarousel extends StatelessWidget {
//   final List<Product> products;
//
//   const ProductCarousel({
//     super.key,
//     required this.products,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 165,
//       child: ListView.builder(
//         shrinkWrap: true,
//           padding: const EdgeInsets.symmetric(
//               horizontal: 20.0,
//               vertical: 10.0
//           ),
//           scrollDirection: Axis.horizontal,
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 5.0),
//             child: ProductCard(product: products[index],),
//           );
//           }),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({
//     required this.product,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//       Container(
//         width: MediaQuery.of(context).size.width / 2.5,
//         height: 150,
//           child: Image.network(
//               Product.products[0].imageUrl,
//               fit: BoxFit.cover
//           ),
//       ),
//       Positioned(
//         top: 60,
//         child: Container(width: MediaQuery.of(context).size.width / 2.5,
//           height: 80,
//             decoration: BoxDecoration(
//             color: Colors.black.withAlpha(50),
//             ),
//         ),
//       ),
//       Positioned(
//         top: 65,
//         left: 5,
//         child: Container(width: MediaQuery.of(context).size.width / 2.5 - 10,
//           height: 70,
//           decoration: BoxDecoration(
//             color: Colors.black
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         Product.products[0].name,
//                         style: Theme.of(context).textTheme.headlineSmall!.copyWith(
//                           color: Colors.white,
//                         ),
//                       ),
//                     Text(
//                     '\$${Product.products[0].price}',
//                     style:
//                       Theme.of(context).textTheme.titleLarge!.copyWith(
//                     color: Colors.white,
//                     ),
//                     ),
//                     ],
//                   ),
//                 ),
//                   Expanded(
//                     child: IconButton(
//                         icon: Icon(
//                             Icons.add_circle,
//                             color: Colors.white
//                         ),
//                         onPressed: () {},
//                     ),
//                   ),
//           ],
//           ),
//             ),
//           ),
//         ),
//     ],
//     );
//   }
// }

// class SectionTitle extends StatelessWidget {
//   final String title;
//   const SectionTitle({
//     super.key,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Align(
//         alignment: Alignment.topLeft,
//           child: Text(
//               title,
//               style: Theme.of(context).textTheme.displaySmall)),
//     );
//   }
// }

// class HeroCarouselCard extends StatelessWidget {
//   final Category category;
//
//   const HeroCarouselCard({
//     required this.category,
// });
//
//   // const HeroCarouselCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//           margin: EdgeInsets.symmetric(
//               horizontal: 5.0,
//               vertical: 20
//           ),
//           child: ClipRRect(
//               borderRadius: BorderRadius.all(Radius.circular(5.0)),
//               child: Stack(
//                 children: <Widget>[
//                   Image.network(category., fit: BoxFit.cover, width: 1000.0),
//                   Positioned(
//                     bottom: 0.0,
//                     left: 0.0,
//                     right: 0.0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             Color.fromARGB(200, 0, 0, 0),
//                             Color.fromARGB(0, 0, 0, 0)
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       padding: EdgeInsets.symmetric(
//                           vertical: 10.0, horizontal: 20.0),
//                       child: Text(
//                         category.name,
//                         style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white)
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//         );
//   }
// }
