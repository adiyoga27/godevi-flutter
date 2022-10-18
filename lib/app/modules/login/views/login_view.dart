import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:godevi/app/core/theme/app_theme.dart';
import 'package:godevi/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppTheme.getTheme().backgroundColor,
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: appBar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: getFTButton(),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: getFTButton(isFacebook: false),
                          ),
                          const SizedBox(
                            width: 24,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "or log in with email",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.getTheme().disabledColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.getTheme().backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(38)),
                          // border: Border.all(
                          //   color: HexColor("#757575").withOpacity(0.6),
                          // ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppTheme.getTheme().dividerColor,
                              blurRadius: 8,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SizedBox(
                            height: 48,
                            child: Center(
                              child: TextField(
                                maxLines: 1,
                                onChanged: (String txt) {},
                                style: const TextStyle(
                                  fontSize: 16,
                                  // color: AppTheme.dark_grey,
                                ),
                                cursorColor: AppTheme.getTheme().primaryColor,
                                decoration: InputDecoration(
                                  errorText: null,
                                  border: InputBorder.none,
                                  hintText: "Your Email",
                                  hintStyle: TextStyle(
                                      color: AppTheme.getTheme().disabledColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppTheme.getTheme().backgroundColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(38)),
                          // border: Border.all(
                          //   color: HexColor("#757575").withOpacity(0.6),
                          // ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppTheme.getTheme().dividerColor,
                              blurRadius: 8,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: SizedBox(
                            height: 48,
                            child: Center(
                              child: TextField(
                                maxLines: 1,
                                onChanged: (String txt) {},
                                style: const TextStyle(
                                  fontSize: 16,
                                  // color: AppTheme.dark_grey,
                                ),
                                cursorColor: AppTheme.getTheme().primaryColor,
                                decoration: InputDecoration(
                                  errorText: null,
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: AppTheme.getTheme().disabledColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, right: 16, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           ForgotPasswordScreen()),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Forgot your password?",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.getTheme().disabledColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 8, top: 8),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.getTheme().primaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: AppTheme.getTheme().dividerColor,
                              blurRadius: 8,
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24.0)),
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Get.toNamed(Routes.DASHBOARD);
                              // Navigator.pushAndRemoveUntil(context, Routes.SPLASH, (Route<dynamic> route) => false);
                              // Navigator.pushNamedAndRemoveUntil(
                              //     context,
                              //     Routes.TabScreen,
                              //     (Route<dynamic> route) => false);
                              // Navigator.pushReplacementNamed(context, Routes.TabScreen);
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getFTButton({bool isFacebook = true}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: HexColor(isFacebook ? "#3C5799" : "#dc4a38"),
        borderRadius: const BorderRadius.all(Radius.circular(24.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppTheme.getTheme().dividerColor,
            blurRadius: 8,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          highlightColor: Colors.transparent,
          onTap: () {},
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                    isFacebook
                        ? FontAwesomeIcons.facebookF
                        : FontAwesomeIcons.google,
                    size: 20,
                    color: Colors.white),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  isFacebook ? "Facebook" : "Twitter",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: AppBar().preferredSize.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: SizedBox(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Get.back();
                    // Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 4, left: 24),
          child: Text(
            "Log in",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
