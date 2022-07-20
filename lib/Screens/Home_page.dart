import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lilac_assignmnt_app/models/currentmodel.dart';
import 'package:lilac_assignmnt_app/models/getplaceddetails.dart';
import 'package:lilac_assignmnt_app/models/ipget.dart';
import 'package:lilac_assignmnt_app/models/location.dart';
import 'package:lilac_assignmnt_app/models/weatherModel.dart';
import 'package:lilac_assignmnt_app/viewmodels/commonviewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String city = "Kannur";
  final url = "https://api.ipify.org/?format=json";
  var _postJson;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  void fetchPosts() async {
    try {
      log("inside ip");
      final Response = await get(Uri.parse(url));
      final jsonData = jsonDecode(Response.body);

      log("out===" + jsonData.toString());

      ipget authUser = ipget.fromJson(jsonData);
      final url2 = "https://ipinfo.io/" + authUser.ip + "/geo";
      print("ip" + url2.toString());

      final Response2 = await get(Uri.parse(url2));
      final jsonData2 = jsonDecode(Response2.body);

      log("out2===" + jsonData2.toString());

      getplacedetails authUser2 = getplacedetails.fromJson(jsonData2);

      log("place==" + authUser2.city);

      setState(() {
        city = authUser2.city;
        _postJson = jsonData;

        log("sresip==" + authUser.ip);
      });
    } catch (err) {
      print(err);
    }
  }

  late commonviewmodel vm;
  final TextEditingController _searchController = TextEditingController();
  late WeatherModel productData;
  late LocationModel locate;
  late CurrentModel current;
  @override
  Widget build(BuildContext context) {
    vm = Provider.of<commonviewmodel>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: FutureBuilder(
                future: vm.getWeatherDetail(city),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    productData = vm.productDetails!['productData'];
                    locate = productData.locate;
                    current = productData.current;

                    print("locate data :" + locate.country.toString());
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                          } else {
                            print("locate data :" + locate.country.toString());
                          }

                          return (Container(
                            padding: EdgeInsets.all(20),
                            child: Stack(
                              children: [
                                TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      labelText: "Search the Location",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Wrap(children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            Text(
                                              locate.name,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              current.last_updated.toString(),
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              height: 150,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  current.temp_c.toString() +
                                                      " \u2103",
                                                  style: const TextStyle(
                                                      fontSize: 75,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      color: Colors.black),
                                                ),
                                                const Text(
                                                  'Day',
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 40),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white30)),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    const Text(
                                                      'Wind ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      current.wind_kph
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      'Cloud ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      current.cloud.toString(),
                                                      style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    const Text(
                                                      'Humidity ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      current.humidity
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ));
                        }

                      default:
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                    }
                  } else {
                    return Container(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
