import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/res/components/buttonComponent/loginButton.dart';
import 'package:nowaste_zindagi/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../view_model/provider/component_provider.dart';
import '../../view_model/provider/firebase_provider.dart';

class UpdateProfile extends StatelessWidget {
  UpdateProfile({Key? key}) : super(key: key);

  final TextEditingController updateNameController = TextEditingController();
  final TextEditingController updateAge = TextEditingController();
  //Don't Need to Dispose Controller Because it is stateless widget

  @override
  Widget build(BuildContext context) {
    context.read<FirebaseProvider>().initializeUserID();
    return Scaffold(body: SafeArea(
      child: Consumer<FirebaseProvider>(builder: (context, checkUpdate, child) {
        return FutureBuilder(
            future: checkUpdate.getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == null) {
                  checkUpdate.updateUser("x${checkUpdate.userID}lk", "");
                }}

                if (snapshot.hasData) {
                  updateNameController.text = snapshot.data?.username ?? "";
                  updateAge.text = snapshot.data?.age ?? "";
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 80.0),
                    children: [
                      // TODO: show avatar code start
                      // Center(
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(10.0),
                      //     child: Image.network(
                      //       'https://avatoon.net/wp-content/uploads/2022/07/Cartoon-Avatar-White-Background-300x300.png',
                      //       width: 120,
                      //     ),
                      //   ),
                      // ),
                      // TODO: show avatar code end
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('No Waste', style: TextStyle(fontSize: 12)),
                          Text(
                            'Zindgi',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.redAccent),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Stack(
                          children: [
                            TextFormField(
                              controller: updateNameController,
                              enabled:
                                  checkUpdate.checkProfileUpdate ? true : false,
                              decoration: InputDecoration(
                                labelText: 'Username',
                                border: checkUpdate.checkProfileUpdate
                                    ? OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black87, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      )
                                    : InputBorder.none,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 3,
                              child: IconButton(
                                  onPressed: () {
                                    if (checkUpdate.checkProfileUpdate) {
                                      checkUpdate.checkProfile(false);
                                    } else {
                                      checkUpdate.checkProfile(true);
                                    }
                                  },
                                  icon: const Icon(Icons.edit)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: TextFormField(
                            controller: updateAge,
                            decoration: InputDecoration(
                                labelText: 'Age',
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black87, width: 1),
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            // initialValue: updateNameController.text,
                          )),
                      const SizedBox(
                        height: 20.0,
                      ),
                      LoginButton(
                        loading: checkUpdate.loading,
                        title: 'Update',
                        color: Colors.white,
                        backgroundColor: const Color(0xFFF7444E),
                        borderColor: Colors.transparent,
                        fontWeight: FontWeight.w500,
                        onTap: () {
                          String userName = updateNameController.text;
                          String age = updateAge.text;
                          if (updateNameController.text == '' ||
                              updateAge.text == '') {
                            Utils.toastMessages('Usename or Age are Empty');
                          } else {
                            checkUpdate.updateUser(userName, age);
                            checkUpdate.loadingCheck(true);
                          }
                        },
                      ),
                    ],
                  );
                } else {
                return const Center(child: CircularProgressIndicator());
              }
            });
      }),
    ));
  }
}
