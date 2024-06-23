import 'package:dio/dio.dart';
import 'package:final_project_mikti/final_project/repository/ProductRepository.dart';
import 'package:final_project_mikti/final_project/service/api_service.dart';
import 'package:final_project_mikti/final_project/ui/auth/Screens/Login/auth_login/auth_login.dart';
import 'package:final_project_mikti/final_project/ui/auth/Screens/Welcome/welcome_screen.dart';
import 'package:final_project_mikti/final_project/ui/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import '../model/product.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ProductRepository productRepository;
  late Future<List<Product>> productsFuture;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    final apiService = ApiService(dio);
    productRepository = ProductRepository(apiService);
    productsFuture = productRepository.fetchProducts();

    _pages = [
      HomeScreen(productsFuture: productsFuture, productRepository: productRepository),
      const ProfileScreen(),
    ];
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('JB Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              AuthLogin auth = AuthLogin();
              await auth.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
