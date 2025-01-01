import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key}); // Add const constructor

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20), // Add const here
            const Text(
              // Add const here
              'Welcome to PhotoMate IIUM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Add const here
            const Text(
              // Add const here
              'Explore photographers and manage your profile.',
              style: TextStyle(
                color: Colors.grey, // Simplified color
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20), // Add const here
            const Text(
              // Add const here
              'Featured Photographers',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Add const here
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16), // Add const here
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Photographer ${index + 1}',
                        style: const TextStyle(
                            color: Colors.white), // Add const here
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20), // Add const here
            const Text(
              // Add const here
              'Recent Photos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Add const here
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(), // Add const here
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // Add const here
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Photo ${index + 1}',
                      style: const TextStyle(
                          color: Colors.white), // Add const here
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
