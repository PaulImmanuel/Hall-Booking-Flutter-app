// lib/screens/bookings_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting the date
import '../data/dummy_data.dart'; // To get our fake bookings
import '../models/booking_model.dart'; // To understand what a booking is
import '../main.dart'; // To get kPrimaryColor

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // For now, we'll just display our dummyBookings list.
    final List<Booking> upcomingBookings = dummyBookings;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: upcomingBookings.length,
        itemBuilder: (context, index) {
          final booking = upcomingBookings[index];
          return _BookingCard(booking: booking);
        },
      ),
    );
  }
}

// --- A new, custom card widget for the Bookings page ---
class _BookingCard extends StatelessWidget {
  final Booking booking;
  const _BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Hall Info ---
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    booking.hall.imagePath,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.hall.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.hall.location,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            // --- Date & Time Info ---
            _buildInfoRow(
              icon: Icons.calendar_today_outlined,
              label: "Date",
              // Format the date nicely
              value: DateFormat('MMMM dd, yyyy').format(booking.date),
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.access_time_outlined,
              label: "Time Slot",
              value: booking.timeSlot,
            ),
            const SizedBox(height: 12),
            _buildInfoRow(
              icon: Icons.currency_rupee,
              label: "Paid",
              value: "₹${booking.amountPaid.toInt()} (${booking.paymentStatus})",
            ),
            const SizedBox(height: 16),
            // --- Buttons ---
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("View Details"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    // Red color for "Cancel"
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // A helper widget for the info rows
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: kPrimaryColor),
        const SizedBox(width: 8),
        Text(
          "$label:",
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}