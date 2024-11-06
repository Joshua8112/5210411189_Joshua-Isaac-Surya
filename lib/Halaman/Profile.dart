import 'package:flutter/material.dart';

// ProfileTile widget
class ProfileTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  ProfileTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}

// ProfileCard widget
class ProfileCard extends StatelessWidget {
  final String name; // Name of the user
  final String university; // University of the user
  final String imageProfile; // Profile image path

  const ProfileCard({
    Key? key,
    required this.name,
    required this.university,
    required this.imageProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Rounded image
            child: Image.asset(
              imageProfile,
              fit: BoxFit.cover,
              height: 100,
              width: 100,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(university,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

// EditProfile widget
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController emailController =
      TextEditingController(text: "Joshua@example.com");
  final TextEditingController nameController =
      TextEditingController(text: "Joshua");
  final TextEditingController phoneController =
      TextEditingController(text: "123456789");
  final TextEditingController addressController =
      TextEditingController(text: "Rumah Selokan");

  bool isEditMode = false; // Track whether we are in edit mode or view mode

  void _toggleEditMode() {
    setState(() {
      isEditMode = !isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileCard(
              name: "Joshua",
              university: "UTY",
              imageProfile: "lib/assets/contoh/fis.jpeg",
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context); // Navigates back to the previous screen
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back, size: 15, color: Colors.blue),
                      Text(' Kembali', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(
              label: 'Email',
              controller: emailController,
              enabled: isEditMode,
            ),
            CustomTextField(
              label: 'Nama',
              controller: nameController,
              enabled: isEditMode,
            ),
            CustomTextField(
              label: 'Nomor Telepon',
              controller: phoneController,
              enabled: isEditMode,
            ),
            CustomTextField(
              label: 'Alamat',
              controller: addressController,
              enabled: isEditMode,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 218,
              height: 55,
              child: ElevatedButton(
                onPressed: _toggleEditMode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isEditMode ? 'Simpan' : 'Ubah Profil',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile widget
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          ProfileCard(
            name: "Joshua",
            university: "University of Technology",
            imageProfile: "lib/assets/contoh/2lipa.jpeg",
          ),
          Expanded(
            child: ListView(
              children: [
                ProfileTile(
                  title: 'Kelola Akun',
                  onTap: () {
                  },
                ),
                ProfileTile(title: 'Notifikasi', onTap: () {}),
                ProfileTile(title: 'Privacy Policy', onTap: () {}),
                ProfileTile(title: 'Terms of Service', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// CustomTextField widget
class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool enabled;

  CustomTextField({
    required this.label,
    required this.controller,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
