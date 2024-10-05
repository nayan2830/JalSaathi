import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SectionHeader(title: 'Daily usage'),
            NotificationTile(
              icon: Icons.coffee,
              title: 'Service update: Pipe',
              subtitle: 'Beni',
              hasAction: true,
            ),
            SectionHeader(title: 'This month'),
            NotificationTile(
              icon: Icons.home_repair_service,
              title: 'Service request: Repair',
              subtitle: 'Service',
            ),
            NotificationTile(
              icon: Icons.water_damage,
              title: 'Service request: Leak',
              subtitle: 'Service',
            ),
            SectionHeader(title: 'Yesterday'),
            NotificationTile(
              icon: Icons.filter,
              title: 'Service update: Filter',
              subtitle: 'Service',
            ),
            NotificationTile(
              icon: Icons.water,
              title: 'Service request: Water quality',
              subtitle: 'Service',
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

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool hasAction;

  const NotificationTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.hasAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: hasAction
          ? ElevatedButton(
        onPressed: () {},
        child: Text('View details'),
      )
          : null,
    );
  }
}