import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../tasks/tasks_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const TasksScreen()),
          );
        },

        child: const Icon(Icons.add),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text("Good Evening 👋", style: AppTextStyles.bodyMedium),

              const SizedBox(height: 6),

              Text("Bhumesh", style: AppTextStyles.heading1),

              const SizedBox(height: 30),

              // Stats Cards
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      title: "Tasks",
                      count: "04",
                      icon: Icons.check_circle_outline,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: _buildStatCard(
                      title: "Documents",
                      count: "02",
                      icon: Icons.folder_outlined,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Reminder Title
              Text("Upcoming Reminders", style: AppTextStyles.heading3),

              const SizedBox(height: 16),

              // Reminder List
              Expanded(
                child: ListView(
                  children: [
                    _buildReminderCard(
                      title: "Passport Renewal",
                      subtitle: "Expires in 10 days",
                      icon: Icons.credit_card,
                    ),

                    const SizedBox(height: 16),

                    _buildReminderCard(
                      title: "Electricity Bill",
                      subtitle: "Due Tomorrow",
                      icon: Icons.bolt,
                    ),

                    const SizedBox(height: 16),

                    _buildReminderCard(
                      title: "Netflix Subscription",
                      subtitle: "Renews on 30 May",
                      icon: Icons.subscriptions,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String count,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 30),

          const SizedBox(height: 20),

          Text(count, style: AppTextStyles.heading2),

          const SizedBox(height: 4),

          Text(title, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildReminderCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(icon, color: AppColors.primary),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.bodyLarge),

                const SizedBox(height: 4),

                Text(subtitle, style: AppTextStyles.small),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
