// Copyright (c) 2022 Razeware LLC
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended or marketed for pedagogical
// or instructional purposes related to programming, coding, application
// development, or information technology.  Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing, creation of
// derivative works or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import '../router/book_pages.dart';
import 'package:flutter/material.dart';

import '../helpers/helper_function.dart';
import '../widgets/common_text_field.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/primary_button.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
    static MaterialPage page() {
    return MaterialPage<Page>(
      name: BookPages.signupPath,
      key: ValueKey(BookPages.signupPath),
      child: const SignupScreen(),
    );
  }
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final HelperFunction _helperFunction = HelperFunction();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Sign Up', showIcon: false),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text('BOOKS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: ContinuousRectangleBorder(
                        side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Image.asset(
                        'images/books.png',
                        width: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )),
                const SizedBox(
                  height: 100,
                ),
                CommonTextField(
                    emailTextController: emailTextEditingController,
                    hintText: 'Email',
                    icon: Icons.email,
                    isObscure: false),
                CommonTextField(
                    emailTextController: passwordTextEditingController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    isObscure: true),
                PrimaryButton(
                    width: 300,
                    title: 'Login In',
                    onPressed: () {
                      _helperFunction.navigateToPage(
                          context, const HomeScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
