import 'package:flutter/material.dart';
import 'package:party_organizer/models/party.dart';

class PartyDetails extends StatelessWidget {
  const PartyDetails({super.key, required this.party});

  final Party party;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(party.title),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
