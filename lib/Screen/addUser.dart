import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
        actions: [
          TextButton(
              onPressed: () {
                final isValid = formKey2.currentState!.validate();
                if (isValid) {
                  Get.showSnackbar(
                    GetBar(
                      duration: Duration(seconds: 2),
                      message: "Data Saved",
                    ),
                  );
                } else {
                  Get.showSnackbar(
                    GetBar(
                      duration: Duration(seconds: 2),
                      message: "Data Error",
                    ),
                  );
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: formKey2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 93,
                            width: 93,
                            child: Icon(Icons.camera_enhance),
                          )),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "First Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Empty Data!" : null,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Last Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Empty Data!" : null,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Job",
                          prefixIcon: Icon(
                            Icons.business_center,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Empty Data!" : null,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Phone Number",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Empty Data!" : null,
                      ),
                      TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Empty Data!" : null,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
