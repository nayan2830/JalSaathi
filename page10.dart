import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpdateProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update your profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.water,
                size: 60,
                color: Colors.grey,
              ), // Profile icon or placeholder
            ),
            SizedBox(height: 20),
            // Full Name Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15), // Increased size
              ),
            ),
            SizedBox(height: 20),
            // Location Details Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Location Details',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15), // Increased size
              ),
            ),
            SizedBox(height: 20),
            // Contact Number Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15), // Increased size
              ),
            ),
            SizedBox(height: 20),
            // Select Payment Method Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Payment Method',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 15), // Increased size
              ),
              items: <String>['Credit Card', 'PayPal', 'Bank Transfer']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle change
              },
            ),
            SizedBox(height: 30),
            // Save Changes Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save changes
                },
                child: Text('Save Changes'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20), // Increased button height
                  backgroundColor: Colors.blue, // Button color
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Water',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,  // Set the selected icon color to black
        unselectedItemColor: Colors.black, // Set the unselected icons color to black
        onTap: _onItemTapped,
      ),
    );
  }
}