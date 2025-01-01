import 'package:flutter/material.dart';

class PhotographersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Photographers'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView.builder(
        itemCount: 5, // Example count
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueGrey.shade800,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                'Photographer ${index + 1}',
                style: TextStyle(color: Colors.white),
              ),
              trailing: Icon(Icons.arrow_forward, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotographerDetailsPage(
                        photographerName: 'Photographer ${index + 1}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PhotographerDetailsPage extends StatelessWidget {
  final String photographerName;

  PhotographerDetailsPage({required this.photographerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(photographerName),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to $photographerName\'s Page',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to portfolio
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255)),
              child: Text('View Portfolio'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to booking
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 253, 253, 253)),
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
