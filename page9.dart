import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,  // Set background color to white
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,  // White app bar background
          iconTheme: IconThemeData(color: Colors.black),  // Black app bar icons
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;  // Track the currently selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;  // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // To hide the back arrow
        elevation: 0, // Remove shadow below the app bar
        backgroundColor: Colors.white, // App bar background color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Current Water Usage Status',
              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.person, // Human icon
              color: Colors.black,
              size: 28,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],  // Light grey for input background
                  hintText: 'Enter meter reading',
                  hintStyle: TextStyle(color: Colors.grey[600]),  // Darker grey for hint text
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Bill payment section
              Text(
                'Bill payment',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),  // Black text
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],  // Light grey container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pay now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('Water bill due soon\nNext bill: July 15', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],  // Light grey container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Request service', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('Leak repair\nReport issue with water', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // News & Alerts section
              Text(
                'News & Alerts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),  // Black text
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // Grey background for icons
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.home, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text('Home', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // Grey background for icons
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.visibility, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text('View', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // Grey background for icons
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.check, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text('Check', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // Grey background for icons
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.location_on, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text('Locate', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],  // Grey background for icons
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.explore, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text('Explore', style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Map integration section
              Text(
                'Map integration',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),  // Black text
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],  // Light grey container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Explore map', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('Find water resources', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],  // Light grey container
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('View now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('Water-related data', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
            label: 'Noti.',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,  // Black color for selected icons
        unselectedItemColor: Colors.grey[600],  // Grey color for unselected icons
        onTap: _onItemTapped,
      ),
    );
  }
}
