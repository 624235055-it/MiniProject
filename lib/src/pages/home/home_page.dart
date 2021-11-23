import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini/src/configs/app_route.dart';
import 'package:mini/src/configs/app_setting.dart';
import 'package:mini/src/widgets/menu_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final List<String> images = [
    'https://sereneproperty.com/2019/connect/assets/frontend/img/photo-connect-800x815--1.jpg',
    'https://www.homezoomer.com/wp-content/uploads/2018/08/Episode-%E0%B8%9E%E0%B8%AB%E0%B8%A5%E0%B9%82%E0%B8%A2%E0%B8%98%E0%B8%B4%E0%B8%99-%E0%B8%AA%E0%B8%B0%E0%B8%9E%E0%B8%B2%E0%B8%99%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88_G-60.jpg',
    'https://www.homenayoo.com/wp-content/uploads/2020/09/Sabai-Sabai-Condo-Sukhumvit-1151.jpg',
    'https://lh3.googleusercontent.com/proxy/d5tbZSFJdsLobcUD5_HHwnzK6pf7l5M7nRL7spjxhU6GeNB9jLM0iHI4uo87w2tDtybi5duRT8xVBsSzbkGjmv8HxZl2K-YHZbFZj_99-y_eGvpFr_uFpsPm6kTMEkg',
    'https://photosrp.dotproperty.co.th/1.0-TH-542528-PJ-13018-3846647045a7165a26b083-1-525-325/%E0%B8%AD%E0%B8%B4%E0%B8%99%E0%B8%9F%E0%B8%B4%E0%B8%99%E0%B8%B4%E0%B8%95%E0%B8%B4-%E0%B8%84%E0%B8%AD%E0%B8%99%E0%B9%82%E0%B8%94.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQ8ISfP7wICXcKuGKk-IGY7-2PpZPsLYZ9u9UMkTquRtxCrwj7RDjiEDUbVGkIF0v6kiw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS48Prj0jVAa4P10fJOkHnJeo-vycJbTUYxbupgkxthnUR8OXKuwiRdym8SIbatQ2BHqKM&usqp=CAU',
  ];
  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://s3-ap-southeast-1.amazonaws.com/o77site/xt-phaya-thai-condominium-portrait-810x890.jpg",
      "title": "EXTEND YOUR STYLE",
      "description":
      "Condo.",
      "price": "\$12500",
      "page": "login"
    },
    {
      "img":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQz_EFg023Z2hI1xf4Je_oG1m5FRtCQG8UCtnSuEp7704S9UvrmPMhacY341mgRVTSHRZI&usqp=CAU",
      "title": "CONDOMINIUM",
      "description":
      "Condo.",
      "price": "\$20000",
      "page": "info"
    },
    {
      "img":
      "http://i.imgur.com/jjbn0mY.jpg",
      "title": "Condo The Parkland",
      "description":
      "Condo The Parkland Grand Asoke - Phetchaburi.",
      "price": "\$30000",
      "page": "upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/kokotata.jpg'),
              ),
              accountName: Text('Phongpol NItiweroj',
                style: TextStyle(color: Colors.white),),
              accountEmail: Text('624235055@parichat.skru.ac.th',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.lightBlue,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(images[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, item["page"]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Text(item["price"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink.shade200)),
                            Text(item["title"],
                                style:
                                TextStyle(fontSize: 32, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 8),
                              child: Text(
                                item["description"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink.shade200),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
} //end class
