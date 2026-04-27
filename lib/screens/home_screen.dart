import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import 'skill_screen.dart';
import 'sprint_tracker.dart';
import 'wallet_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const JobsScreen(),
    const SkillScreen(),
    const SprintScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  final List<String> _titles = [
    "Explore Gigs",
    "SkillScore",
    "Sprint",
    "Wallet",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            // 🔥 LOGO
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset('assets/icon.png', height: 26),
            ),

            const SizedBox(width: 10),

            // 🔹 Title
            Text(
              _titles[_currentIndex],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),

      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_currentIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Skills"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Sprint"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEligible = skillData["Flutter"]! > 50;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: gigs.length,
      itemBuilder: (context, index) {
        final gig = gigs[index];

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF8E7CFF)],
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Title
              Text(
                gig["title"].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              // 🔹 Reward + Deadline
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "💰 ${gig["reward"]}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    "⏳ ${gig["deadline"]}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // 🔹 Apply Button (Smart Logic)
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  ),

                  onPressed: () {
                    if (isEligible) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Applied Successfully 🚀"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Learn more Flutter to unlock this job",
                          ),
                        ),
                      );
                    }
                  },

                  child: Text(isEligible ? "Apply" : "Locked"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
