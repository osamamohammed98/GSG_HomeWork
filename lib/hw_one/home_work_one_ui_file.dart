import 'package:flutter/material.dart';
import 'package:gsg_homework_app/hw_one/instagrame_profile_file.dart';

class HomeWorkOneUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //todo this for app bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text(
                    "Edit Profile",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            //todo this for app bar

            SizedBox(
              height: 60,
            ),

            //todo this for image part
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfile(),),);
              },
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(26, 24, 24, 30),
                        Color.fromRGBO(102, 100, 100, 30)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/osama.jpeg",
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1), BlendMode.dstATop),
                    ),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            //todo this for image part
            SizedBox(
              height: 25,
            ),
            Divider(),
            buildContainer(title: "Name", value: "Osama M. Al-Dasoqi", fun: () {
              print("Osama M. Al-Dasoqi");
            },),
            Divider(),
            buildContainer(
              title: "Address",
              value: "Khanyounes Al-helale -Al Ahmer",
              fun: () {
                print("Khanyounes Al-helale -Al Ahmer");
              },),
            Divider(),
            buildContainer(title: "Email", value: "Example@gmail.com",
              fun: () {
                print("Example@gmail.com");
              },),
            Divider(),
            buildContainer(title: "Mobile", value: "00972000000000" ,
              fun: () {
                print("00972000000000");
              },),
            Divider(),
            buildContainerIcon(title: "Birthdate",
                value: "11-3-1998",
                data: Icons.calendar_today_outlined),

          ],
        ),
      ),
    );
  }

// Container buildContainer({String title , String value }) {

}

Container buildContainerIcon({String title, String value, IconData data}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title", style: TextStyle(color: Colors.black, fontSize: 14),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$value", style: TextStyle(
                color: Colors.blue, fontSize: 15, fontFamily: "myFont"),),
            Icon(data, color: Colors.blue, size: 16,),
          ],
        ),
      ],
    ),
  );
}

class buildContainer extends StatelessWidget {
  String title, value;
  Function fun;

  buildContainer({this.value, this.title, this.fun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title", style: TextStyle(color: Colors.black, fontSize: 14),),
            Text("$value", style: TextStyle(
                color: Colors.blue, fontSize: 15, fontFamily: "myFont"),),
          ],
        ),
      ),
    );
  }
}
