import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsg_homework_app/hw_three/util/style.dart';
import 'package:gsg_homework_app/hw_three/util/util.dart';

import 'component/custom_btn.dart';
import 'component/grid_list_item.dart';
import 'component/profile_data.dart';

class Profile extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorWhite,
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 6,
        brightness: Brightness.light,
        backgroundColor: colorWhite,
        leadingWidth: 100,
        automaticallyImplyLeading: true,
        leading: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            "Stylish".toUpperCase(),
            textAlign: TextAlign.center,
            style: bigText,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: colorBlack,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.menu,
                color: colorBlack,
              ),
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/black.jpg"),
                            fit: BoxFit.fill),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileData(
                            value: "1,252",
                            title: "posts",
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ProfileData(
                            value: "4m",
                            title: "followers",
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          ProfileData(
                            value: "256",
                            title: "following",
                          ),
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CustomBotton(
                        text: "Edit Profile",
                        width: 200,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Home Furniture",
              style: bigText,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Home Furniture Home Furniture Home Furniture",
              maxLines: 1,
              style: normalText.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Contact Us",
              style:
                  bigText.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "+972 595 933 777",
              style: bigText.copyWith(
                  color: colorBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Gaza Strip",
              style: normalText.copyWith(fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBotton(
                  text: "Add Product",
                  width: 110,
                ),
                CustomBotton(
                  text: "Share",
                  width: 110,
                ),
                CustomBotton(
                  text: "Contact Us",
                  width: 110,
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),


            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GridListItem(imageSrc: images[index],);
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith( canvasColor: colorWhite ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            //todo setState in real work
          },
          selectedIconTheme: IconThemeData(color: colorBlack ),
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: index == 0 ?colorBlack:colorNormal,) ,label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search, color: colorNormal,) ,label: "search"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border, color: colorNormal,) ,label: "favorite" ,),
            BottomNavigationBarItem(icon: Icon(Icons.person, color: colorNormal,) ,label: "person"),
          ],

        ),
      ),
    );
  }
}




