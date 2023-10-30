import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gerenciaai/src/home/add_page/add_page.dart';
import 'package:gerenciaai/src/home/home_page/home_page.dart';
import 'package:gerenciaai/src/home/notas_page/notas_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const AddPage(),
    const NotasPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          height: 48,
          animationDuration: const Duration(milliseconds: 300),
          color: const Color(0xfff9a826),
          backgroundColor: const Color(0xffcb8a24),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.assignment_outlined,
              size: 30,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
