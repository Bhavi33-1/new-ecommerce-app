import 'package:flutter/material.dart';
import 'package:newapp/config/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const CustomAppBar({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pinkAccent.shade100,
      elevation: 0,
      title: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(title, style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.black)),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      actions: [IconButton(icon: Icon(Icons.favorite), onPressed: () {
        Navigator.pushNamed(context, '/wishlist');
      })],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}