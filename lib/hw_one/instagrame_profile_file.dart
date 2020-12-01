import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 310,
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(120, 80, 255, 100),
                    Color.fromRGBO(4, 122, 242, 100),
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/graduate.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Color.fromRGBO(4, 122, 242, 100).withOpacity(0.2),
                      BlendMode.dstATop),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //todo this for app bar
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    margin: EdgeInsets.only(top: 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        Icon(
                          Icons.edit_location_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  //todo this for app bar
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          image: DecorationImage(
                            image: AssetImage("assets/images/graduate.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Osama Mohamed",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Khan younes",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildCenter(title: "21" , value: "Post" ),
                  buildCenter(title: "981" , value: "Followers" ),
                  buildCenter(title: "63" , value: "Following" ),
                ],
              ),
            ),
            SizedBox(height: 24,),
            DefaultTabController(length: 2, child: TabBar(
              tabs: [
                Tab(child: Text("Posts" , style: TextStyle(color: Colors.black),), ),
                Tab(child: Text("Liked" , style: TextStyle(color: Colors.grey),), ),
              ],
            ),),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
              label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.black,
              ),
              label: "Notification"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pregnant_woman_outlined,
                color: Colors.black,
              ),
              label: "profile"),
        ],
      ),
    );
  }

  Center buildCenter({String title, String value}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$title",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
          Text(
            "$value",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
