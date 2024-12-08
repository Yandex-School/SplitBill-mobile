import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/router/app_router.dart';
import 'package:split_bill/core/theme/theme_notifier.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';

class EventDrawer extends StatefulWidget {
  const EventDrawer({super.key});

  @override
  State<EventDrawer> createState() => _EventDrawerState();
}

class _EventDrawerState extends State<EventDrawer> {
  final List<String> imagePaths = [
    'assets/png/person-0.png',
    'assets/png/person-1.png',
    'assets/png/person-2.png',
    'assets/png/person-3.png',
    'assets/png/person-4.png',
    'assets/png/person-5.png',
  ];

  // Текущее выбранное изображение
  String? selectedImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _saveImage(String imagePath) async {
    final prefs = getIt<SharedPrefsService>();
    await prefs.saveString('selected_image', imagePath);
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedImage = prefs.getString('selected_image');
    if (savedImage != null) {
      setState(() {
        selectedImage = savedImage;
      });
    }
  }

  void _showImagePicker(ValueChanged<String> onImageSelected) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        List<bool> animatedItems = List.generate(imagePaths.length, (index) => false);

        return StatefulBuilder(
          builder: (context, setState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              for (int i = 0; i < imagePaths.length; i++) {
                Future.delayed(Duration(milliseconds: 100 * i), () {
                  setState(() {
                    animatedItems[i] = true;
                  });
                });
              }
            });

            return Container(
              padding: const EdgeInsets.all(16.0),
              height: 400,
              child: Column(
                children: [
                  const Text(
                    'Выберите свою аватарку',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: imagePaths.length,
                      itemBuilder: (context, index) {
                        final imagePath = imagePaths[index];
                        final isSelected = selectedImage == imagePath;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              onImageSelected.call(imagePath);
                            });
                            _saveImage(imagePath);
                            Navigator.pop(context);
                          },
                          child: AnimatedOpacity(
                            opacity: animatedItems[index] ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: AnimatedScale(
                                    scale: animatedItems[index] ? 1.0 : 0.8,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOutBack,
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                if (isSelected)
                                  Positioned(
                                    right: 8,
                                    bottom: 8,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.8),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drawer Header
            Container(
              padding: const EdgeInsets.all(60),
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: selectedImage != null ? AssetImage(selectedImage!) : null,
                          child: selectedImage == null
                              ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.black,
                                )
                              : null,
                        ),
                        Transform.translate(
                          offset: const Offset(45, 50),
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: const BoxDecoration(
                              color: Colors.white, // Background color
                              shape: BoxShape.circle, // Make it circular
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                _showImagePicker((imsgrPath) {
                                  setState(() {
                                    selectedImage = imsgrPath;
                                  });
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ), // Icon color
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.brightness == Brightness.dark ? Colors.black : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'user@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.brightness == Brightness.dark ? Colors.grey[700] : Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),

            // Theme Toggle Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  context.read<ThemeNotifier>().toggleTheme();
                },
                icon: Icon(
                  theme.brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
                  color: theme.brightness == Brightness.dark ? Colors.black : Colors.black,
                ),
                label: Text(
                  theme.brightness == Brightness.dark ? 'Light Theme' : 'Dark Theme',
                  style: TextStyle(
                    color: theme.brightness == Brightness.dark ? Colors.black : Colors.black,
                  ),
                ),
              ),
            ),
            const Divider(),
            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  await context.read<EventRoomProvider>().logout().then(
                        (value) => context.go('/login'),
                      );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//