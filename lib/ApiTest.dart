import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://fakestoreapi.com/products'));

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int id;
  final String title;
  final String image;

  const Photo({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] as int,
      title: json['title'] as String,
      image: json['image'] as String,
    );
  }
}

class ApiTest extends StatefulWidget {
  ApiTest({Key? key}) : super(key: key);

  @override
  State<ApiTest> createState() => _ApiTestState();
}

class _ApiTestState extends State<ApiTest> {
  late Future<List<Photo>> photos ;

  @override
  void initState() {
    photos = fetchPhotos(http.Client());

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  hintText: 'Search product',
                  border: InputBorder.none),
            ),
          ),
          actions: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey.shade200),
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.grey.shade200),
              child: Icon(
                Icons.notifications_rounded,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A Summer Surprise",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Cashback 20%",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 187, 153),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/Flash Icon.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Flash",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text("Deal", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 187, 153),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/Bill Icon.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Bill",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 187, 153),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/Game Icon.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Game",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 187, 153),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/Gift Icon.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Daily",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text("Gift", style: TextStyle(fontSize: 15))
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      width: 60,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 187, 153),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                        onPressed: () {
                          print('its work!!');
                        },
                        icon: SvgPicture.asset(
                          "assets/images/Flash Icon.svg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "More",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Special for you",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 100,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See more",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.grey),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 140.0,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => specialForYou(),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.0,
                      ),
                      itemCount: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  "Popular Product",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 80,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "See more",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          color: Colors.grey),
                    ))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(children: [
                Expanded(
                    child: Container(
                        height: 140.0,
                        child: Container(
                          child: FutureBuilder(
                              future: photos,
                              builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else if (snapshot.hasData) {
                              List<Photo> photos = snapshot.data!;
                              return ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  Photo photo = photos[index];
                                  return Container(
                                    width: 100,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(photo.image),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(photo.title,maxLines: 1,
                                          overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>

                                    SizedBox(width: 20.0),
                                itemCount: photos.length,
                              );
                            } else {
                              return Center(
                                child: Text('No data available.'),
                              );
                            }
                          }),
                        )))
              ]))
        ]))));
  }
}

Widget specialForYou() {
  return Container(
    width: 250,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
            image: AssetImage('assets/images/Image Banner 2.png'),
            fit: BoxFit.cover)),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Smart phone",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "18 Brands",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

// Widget popularProduct(Fav view) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         width: 220,
//         height: 150,
//         decoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Image(
//           image: AssetImage("${view.image}"),
//         ),
//       ),
//       SizedBox(
//         height: 15,
//       ),
//       Text(
//         "${view.name}",
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(fontSize: 18),
//       ),
//       Row(
//         children: [
//           Text(
//             "\$${view.price}",
//             style: TextStyle(fontSize: 18, color: Colors.deepOrange),
//           ),
//           SizedBox(
//             width: 50,
//           ),
//           Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   color: Colors.grey.shade100),
//               child: IconButton(
//                 icon: Icon(Icons.favorite),
//                 color: view.isPressed ? Colors.grey : Colors.red,
//                 onPressed: () {
//                   // setState(() {
//                   //   view.isPressed = !view.isPressed;
//                   // });
//                 },
//               ))
//         ],
//       ),
//     ],
//   );
// }
