import 'package:bwv2/pages/homepage/homepage.dart';
import 'package:bwv2/pages/profile_page/profile_page.dart';
import 'package:bwv2/pages/submit_page/submit_page.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ParentPage extends StatefulWidget {
  const ParentPage({super.key});

  @override
  State<ParentPage> createState() => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Buzzwords",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        primary: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          currentPage == 0
              ? Homepage()
              : currentPage == 1
                  ? SubmitPage()
                  : ProfilePage(),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentPage == 0 ? Icons.home : Icons.home_outlined,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentPage == 1 ? Icons.edit : Icons.edit_outlined,
            ),
            label: "Submit",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentPage == 2 ? Icons.person : Ionicons.person_outline,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
