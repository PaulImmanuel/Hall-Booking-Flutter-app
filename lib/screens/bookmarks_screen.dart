// lib/screens/bookmarks_screen.dart
import 'package:flutter/material.dart';
import '../data/dummy_data.dart'; // To get our hall data
import '../models/hall_model.dart'; // To understand what a Hall is
import 'hall_details_screen.dart'; // To navigate to details
import '../main.dart'; // To get kPrimaryColor

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  // This is our FAKE list of bookmarked halls.
  // We'll just take the first two from the main list.
  late List<Hall> _bookmarkedHalls;

  @override
  void initState() {
    super.initState();
    // Initialize our list with two halls from the dummy data
    _bookmarkedHalls = [dummyHalls[1], dummyHalls[2]];
  }

  void _removeBookmark(Hall hall) {
    // This function will remove the hall from the list, with an animation.
    setState(() {
      _bookmarkedHalls.remove(hall);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${hall.name} removed from bookmarks."),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookmarks"),
      ),
      body: _bookmarkedHalls.isEmpty
          ? _buildEmptyState() // Show this if the list is empty
          : _buildBookmarkList(), // Show this if we have bookmarks
    );
  }

  // A widget for the list
  Widget _buildBookmarkList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _bookmarkedHalls.length,
      itemBuilder: (context, index) {
        final hall = _bookmarkedHalls[index];
        // We'll use a new custom card for this screen
        return _BookmarkCard(
          hall: hall,
          onRemove: () => _removeBookmark(hall),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HallDetailsScreen(hall: hall),
              ),
            );
          },
        );
      },
    );
  }

  // A widget for the "empty" message
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          const Text(
            "No Bookmarks Yet",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap the bookmark icon on a hall to save it here.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// --- A new, custom card widget for the Bookmarks page ---
class _BookmarkCard extends StatelessWidget {
  final Hall hall;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const _BookmarkCard({
    required this.hall,
    required this.onRemove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  hall.imagePath,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hall.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            hall.location,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "₹${hall.price.toInt()} /day",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              // Remove Icon Button
              IconButton(
                icon: const Icon(Icons.bookmark, color: kPrimaryColor),
                onPressed: onRemove,
                tooltip: "Remove bookmark",
              ),
            ],
          ),
        ),
      ),
    );
  }
}