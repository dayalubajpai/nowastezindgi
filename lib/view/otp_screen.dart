import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nowaste_zindagi/res/components/buttonComponent/loginButton.dart';
import 'package:nowaste_zindagi/utils/routes/routes.dart';
import 'package:nowaste_zindagi/utils/routes/routes_name.dart';
import 'package:nowaste_zindagi/utils/utils.dart';
import 'package:provider/provider.dart';

import '../res/components/textStyle.dart';
import '../view_model/validation_provider.dart';

class OtpScreen extends StatelessWidget {
  Map data;
  OtpScreen({Key? key, required this.data}) : super(key: key);
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    otp1.dispose();
    otp2.dispose();
    otp3.dispose();
    otp4.dispose();
    otp6.dispose();
    otp5.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    bool _loading = false;

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.login);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Go Back",
                    style: TextStyles.subheading
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    " (change method)",
                    style: TextStyles.extrasmallTxt
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              "Your Phone No - ${data['phoneNumber']}",
              style: TextStyles.extrasmallTxt,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Form(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 64,
                width: 40,
                child: TextFormField(
                    controller: otp1,
                    autofocus: true,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            8), // Adjust the border radius as needed
                        borderSide: BorderSide(
                            color: Colors
                                .grey), // Adjust the border color as needed
                      ),
                    )),
              ),
              SizedBox(
                height: 64,
                width: 40,
                child: TextFormField(
                  controller: otp2,
                  onSaved: (pin2) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the border radius as needed
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Adjust the border color as needed
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 64,
                width: 40,
                child: TextFormField(
                  controller: otp3,
                  onSaved: (pin3) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the border radius as needed
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Adjust the border color as needed
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 64,
                width: 40,
                child: TextFormField(
                  controller: otp4,
                  onSaved: (pin4) {},
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the border radius as needed
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Adjust the border color as needed
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 64,
                width: 40,
                child: TextFormField(
                  controller: otp5,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the border radius as needed
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Adjust the border color as needed
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 64,
                width: 40,
                child: TextFormField(
                  controller: otp6,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          8), // Adjust the border radius as needed
                      borderSide: BorderSide(
                          color:
                              Colors.grey), // Adjust the border color as needed
                    ),
                  ),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          )),
          SizedBox(
            height: 20,
          ),
          Consumer<PhoneValProvider>(builder: (context, loadingCheck, child) {
                _loading = loadingCheck.checkLoading;
                return LoginButton(
              loading: _loading,
              title: "Verify",
              color: Colors.white,
              backgroundColor: Colors.redAccent,
              onTap: () async {
                loadingCheck.loading(true);
                String? otp = otp1.text +
                    otp2.text +
                    otp3.text +
                    otp4.text +
                    otp5.text +
                    otp6.text;

                final credential = PhoneAuthProvider.credential(
                    verificationId: data['verificationID'], smsCode: otp);
                try {
                  await auth.signInWithCredential(credential);
                  loadingCheck.loading(false);
                  Navigator.pushReplacementNamed(context, RoutesName.bottomMenu);
                } on FirebaseAuthException catch (ex) {
                  loadingCheck.loading(false);
                  Utils.toastMessages(ex.message.toString());
                }
              },
            );
          }),
        ],
      )),
    );
  }
}
