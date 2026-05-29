import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final ValueChanged<bool?> onChanged;

  const TaskTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Checkbox(
            value: task.completed,
            onChanged: onChanged,

            activeColor: AppColors.primary,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              task.title,

              style: AppTextStyles.bodyLarge.copyWith(
                decoration: task.completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,

                color: task.completed
                    ? AppColors.textSecondary
                    : AppColors.textPrimary,
              ),
            ),
          ),

          IconButton(
            onPressed: onDelete,

            icon: const Icon(Icons.delete_outline, color: AppColors.error),
          ),
        ],
      ),
    );
  }
}
