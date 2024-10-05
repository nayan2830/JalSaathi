import 'package:flutter/material.dart';
import 'mapscreen.dart';
import 'main.dart';

void main() => runApp(SmartAssetManagementApp());

class SmartAssetManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Asset Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _showLifecycleTracking = false; // Control lifecycle tracking visibility
  bool _showMaintenanceAlerts = false; // Control maintenance alerts visibility
  List<int> _selectedAssets = []; // Track selected assets for background color change

  // Asset data for lifecycle tracking
  final List<Map<String, String>> _assetLifecycleData = [
    {'name': 'Pump A', 'installDate': '2020-01-12', 'maintenanceDate': '2023-03-21'},
    {'name': 'Pump B', 'installDate': '2019-05-14', 'maintenanceDate': '2022-11-10'},
    {'name': 'Valve X', 'installDate': '2021-08-30', 'maintenanceDate': '2023-02-22'},
    {'name': 'Pipeline P1', 'installDate': '2018-03-19', 'maintenanceDate': '2022-10-13'},
    {'name': 'Pipeline P2', 'installDate': '2017-11-04', 'maintenanceDate': '2021-09-30'},
    {'name': 'Valve Y', 'installDate': '2020-06-10', 'maintenanceDate': '2022-12-20'},
    {'name': 'Pump C', 'installDate': '2019-09-05', 'maintenanceDate': '2023-04-12'},
  ];

  // Example maintenance alert data
  final List<Map<String, String>> _maintenanceAlerts = [
    {'alert': 'Pump A requires immediate inspection.', 'date': '2024-09-20'},
    {'alert': 'Valve X has been flagged for maintenance.', 'date': '2024-09-18'},
    {'alert': 'Pump C is overdue for maintenance.', 'date': '2024-09-15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Asset Management System'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(), // You can add a navigation drawer if needed
      body: Container(
        color: Colors.lightBlue[50], // Set the background color to light blue
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Smart Asset Overview',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // Smart Inventory Overview Buttons (sub-pages)
                  SmartFeatureButton(
                    title: 'Real-time Asset Mapping',
                    onTap: () {
                      // Navigate to real-time asset mapping
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AssetMapScreen()),
                      );
                    },
                  ),
                  SmartFeatureButton(
                    title: 'Asset Lifecycle Tracking',
                    onTap: () {
                      // Toggle visibility of lifecycle tracking assets
                      setState(() {
                        _showLifecycleTracking = !_showLifecycleTracking;
                        _showMaintenanceAlerts = false; // Hide maintenance alerts
                      });
                    },
                  ),
                  SmartFeatureButton(
                    title: 'Predictive Maintenance Alerts',
                    onTap: () {
                      // Toggle visibility of maintenance alerts
                      setState(() {
                        _showMaintenanceAlerts = !_showMaintenanceAlerts;
                        _showLifecycleTracking = false; // Hide lifecycle tracking
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Smart Overview Section with Statuses
                  AssetStatusWidget(
                    assetType: 'Pumps',
                    status: '90% operational',
                    color: Colors.green,
                  ),
                  AssetStatusWidget(
                    assetType: 'Pipelines',
                    status: '70% operational',
                    color: Colors.orange,
                  ),
                  AssetStatusWidget(
                    assetType: 'Valves',
                    status: '40% operational',
                    color: Colors.red,
                  ),
                  if (_showLifecycleTracking) ...[
                    SizedBox(height: 20),
                    Text(
                      'Asset Lifecycle Tracking',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _assetLifecycleData.length,
                        itemBuilder: (context, index) {
                          final asset = _assetLifecycleData[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_selectedAssets.contains(index)) {
                                  _selectedAssets.remove(index);
                                } else {
                                  _selectedAssets.add(index);
                                }
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: _selectedAssets.contains(index)
                                    ? Colors.blue[100]
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // Shadow position
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    asset['name']!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Installed: ${asset['installDate']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    'Last Maintenance: ${asset['maintenanceDate']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ] else if (_showMaintenanceAlerts) ...[
                    SizedBox(height: 20),
                    Text(
                      'Maintenance Alerts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _maintenanceAlerts.length,
                        itemBuilder: (context, index) {
                          final alert = _maintenanceAlerts[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  alert['alert']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Date: ${alert['date']}',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the dashboard page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()), // Go to your main.dart page (Dashboard)
                        (Route<dynamic> route) => false, // Remove all other routes
                  );
                },
                child: Text('Return to Dashboard'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '© 2024 Water Management. All Rights Reserved.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class SmartFeatureButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SmartFeatureButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AssetStatusWidget extends StatelessWidget {
  final String assetType;
  final String status;
  final Color color;

  const AssetStatusWidget({
    Key? key,
    required this.assetType,
    required this.status,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              assetType,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              status,
              style: TextStyle(fontSize: 16, color: color),
            ),
          ],
        ),
      ),
    );
  }
}