import 'package:flutter/material.dart';
import 'package:foodiego/core/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account Settings', style: AppTextStyles.heading1,),
              Text('Update your settings like notifications, payments, profile edit etc.', style: AppTextStyles.caption,),
            ],
          ),
        ),
      ),
    );
  }
}
