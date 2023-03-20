import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lorem_ipsum/Utils/AppColors.dart';

class MyWidget extends StatelessWidget {
  final String? Htitle;
  TextEditingController txtController;
  final Widget? icon;
  double widthC;
  double heightC;
  bool? visiable;

  MyWidget({
    Key? key,
    this.icon,
    this.Htitle,
    required this.txtController,
    required this.widthC,
    required this.heightC,
    this.visiable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightC.h,
      width: widthC.w,
      decoration: BoxDecoration(
        color:  Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(4.r)),
      ),
      child: TextFormField(
        //keyboardType: TextInputType.
        obscureText: visiable!,
        controller: txtController,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: const BorderSide(
                  color: Colors.black12,
                )),
            focusedBorder: OutlineInputBorder(
                borderSide:
                const BorderSide(width: 0, color: Colors.transparent),
                borderRadius: BorderRadius.circular(8.r)),
            hintText: Htitle,
            suffixIcon: icon,
            fillColor: Colors.black12,
            filled: true,
            hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            contentPadding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h)),
      ),
    );
  }
}
