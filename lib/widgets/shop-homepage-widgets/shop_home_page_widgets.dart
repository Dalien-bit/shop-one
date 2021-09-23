import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          color: Colors.white24,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar( 
                      backgroundImage:
                          AssetImage('assets/categories/Fashion.jpg'),
                      radius: 30,
                    ),
                    Text('Fashion'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/categories/beauty.jpg'),
                      radius: 30,
                    ),
                    Text('Beauty'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/categories/Food.jpg'),
                      radius: 30,
                    ),
                    Text('Food'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/categories/Gifts.jpg'),
                      radius: 30,
                    ),
                    Text('Gifts'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/categories/Electronics.jpg'),
                      radius: 30,
                    ),
                    Text('Electronics'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/categories/Stationary.jpg'),
                      radius: 30,
                    ),
                    Text('Stationary'),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
