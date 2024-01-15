import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:party_organizer/dummy_data.dart/dummy_data.dart';
import 'package:party_organizer/models/party.dart';
import 'package:party_organizer/screens/planned_screen.dart';
import 'package:party_organizer/widgets/party_list_item.dart';

class PartyList extends StatefulWidget {
  const PartyList({super.key});

  @override
  State<PartyList> createState() {
    return _PartyListState();
  }
}

class _PartyListState extends State<PartyList> {
  final textController = TextEditingController();
  List<Party> parties = allParties;
  final List<Party> _favoriteParties = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _togglePartyFavoriteStatus(Party party) {
    final isExisting = _favoriteParties.contains(party);
    if (isExisting) {
      setState(() {
        _favoriteParties.remove(party);
        _showInfoMessage('Uklonjeno iz planirano');
      });
    } else {
      setState(() {
        _favoriteParties.add(party);
        _showInfoMessage('Dodano u planirano');
      });
    }
  }

  void _searchParty(String query) {
    final suggestions = allParties.where((party) {
      final partyTitle = party.title.toLowerCase();
      final input = query.toLowerCase();

      return partyTitle.contains(input);
    }).toList();

    setState(() {
      parties = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black87.withOpacity(0.15),
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
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.timer),
                title: const Text('Planirano'),
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: PlannedScreen(
                        parties: _favoriteParties,
                        togglePartyFavoriteStatus: _togglePartyFavoriteStatus,
                      ),
                      type: PageTransitionType.fade,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Organizacija partyja'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Traži zabave...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    onChanged: _searchParty,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: parties.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: PartyListItem(
                          party: parties[index],
                          image: const AssetImage('assets/images/home.jpeg'),
                          onToggleFavorite: _togglePartyFavoriteStatus,
                        ),
                      ),
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
}
