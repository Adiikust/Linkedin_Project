import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lorem_ipsum/Provider/allpostprovider.dart';
import 'package:lorem_ipsum/Utils/appcontant.dart';
import 'package:provider/provider.dart';
import '../../My_Widgets/button_widgets.dart';
import '../../My_Widgets/textfield_widgets.dart';
import '../../Utils/AppColors.dart';
import '../AllPost_Profile/App&Profile_View.dart';
import '../AllPost_Profile/Profile_Screen/porfile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidepwd = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var data;

  Future<void> getUserData() async {
    final response =
        // https://api.chucknorris.io/jokes/categories
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      for (int i = 0; i < response.body.length; i++) {
        if (emailController.text == data[i]['email']) {
          AppConstant.currentUserID = data[i]['id'];
          print("user ID " + AppConstant.currentUserID.toString());
          AppConstant.flutterToastSuccess(responseMessage: "User Successfully LogIn");
          Get.to(() => AppPostScreen());
        }else{
          AppConstant.flutterToastError(responseMessage: "User Not Found ");
        }
      }
      print(data.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 150.h,
              ),
              Image.asset('assets/images/lorem.jpg'),
              SizedBox(height: 20.h),
              MyWidget(
                visiable: false,
                widthC: double.infinity,
                heightC: 60,
                Htitle: 'Email',
                txtController: emailController,
              ),
              SizedBox(height: 20.h),
              MyWidget(
                txtController: passwordController,
                widthC: double.infinity,
                heightC: 60,
                visiable: hidepwd,
                Htitle: 'Password',
                icon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      hidepwd ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black12,
                    )),
              ),
              SizedBox(height: 20.h),
              Consumer<AllPostProvider>(builder: (context, provider, child) {
                return Button(
                  onpress: () {
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      getUserData();
                    }else{
                      AppConstant.flutterToastError(responseMessage: "please enter email and password");
                    }

                    // provider.getAllPost();
                    // Get.to(()=> AppPostScreen());
                    // Get.to(AppPostScreen());
                  },
                  radius1: 25,
                  width1: double.infinity,
                  height1: 60,
                  buttontext: 'Log In',
                  buttontextcolor: Colors.white,
                  buttoncolor: AppColors.primarycolor,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    hidepwd = !hidepwd;
    setState(() {});
  }
}
