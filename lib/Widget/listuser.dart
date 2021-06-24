import 'package:contact/Screen/detailScreen.dart';
import 'package:contact/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListUser extends StatefulWidget {
  final DataModel dataModel;
  ListUser(this.dataModel);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    List<UserModel> datas = widget.dataModel.data;
    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Card(
            elevation: 2,
            child: ListTile(
              leading: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(datas[index].avatar)),
              title: Text(
                datas[index].firstName + ' ' + datas[index].lastName,
                style: TextStyle(color: Colors.blue),
              ),
              subtitle: Text(
                datas[index].email,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          onTap: () {
            Get.to(DetailScreen(), arguments: [
              datas[index].avatar,
              datas[index].email,
              datas[index].firstName,
              datas[index].lastName,
              datas[index].id
            ]);
          },
        );
      },
    );
  }
}
