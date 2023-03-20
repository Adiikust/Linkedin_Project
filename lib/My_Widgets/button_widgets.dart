import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  var buttontext;
  var buttoncolor;
  var buttontextcolor;
  Function() onpress;
  double height1;
  double width1;
  double radius1;

  Button(
      {Key? key,
      required this.height1,
      required this.width1,
      required this.radius1,
      this.buttontext,
      this.buttoncolor,
      this.buttontextcolor,
      required this.onpress,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height1.h,
      width: width1.w,
      child: TextButton(
        onPressed: onpress,
        style: ElevatedButton.styleFrom(
          primary: buttoncolor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius1),
              side: const BorderSide(
                color: Colors.transparent,
              )),
          // elevation: 15.0,
        ),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 16, color: buttontextcolor),
        ),
      ),
    );
  }
}
