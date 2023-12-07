import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Einstellungen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Erinnerungen festlegen',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              _buildDivider(),
              ListTile(
                title: Text(
                  'Datenschutzrichtlinie',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              _buildDivider(),
              ListTile(
                title: Text(
                  'Nutzungsbedingungen',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              _buildDivider(),
              ListTile(
                title: Text(
                  'Abonnementinformationen',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
              _buildDivider(),
              ListTile(
                title: Text(
                  'Bewerten Sie unsere App im AppStore',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDivider() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0),
    width: double.infinity,
    height: 0.5,
    color: Colors.grey,
  );
}
