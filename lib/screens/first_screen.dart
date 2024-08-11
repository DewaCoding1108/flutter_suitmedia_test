import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/palindrome_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {
  final PalindromeController palindromeController =
      Get.put(PalindromeController());
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode palindromeFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose of the FocusNode when it's no longer needed
    nameFocusNode.dispose();
    palindromeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        nameFocusNode.unfocus();
        palindromeFocusNode.unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 142),
                      Image.asset(
                        'assets/images/ic_photo.png',
                        width: 116,
                        height: 116,
                      ),
                      const SizedBox(height: 58.12),
                      TextField(
                        focusNode: nameFocusNode,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 8.0, bottom: 8.0),
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0x6867775C)),
                          hintText: 'Name',
                        ),
                        onChanged: (value) {
                          setState(() {
                            palindromeController.name.value = value;
                          });
                        },
                      ),
                      const SizedBox(height: 22.12),
                      TextField(
                        focusNode: palindromeFocusNode,
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, top: 8.0, bottom: 8.0),
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0x6867775C)),
                          hintText: 'Palindrome',
                        ),
                        onChanged: (value) {
                          setState(() {
                            palindromeController.sentence.value = value;
                          });
                        },
                      ),
                      const SizedBox(height: 45),
                      ElevatedButton(
                        onPressed: () {
                          nameFocusNode.unfocus();
                          palindromeFocusNode.unfocus();
                          if (palindromeController.sentence.value.trim() ==
                              '') {
                            Get.defaultDialog(
                              title: 'Palindrome Input Invalid',
                              middleText: 'Please input the palindrome value',
                            );
                          } else {
                            bool result = palindromeController.isPalindrome(
                                palindromeController.sentence.value);
                            Get.defaultDialog(
                              title: 'Palindrome Check',
                              middleText:
                                  result ? 'isPalindrome' : 'not palindrome',
                            );
                          }
                        },
                        child: Text(
                          style: Theme.of(context).textTheme.displaySmall,
                          'CHECK',
                        ),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          nameFocusNode.unfocus();
                          palindromeFocusNode.unfocus();
                          FocusScope.of(context).unfocus();
                          if (palindromeController.name.value.trim() == '') {
                            Get.defaultDialog(
                              title: 'Name Input Invalid',
                              middleText: 'Please input the name value',
                            );
                          } else {
                            Get.toNamed('/second', arguments: {
                              'name': palindromeController.name.value
                            });
                          }
                        },
                        child: Text(
                          style: Theme.of(context).textTheme.displaySmall,
                          'NEXT',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
