import 'package:flutter/material.dart';
import 'package:flutterfooddelivery/src/widgets/custom_list_tile.dart';
import 'package:flutterfooddelivery/src/widgets/small_button.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  bool turnOnNotification = false;
  bool turnOnLocation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Profile",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3.0,
                          offset: Offset(0, 4.0),
                          color: Colors.black38,
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/breakfast.jpeg",
                        ),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "George Washington",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      Text(
                          "+880123578543",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      SmallButton(btnText: "Edit",),
                    ],
                  )
                ],
              ),
              SizedBox(height: 30.0,),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomListTile(
                        icon: Icons.location_on,
                        text: "Location",
                      ),
                      Divider(height: 10.0, color: Colors.grey,),
                      CustomListTile(
                        icon: Icons.visibility,
                        text: "Change Password",
                      ),
                      Divider(height: 10.0, color: Colors.grey,),
                      CustomListTile(
                        icon: Icons.shopping_cart,
                        text: "Shipping",
                      ),
                      Divider(height: 10.0, color: Colors.grey,),
                      CustomListTile(
                        icon: Icons.payment,
                        text: "Payment",
                      ),
                    ],
                  ),
                ),
                elevation: 3.0,
              ),
              SizedBox(height: 30.0,),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "App Notifications",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                            value: turnOnNotification,
                            onChanged: (bool value){
                              setState(() {
                                turnOnNotification = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(height: 10.0, color: Colors.grey,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Location Tracking",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          Switch(
                            value: turnOnLocation,
                            onChanged: (bool value){
                              setState(() {
                                turnOnLocation = value;
                              });
                            },
                          )
                        ],
                      ),
                      Divider(height: 10.0, color: Colors.grey,),
                    ],
                  ),
                ),
                elevation: 3.0,
              ),
              SizedBox(height: 30.0,),
              Text(
                "Other",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0,),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Language",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Divider(height: 30.0, color: Colors.grey,),
                        Text(
                          "Currency",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Divider(height: 30.0, color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
