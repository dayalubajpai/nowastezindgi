import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:nowaste_zindagi/res/components/buttonComponent/loginButton.dart';
import 'package:nowaste_zindagi/res/components/textStyle.dart';
import 'package:nowaste_zindagi/utils/routes/routes_name.dart';
import 'package:nowaste_zindagi/utils/utils.dart';
import 'package:nowaste_zindagi/view_model/validation_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends HookWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context)  {
    final isPhoneButtonTapped = useState<bool>(false);
    final _user =  _auth.currentUser;
    return SafeArea(
      child: Scaffold(
        body: isPhoneButtonTapped.value
            ? PhoneAuth(
                onPhoneButtonTap: () => isPhoneButtonTapped.value = false)
            : WelcomeScreen(
                onPhoneButtonTap: () => isPhoneButtonTapped.value = true),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onPhoneButtonTap;

  WelcomeScreen({Key? key, required this.onPhoneButtonTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            orientation == Orientation.landscape
                ? const SizedBox(height: 40.0)
                : const SizedBox.shrink(),
            const Text(
              'Welcome to App',
              style: TextStyles.heading,
            ),
            const SizedBox(
              height: 30,
            ),
            LoginButton(
              loading: false,
              title: 'Continue with Phone',
              onTap: onPhoneButtonTap,
              color: const Color(0xFF001906),
              borderColor: const Color(0xFFefefef),
              image:
                  'assets/img/phone.png',
            ),
             LoginButton(
               loading: false,
              title: 'Continue with Google',
              onTap: (){
                 Utils.toastMessages('Coming Soon Try with Continue with Phone');
              },
              color: Color(0xFF001906),
              borderColor: Color(0xFFefefef),
              image:
                  'assets/img/google-logo.png',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Or',
              style: TextStyles.smallText,
            ),
            const SizedBox(
              height: 5,
            ),
             LoginButton(
               loading: false,
              title: 'Continue as Guest',
              onTap: (){
                Utils.toastMessages('Coming Soon Try with Continue with Phone');
              },
              color: Color(0xFF001906),
              borderColor: Color(0xFFefefef),
              backgroundColor: Color(0xFFF8F8F8),
            ),
          ],
        ),
      ),
    );
  }
}

class PhoneAuth extends StatelessWidget {
  final VoidCallback onPhoneButtonTap;

  PhoneAuth({required this.onPhoneButtonTap});
  TextEditingController _phoneController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? _verificationID;

  @override
  Widget build(BuildContext context) {
    var _loading = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //phone login screen
        GestureDetector(
          onTap: onPhoneButtonTap,
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
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          child: Consumer<PhoneValProvider>(
              builder: (context, phoneValProvider, _) {
                return TextFormField(
            controller: _phoneController,
            onChanged: (val){
                      if(_phoneController.text.toString().length == 10){
                       phoneValProvider.setPhoneCheck(true);
                      }else {
                        phoneValProvider.setPhoneCheck(false);
                      }
            },
            decoration:  InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.black54),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: phoneValProvider.phoneCheck ? Colors.green : Colors.red ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              prefixIcon: Icon(Icons.phone),
              prefixIconColor: Colors.black54,
              hintText: 'Phone Number',
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              FilteringTextInputFormatter.digitsOnly
            ],
            validator: (value) => value!.isEmpty ? 'Email cannot be blank' : null,
          );}),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Consumer<PhoneValProvider>(builder: (context, loadingCheck, child){
          _loading = loadingCheck.checkLoading;
          return  LoginButton(
            loading: _loading,
            title: "Submit",
            onTap: (){
              loadingCheck.loading(true);
              auth.verifyPhoneNumber(
                  phoneNumber: "+91${ _phoneController.text}",
                  verificationCompleted: (_){},
                  verificationFailed: (error){
                    loadingCheck.loading(false);
                    String _error = error.message.toString();
                    if(error.code == "too-many-requests"){
                      Utils.toastMessages('To Many Request');
                    }if(error.code == "invalid-phone-number"){
                      Utils.toastMessages('Phone Number Invalid');
                    }else{
                      Utils.toastMessages(_error.toString());
                    }
                  },
                  codeSent: (String verificationID, int? tokenID){
                    Utils.toastMessages('OTP Sent');
                    _verificationID = verificationID;
                    loadingCheck.loading(false);
                    Navigator.pushReplacementNamed(context, RoutesName.otp, arguments: {'phoneNumber': _phoneController.text , 'verificationID' : _verificationID});
                  },
                  codeAutoRetrievalTimeout: (verificationID){
                    _verificationID = verificationID;
                  }
              );
            },
            color: Color(0xFFF6F6F6),
            backgroundColor: Color(0xFFF7444E),
            borderColor: Colors.transparent,
            fontWeight: FontWeight.w500,
          );
        })
        //phone login screen end
      ],
    );
  }
}
