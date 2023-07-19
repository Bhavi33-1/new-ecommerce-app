import 'package:flutter/material.dart';
import 'package:newapp/widgets/widgets.dart';

import '../../models/product_model.dart';


class CartScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Text('GO To CHECKOUT',
                    style: Theme.of(context).textTheme.displaySmall!),
              )
            ],),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Add \$30.0 for Free Delivery',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ElevatedButton(onPressed: () {Navigator.pushNamed(context, '/');
                    },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(),
                        elevation: 0,
                      ),
                      child:
                        Text('Add More Items',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                              color: Colors.white,
                          ),
                        ),
                    ),
                  ],
                ),
              SizedBox(height: 10),
              CartProductCard(product: Product.products[0]),
              CartProductCard(product: Product.products[1]),
                CartProductCard(product: Product.products[2]),
              ],
            ),



            Column(children: [
                Divider(thickness: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SUBTOTAL',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '\$82',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DELIVERY FEE',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                '\$5',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
        ]),
      ),
      Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
            ),
          ),
        ],
      ),
      ],
    ),

          Stack(
          children: [
          Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
          color: Colors.black.withAlpha(50),
          ),
          ),
          Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(5.0),
          height: 50,
          decoration: BoxDecoration(
          color: Colors.black,
          ),
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          'TOTAL',
          style: Theme.of(context)
              .textTheme.headlineSmall!
              .copyWith(color: Colors.white),
          ),
          Text(
          '\$87',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
          ),
          ],
          ),
          ),
          ),
          ],
          ),
                  ],),


               ),
              );

        }
      }

// class CartProductCard extends StatelessWidget {
//   final Product product;
//   const CartProductCard({
//     Key? key,
//     required this.product,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//         Image.network(
//           product.imageUrl,
//           width: 100,
//           height: 80,
//           fit: BoxFit.cover,
//         ),
//         SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//             Text(
//               product.name,
//               style: Theme.of(context).textTheme.headlineSmall,
//             ),
//             Text(
//               '\$${product.price}',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//           ],
//           ),
//         ),
//         SizedBox(width: 10),
//         Row(children: [
//           IconButton(icon: Icon(Icons.remove_circle), onPressed: () {}),
//           Text(
//             '1',
//             style: Theme.of(context).textTheme.headlineSmall,),
//           IconButton(icon: Icon(Icons.add_circle), onPressed: () {}),
//         ],)
//       ],
//       ),
//     );
//   }
// }
