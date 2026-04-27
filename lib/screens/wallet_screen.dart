import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔥 Balance Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),

            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00C9A7), Color(0xFF92FE9D)],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Escrow Balance", style: TextStyle(color: Colors.white70)),
                SizedBox(height: 10),
                Text(
                  "₹2,500",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text("Funds Secured ✅", style: TextStyle(color: Colors.white)),
                SizedBox(height: 4),
                Text(
                  "Releases in 3 days",
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // 🔹 Section Title
          const Text(
            "Payment Progress",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // 🔥 Progress Card
          Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sprint Completion",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.6, // 60% progress
                    minHeight: 10,
                  ),
                ),

                const SizedBox(height: 10),

                const Text("60% Completed"),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // 🔹 Transaction History
          const Text(
            "Recent Activity",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 15),

          // 🔥 Activity List
          _buildActivity("Sprint Started", "₹2,500 Locked", Colors.blue),
          _buildActivity("Milestone Completed", "+₹1,500", Colors.green),
          _buildActivity("Pending Review", "In Progress", Colors.orange),
        ],
      ),
    );
  }

  // 🔥 Activity Tile
  Widget _buildActivity(String title, String subtitle, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),

      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(Icons.attach_money, color: color),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle),
            ],
          ),
        ],
      ),
    );
  }
}
