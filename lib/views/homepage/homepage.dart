import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:githubprofiles/controllers/users_controller.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final usersControllers = Get.put(GetUsersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.account_circle_rounded),
          title: Text('GITHUB PROFILES'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.all(8),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ],
        ),
        body: Column(children: [
          Obx(() => Expanded(
                child: ListView.builder(
                    itemCount: usersControllers.usersList.length,
                    itemBuilder: (BuildContext context, index) {
                      var singleUser = usersControllers.usersList[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(
                                  left: 10, top: 10, right: 10, bottom: 10),
                              padding: EdgeInsets.only(
                                  left: 20, top: 10, right: 10, bottom: 10),
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.grey,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            singleUser.avatarUrl,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                          child: SizedBox(
                                            width: 40.0,
                                            height: 40.0,
                                            child:
                                                new CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            new Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  // CachedNetworkImage(
                                  //   imageUrl:
                                  //       'https://avatars.githubusercontent.com/u/1?v=4',
                                  //   errorWidget: (context, url, error) =>
                                  //       CircularProgressIndicator(),
                                  //   imageBuilder: (context, imageProvider) =>
                                  //       CircleAvatar(
                                  //     radius: 50,
                                  //     backgroundImage: imageProvider,
                                  //   ),
                                  // ),
                                  // ClipOval(
                                  //   child: CachedNetworkImage(
                                  //     imageUrl: singleUser.avatarUrl,
                                  //     width: 80.0,
                                  //     height: 80.0,
                                  //   ),
                                  // ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                        right: 10,
                                        bottom: 10),
                                    padding: EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                        right: 10,
                                        bottom: 10),
                                    child: Text(
                                      singleUser.login.toUpperCase(),
                                      style: new TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                ],
                              ))
                        ],
                      );
                    }),
              ))
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
