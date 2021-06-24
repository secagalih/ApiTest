import 'package:contact/Api/apiservice.dart';
import 'package:contact/Screen/addUser.dart';
import 'package:contact/Widget/listuser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  IconData ikon = Icons.arrow_forward_ios;
  String page = '1';
  bool dua = true;
  bool lanjut() {
    if (dua == true) {
      page = '2';
      ikon = Icons.arrow_back_ios;

      return dua = false;
    } else {
      page = '1';
      ikon = Icons.arrow_forward_ios;
      return dua = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(page);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: new Column(
          children: <Widget>[
            new Expanded(
              child: FutureBuilder(
                future: ApiServicesss().getUserr(page),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return ListUser(snapshot.data);
                  }
                  return Center(
                    child: Text('No Data'),
                  );
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    lanjut();
                  });
                },
                icon: Icon(ikon)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(CreateUser());
          }),
    );
  }
}
