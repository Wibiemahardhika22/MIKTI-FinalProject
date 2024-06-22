import 'edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Nicky Fernando Pontonuwu';
  String username = 'kiboy';
  String facebook = 'nickyboy';
  String birthdate = '7 November 2002';
  String phone = '0838-7432-5235';
  String email = 'nickyfernando07@gmail.com';
  String address = 'Manado, Sulawesi Utara';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/kiboy.jpeg',
                width: 190,
                height: 190,
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.facebook,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  facebook,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cake,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  birthdate,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.place,
                  color: Colors.black,
                ),
                SizedBox(width: 5),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        name: name,
                        username: username,
                        facebook: facebook,
                        birthdate: birthdate,
                        phone: phone,
                        email: email,
                        address: address,
                      ),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      name = result['name'];
                      username = result['username'];
                      facebook = result['facebook'];
                      birthdate = result['birthdate'];
                      phone = result['phone'];
                      email = result['email'];
                      address = result['address'];
                    });
                  }
                },
                child: Text('Edit Profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}