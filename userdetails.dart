import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Primary theme color
        brightness: Brightness.light, // Light theme
        scaffoldBackgroundColor: Colors.white, // White background
        cardColor: Colors.grey[200], // Light color for the cards
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          elevation: 1, // Slight shadow for the app bar
        ),
        bottomAppBarTheme: BottomAppBarTheme( // Corrected: Use BottomAppBarTheme
          color: Colors.white, // White color for BottomAppBar
        ),
      ),
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle drawer or menu action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_picture.jpg'), // Placeholder image path
            ),
            SizedBox(height: 16),
            Text(
              'Edit Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ProfileOptionTile(
              title: 'My Details',
              onTap: () {
                // Handle My Details action
              },
            ),
            ProfileOptionTile(
              title: 'Meter Number',
              onTap: () {
                // Handle Meter Number action
              },
            ),
            ProfileOptionTile(
              title: 'Payment Methods',
              onTap: () {
                // Handle Payment Methods action
              },
            ),
            ProfileOptionTile(
              title: 'Notification Settings',
              onTap: () {
                // Handle Notification Settings action
              },
            ),
            SizedBox(height: 20),
            ProfileOptionTile(
              title: 'Help & Support',
              onTap: () {
                // Handle Help & Support action
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOptionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileOptionTile({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
