
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({Key? key, required this.title,  this.loading = false, required this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Center(child: loading ? Container( width: 20, height: 20,child: CircularProgressIndicator( strokeWidth: 2.0,color: Colors.white, )) : Text(title, style: TextStyle(
              color: Colors.white
            ),))),
    );
  }
}
