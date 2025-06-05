import 'package:flutter/material.dart';

import '../screens/cart_screen.dart';
import 'container_button_model_screen.dart';

class ProductDetailsPopUp extends StatelessWidget {
  final TextStyle iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  List<Color> clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context)=> Container(
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Size", style: iStyle,),
                          SizedBox(height: 20,),
                          Text("Color", style: iStyle,),
                          SizedBox(height: 20,),
                          Text("Total", style: iStyle,),
                          SizedBox(height: 20,),
                        ],
                      ),
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Text("S", style: iStyle,),
                              SizedBox(width: 30,),
                              Text("M", style: iStyle,),
                              SizedBox(width: 30,),
                              Text("L", style: iStyle,),
                              SizedBox(width: 10,),
                              Text("XL", style: iStyle,),
                              SizedBox(width: 30,),
                            ],
                          ), // Row
                          SizedBox(height: 20,),
                          Container(
                            child: Row(
                              children: [
                                for(var i = 0 ; i < 4 ; i++)
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 7),
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: clrs[i],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Text("-", style: iStyle,),
                              SizedBox(width: 30,),
                              Text("1", style: iStyle,),
                              SizedBox(width: 30,),
                              Text("+", style: iStyle,),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Payment", style: iStyle,),
                      Text(
                        "\$30.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=> CartScreen(),
                          ));
                    },
                    child: ContainerButtonModel(
                      containerWidth: MediaQuery.of(context).size.width,
                      itext: "Checkout",
                      bgColor: Colors.cyan,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.width / 1.5,
        itext: "Buy Now",
        bgColor: Colors.cyan,
      ),
    );
  }
}