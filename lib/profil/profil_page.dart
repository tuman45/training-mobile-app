import 'package:flutter/material.dart';
import 'package:training/widget/base_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfilPage extends StatefulWidget {
  final String routes = "/profil_page";

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends BaseStatefulState<ProfilPage> {
  List<dynamic> array = ["dedik", "andre", "handika", "Iqbal", "adriano"];
  List<dynamic> arrayFoto = [
    "ic_foto1.JPG",
    "ic_foto2.JPG",
    "ic_foto3.JPG",
    "ic_foto4.jpg",
    "ic_foto5.jpg"
  ];

  int selectedActive = 0;

  // Variable to store the fetched images
  List<String> randomImages = [];

  // Fetch random images from an API
  Future<void> fetchRandomImages() async {
    final response = await http
        .get(Uri.parse('https://picsum.photos/v2/list?page=1&limit=10'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      setState(() {
        randomImages = data
            .map((imageData) => imageData['download_url'] as String)
            .toList();
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchRandomImages(); // Fetch images when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //--------------------------------------------------------------CONTENT 1
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //-------------------------------------------------------------- USER S/D PENGATURAN
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("ajizakaria",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Icon(Icons.arrow_drop_down, size: 28),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.add_box_outlined, size: 28),
                          SizedBox(width: 10),
                          Icon(Icons.menu, size: 28),
                        ],
                      )
                    ],
                  ),
                ),
                //-------------------------------------------------------------- USER S/D PENGATURAN

                //-------------------------------------------------------------- PP - FOLOWERS
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(width: 7.5, color: Colors.pink),
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage("assets/ic_foto1.JPG"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("35",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("Post",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("10.6K",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("Followers",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("595",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("Following",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //-------------------------------------------------------------- PP - FOLOWERS

                //-------------------------------------------------------------- INFO
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Aji Zakaria",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(height: 10),
                      Text("Digital Creator",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Row(
                        children: [
                          Icon(Icons.link, color: Colors.blue),
                          Text("teksnologi.com",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.blue)),
                        ],
                      ),
                      Container(
                        height: 60,
                        width: setWidth(1),
                        alignment: Alignment.topLeft,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Text("Professional dashboard",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Edit Profile",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                height: 60,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text("Share Profile",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //-------------------------------------------------------------- INFO

                //-------------------------------------------------------------- HIGHLIGHT
                Container(
                  height: 120,
                  // width: setWidth(1),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: array.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: AssetImage("assets/" +
                                        arrayFoto[index].toString()),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Text(array[index].toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal))
                          ],
                        );
                      }),
                ),
                //-------------------------------------------------------------- HIGHLIGHT
              ],
            ),
          ),

          //--------------------------------------------------------------CONTENT 1

          //--------------------------------------------------------------CONTENT 2
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedActive = 0;

                            print(selectedActive.toString());
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2,
                                        color: (selectedActive == 0)
                                            ? Colors.black
                                            : Colors.transparent))),
                            child: Icon(Icons.grid_on,
                                color: (selectedActive == 0)
                                    ? Colors.black
                                    : Colors.grey,
                                size: 36)),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedActive = 1;

                            print(selectedActive.toString());
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2,
                                        color: (selectedActive == 1)
                                            ? Colors.black
                                            : Colors.transparent))),
                            child: Icon(Icons.play_circle,
                                color: (selectedActive == 1)
                                    ? Colors.black
                                    : Colors.grey,
                                size: 36)),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedActive = 2;

                            print(selectedActive.toString());
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2,
                                        color: (selectedActive == 2)
                                            ? Colors.black
                                            : Colors.transparent))),
                            child: Icon(Icons.account_box,
                                color: (selectedActive == 2)
                                    ? Colors.black
                                    : Colors.grey,
                                size: 36)),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: randomImages.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      // borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        randomImages[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
          //--------------------------------------------------------------CONTENT 2
        ],
      ),
    );
  }
}
