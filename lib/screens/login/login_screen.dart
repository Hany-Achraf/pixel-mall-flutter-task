import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_mall_flutter_task/custom/custom_bottom_navbar.dart';
import 'package:pixel_mall_flutter_task/screens/finance/finance_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'components/auth_social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late bool _validateUsername;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _usernameController.text = 'johndoe@example.com';
    _passwordController.text = '12345678';
    _validateUsername = _isValidUsername(_usernameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFEFF1F5),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 82.h),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 171.w,
                  ),
                  child: Text(
                    'Login to Organize Pro',
                    style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing, lorem ipsum dolorsed diam nonumy amet eirmod.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 46.h,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4.w, 0.h, 0.h, 1.h),
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF171930).withOpacity(0.39),
                    ),
                  ),
                ),
                Material(
                  elevation: 2.r,
                  borderRadius: BorderRadius.circular(8.r),
                  child: TextFormField(
                    controller: _usernameController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: 'Enter your username...',
                      hintStyle: TextStyle(fontSize: 16.sp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      suffixIcon: _isValidUsername(_usernameController.text)
                          ? ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) =>
                                  const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // stops: [.5, 1],
                                colors: [
                                  Color(0xFFFFC92C),
                                  Color(0xFFFD9371),
                                ],
                              ).createShader(bounds),
                              child: Icon(
                                Icons.check,
                                size: 24.sp,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(4.w, 0.h, 0.h, 1.h),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF171930).withOpacity(0.39),
                    ),
                  ),
                ),
                Material(
                  elevation: 2.r,
                  borderRadius: BorderRadius.circular(8.r),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    style: TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                      hintText: 'Enter your password...',
                      hintStyle: TextStyle(fontSize: 16.sp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 24.sp,
                          color: const Color(0xFF171930),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // width: 144.w,
                        height: 1.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFF171930).withOpacity(0.1)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        // width: 144.w,
                        height: 1.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFF171930).withOpacity(0.1)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    // Expanded(
                    //   child: SizedBox(
                    //     width: double.infinity,
                    //     height: 44.h,
                    //     child: ElevatedButton(
                    //       onPressed: () {},
                    //       style: ElevatedButton.styleFrom(
                    //         elevation: 0,
                    //         backgroundColor: const Color(0xFF535566),
                    //         foregroundColor: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8.r),
                    //         ),
                    //       ),
                    //       child: Icon(Icons.apple, size: 28.sp),
                    //     ),
                    //   ),
                    // ),
                    const Expanded(
                      child: AuthSocialButton(
                        iconPath: 'assets/icons/apple.svg',
                        backgroundColor: Color(0xFF535566),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    const Expanded(
                      child: AuthSocialButton(
                        iconPath: 'assets/icons/facebook.svg',
                        backgroundColor: Color(0xFF3B5998),
                      ),
                    ),
                    SizedBox(width: 18.w),
                    const Expanded(
                      child: AuthSocialButton(
                        iconPath: 'assets/icons/twitter.svg',
                        backgroundColor: Color(0xFF4385F4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF171930).withOpacity(0.4),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 79.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FinanceScreen(),
                      ),
                    );
                    Provider.of<BottomNavbarIndexProvider>(context,
                            listen: false)
                        .changeIndex(index: 3);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 52.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.1, 0.9],
                        colors: [
                          Color(0xFF266ED7),
                          Color(0xFF4D8AEB),
                        ],
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 17.h),
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'I’m a new user. Registration',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF171930).withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isValidUsername(
    String email,
  ) {
    final RegExp regex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    return regex.hasMatch(email);
  }
}
