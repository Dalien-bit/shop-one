import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopone/data_objects/item.dart';
import 'package:shopone/screens/sell/add_product_screen.dart';

const List<Color> colList = [
  Colors.redAccent,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.yellowAccent,
  Colors.orangeAccent,
  Colors.indigoAccent,
];

class ItemsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itList = Provider.of<ListOfItems>(context).itemList;
    return Container(
            color: Colors.black26,

      child: ListView.builder(
        itemCount: itList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colList[index % 5],
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itList[index].itemName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Expanded(child: Container()),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AddProductScreen.routeName,
                              arguments: ScreenArguments(itList[index].itemId),
                            );
                          },
                          icon: Icon(Icons.add)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.black45,
                      ),
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: itList[index].listOfProducts!.length,
                            itemBuilder: (BuildContext context, int index1) {
                              return Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        color: Colors.white,
                                      ),
                                      height: double.infinity,
                                      width: 75,
                                      child: Center(
                                        child: Text(itList[index]
                                            .listOfProducts![index1]
                                            .productName),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(8),
                                    //   //color: Colors.white,
                                    // ),
                                    width: 5,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  )
                ],
              ),
              height: 150,
            ),
          );
        },
      ),
    );
  }
}
