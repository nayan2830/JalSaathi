import 'package:flutter/material.dart';
import 'financialmanagement.dart';
import 'consumablemanagement.dart';
import 'smartassetmanagement.dart';
import 'helpandsupport.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainComponent(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainComponent extends StatefulWidget {
  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  bool menuVisible = false;
  bool profileVisible = false;

  void toggleMenu() {
    setState(() {
      menuVisible = !menuVisible;
    });
  }

  void toggleProfile() {
    setState(() {
      profileVisible = !profileVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jal Jeevan Mission Management System',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue.shade600,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, size: 28),
            onPressed: toggleProfile,
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.menu, size: 28),
          onPressed: toggleMenu,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview', style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 16),

                    // Use Expanded inside Flexible to avoid overflow
                    SizedBox(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
                          double childAspectRatio = constraints.maxWidth < 600 ? 3 / 2 : 4 / 2;

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: childAspectRatio,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              switch (index) {
                                case 0:
                                  return buildMetricTile('Total Assets', '5,432', Icons.storage);
                                case 1:
                                  return buildMetricTile('Inventory Items', '1,234', Icons.inventory);
                                case 2:
                                  return buildMetricTile('Financial Health', 'Good', Icons.favorite);
                                case 3:
                                  return buildMetricTile('Community Activities', '78', Icons.people);
                                default:
                                  return Container(); // Fallback
                              }
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16),
                    Text('Main Sections', style: Theme.of(context).textTheme.titleLarge),
                    SizedBox(height: 16),

                    // Main sections buttons
                    SizedBox(
                      height: screenHeight * 0.4,
                      child: GridView.count(
                        crossAxisCount: (screenWidth < 600) ? 2 : 4, // Responsive cross axis count
                        children: [
                          buildSectionButton('Smart Asset Management', Icons.settings, context),
                          buildSectionButton('Consumable Management', Icons.inventory, context),
                          buildSectionButton('Financial Management', Icons.attach_money, context),
                          buildSectionButton('Data Analytics', Icons.bar_chart, context),
                          buildSectionButton('Settings', Icons.settings_applications, context),
                          buildSectionButton('Help and Support', Icons.help, context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu overlay
            if (menuVisible)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 250,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: toggleMenu,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Profile overlay
            if (profileVisible)
              Positioned(
                top: 80,
                right: 16,
                child: Material(
                  elevation: 8,
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('User ID: exampleID'),
                        Text('Position: examplePosition'),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text('Log Out'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade600,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            '© 2024 Jal Jeevan Mission. All rights reserved.',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildMetricTile(String label, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue, size: 40),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: TextStyle(fontSize: 16)),
                  Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionButton(String title, IconData icon, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          if (title == 'Financial Management') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          } else if (title == 'Consumable Management') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => JalJeevanMissionApp()),
            );
          } else if (title == 'Smart Asset Management') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SmartAssetManagementApp()),
            );
          } else if (title == 'Help and Support') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpAndSupport()),
            );
          } else {
            print('$title tapped');
          }
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.blue),
              SizedBox(height: 8),
              Text(title, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
