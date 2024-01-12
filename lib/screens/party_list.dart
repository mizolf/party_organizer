import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class PartyList extends StatefulWidget {
  const PartyList({super.key});

  @override
  State<PartyList> createState() {
    return _PartyListState();
  }
}

class _PartyListState extends State<PartyList> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black87.withOpacity(0.2),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Text(
                  'Organizacija partija',
                  style: TextStyle(fontSize: 32),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: const Text('Naslovna'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.timer),
                title: const Text('Planirano'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Party Organizer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: const SearchBar(
                // CONTROLLER DODATI
                hintText: 'Search parties...',
                leading: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}
