import 'package:flutter/material.dart';

class Product {
  late final String pic;

  Product({required this.pic});
}

class details extends StatefulWidget {
  const details({Key? key}) : super(key: key);

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  List<Product> picture = [
    Product(pic: 'assets/images/Image Popular Product 1.png'),
    Product(pic: 'assets/images/ps4_console_white_2.png'),
    Product(pic: 'assets/images/ps4_console_white_3.png'),
    Product(pic: 'assets/images/ps4_console_white_4.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey.shade200,
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Row(
              children: [
                Text(
                  "4.8",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                )
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey.shade200,
              child: Image(
                image: AssetImage('assets/images/Image Popular Product 1.png'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.grey.shade200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Expanded(

                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => pictures(picture[index]),
                          separatorBuilder: (context, index) => SizedBox(
                                width: 10,
                              ),
                          itemCount: picture.length),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Colors.grey.shade200,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Wireless Controller for Ps4",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Wireless Controller for Ps4 gives you what",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text("you want in your gaming from over precision ",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Text("Control your gaming to sharing ...",
                        style: TextStyle(
                          color: Colors.grey,
                        )),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "See More Details",
                              style: TextStyle(color: Colors.deepOrange),
                            )),
                        Icon(
                          Icons.navigate_next,
                          color: Colors.deepOrange,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30)),
                      //child: Text("k"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(30)),
                      //child: Text("k"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(30)),
                      //child: Text("k"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      //child: Text("k"),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.remove,
                        color: Colors.deepOrange,
                      ),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add,
                        color: Colors.deepOrange,
                      ),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            Container(
              // width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.deepOrange,
                ),
                height: 50.0,
                width: 200,
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pictures(Product view) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: OutlinedButton(
          onPressed: () {},
          // style: OutlinedButton.styleFrom(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(10)))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image(
                  image: AssetImage('${view.pic}'),
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          )),
    );
  }
}
