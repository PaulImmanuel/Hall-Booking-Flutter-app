// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../data/dummy_data.dart'; // Import our fake data
import '../models/hall_model.dart'; // Import our model
import 'hall_details_screen.dart'; // We'll create this next
import '../main.dart'; // To access kPrimaryColor

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book My Hall",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar & Filter
              Row(
                children: [
                  // Search Bar
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search hall or location...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Filter Button
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Static, as requested
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.all(16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // "All Halls" Title
              const Text(
                "All Halls",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Hall List
              ListView.builder(
                itemCount: dummyHalls.length,
                shrinkWrap: true, // Tells ListView to be as tall as its content
                physics:
                    const NeverScrollableScrollPhysics(), // Disables scrolling inside the ListView
                itemBuilder: (context, index) {
                  final hall = dummyHalls[index];
                  return HallCard(
                    hall: hall,
                  ); // We'll build this widget
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A reusable widget for our Hall cards
class HallCard extends StatelessWidget {
  final Hall hall;
  const HallCard({super.key, required this.hall});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the Hall Details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HallDetailsScreen(hall: hall),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        elevation: 4,
        shadowColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hall Image
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                hall.imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            // Hall Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hall.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        hall.location,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        "₹${hall.price.toInt()} /day", // Format the price
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                      ),
                      // Rating
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            "${hall.rating} (${hall.reviewCount} reviews)",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}