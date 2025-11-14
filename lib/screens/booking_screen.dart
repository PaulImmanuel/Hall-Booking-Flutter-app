// lib/screens/booking_screen.dart
import 'package:flutter/material.dart';
import 'package:hall_booking/main.dart';
import 'package:intl/intl.dart'; // We need this to format the date
import '../models/hall_model.dart';

// Enum to manage payment selection
enum PaymentOption { advance, full }

class BookingScreen extends StatefulWidget {
  final Hall hall;
  const BookingScreen({super.key, required this.hall});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // --- State Variables ---
  PaymentOption? _selectedPayment = PaymentOption.advance; // Default to advance
  
  // Services
  bool _cateringSelected = false;
  bool _djSelected = false;
  bool _carParkingSelected = false;
  bool _flowerDecorationSelected = false;

  // Date and Time
  DateTime? _selectedDate;
  String? _selectedTimeSlot;

  final List<String> _timeSlots = [
    'Morning (9AM - 1PM)',
    'Afternoon (2PM - 6PM)',
    'Evening (7PM - 11PM)'
  ];
  // ---

  // --- Function to show the Date Picker ---
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(), // User can't select past dates
      lastDate: DateTime(2101),
      builder: (context, child) {
        // Theme the date picker
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary:kPrimaryColor, // header background
              onPrimary: Colors.white, // header text
              onSurface: Colors.black, // body text
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
  // ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Your Hall"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Hall Info Header (NEW) ---
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              widget.hall.imagePath,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.hall.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.hall.location,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // --- Payment Option ---
                  _buildSectionTitle("Payment Option"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: _buildContainer(
                      Column(
                        children: [
                          RadioListTile<PaymentOption>(
                            title: const Text("Advance Payment"),
                            subtitle: const Text("Pay 50% now, 50% later"),
                            value: PaymentOption.advance,
                            groupValue: _selectedPayment,
                            onChanged: (PaymentOption? value) {
                              setState(() {
                                _selectedPayment = value;
                              });
                            },
                            activeColor: Colors.deepPurple,
                          ),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          RadioListTile<PaymentOption>(
                            title: const Text("Full Payment"),
                            subtitle: const Text("Pay 100% now"),
                            value: PaymentOption.full,
                            groupValue: _selectedPayment,
                            onChanged: (PaymentOption? value) {
                              setState(() {
                                _selectedPayment = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- Services (UPDATED) ---
                  _buildSectionTitle("Select Services"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: _buildContainer(
                      Column(
                        children: [
                          _buildCheckbox("Catering", "Veg and Non-Veg buffet", _cateringSelected, (val) {
                            setState(() => _cateringSelected = val);
                          }),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          _buildCheckbox("DJ Service", "Includes lights and sound", _djSelected, (val) {
                            setState(() => _djSelected = val);
                          }),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                          _buildCheckbox("Car Parking", "Valet service available", _carParkingSelected, (val) {
                            setState(() => _carParkingSelected = val);
                          }),
                          const Divider(height: 1, indent: 16, endIndent: 16),
                           _buildCheckbox("Flower Decoration", "Stage and hall decor", _flowerDecorationSelected, (val) {
                            setState(() => _flowerDecorationSelected = val);
                          }),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- Date (UPDATED) ---
                  _buildSectionTitle("Select Date"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      onTap: () => _selectDate(context), // Triggers calendar
                      child: _buildContainer(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              // Show selected date or prompt
                              _selectedDate == null
                                  ? "Select a date"
                                  : DateFormat('MMMM dd, yyyy').format(_selectedDate!),
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Icon(Icons.calendar_today_outlined,
                                color: Colors.deepPurple),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // --- Time Slots (NEW) ---
                  _buildSectionTitle("Select Time Slot"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Wrap(
                      spacing: 12.0,
                      runSpacing: 12.0,
                      children: _timeSlots.map((slot) {
                        final isSelected = _selectedTimeSlot == slot;
                        return ChoiceChip(
                          label: Text(slot),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              _selectedTimeSlot = selected ? slot : null;
                            });
                          },
                          selectedColor: kPrimaryColor,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: isSelected ? kPrimaryColor : Colors.grey.shade200
                            )
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24), // Extra space at bottom
                ],
              ),
            ),
          ),

          // --- Bottom "Proceed to Payment" Button ---
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 10,
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Payment button clicked! (Static)"),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Proceed to payment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  // Reusable CheckboxListTile
  Widget _buildCheckbox(String title, String subtitle, bool value, Function(bool) onChanged) {
    return CheckboxListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (bool? val) {
        onChanged(val ?? false);
      },
    );
  }

  // Reusable title widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Reusable container for sections
  Widget _buildContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.all(8.0), // Padding inside container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: child,
    );
  }
}