import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
  List<Party> parties = [];
  List<Party> _favoriteParties = [];

  final CollectionReference _favoritePartiesCollection =
      FirebaseFirestore.instance.collection('favorites');

  @override
  void initState() {
    super.initState();
    _loadParties();
  }

  Future<void> _loadParties() async {
    final partiesSnapshot =
        await FirebaseFirestore.instance.collection('parties').get();
    final favoritePartiesSnapshot =
        await FirebaseFirestore.instance.collection('favorites').get();
    setState(() {
      parties =
          partiesSnapshot.docs.map((doc) => Party.fromMap(doc.data())).toList();
      _favoriteParties = favoritePartiesSnapshot.docs
          .map((doc) => Party.fromMap(doc.data()))
          .toList();
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _togglePartyFavoriteStatus(Party party) async {
    final isExisting = _favoriteParties.contains(party);

    if (isExisting) {
      await _favoritePartiesCollection
          .where('title', isEqualTo: party.title)
          .where('startTime', isEqualTo: party.startTime)
          .where('date', isEqualTo: party.date)
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.docs.isNotEmpty) {
          querySnapshot.docs.first.reference.delete();
        }
      });

      setState(() {
        _favoriteParties.remove(party);
        _showInfoMessage('Uklonjeno iz planiranog');
      });
    } else {
      await _favoritePartiesCollection.add(party.toMap());

      setState(() {
        _favoriteParties.add(party);
        _showInfoMessage('Dodano u planirano');
      });
    }
  }

  void _searchParty(String query) async {
    if (query.isEmpty) {
      _loadParties();
    } else {
      await FirebaseFirestore.instance
          .collection('parties')
          .where('title', isEqualTo: query)
          .get()
          .then((QuerySnapshot querySnapshot) {
        setState(() {
          parties = querySnapshot.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Party.fromMap(data);
          }).toList();
        });
      }).catchError((error) {
        print("Error getting documents: $error");
      });
    }
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
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('parties')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return const Center(child: Text('Greška'));
                        }

                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: parties.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => FadeInUp(
                            duration: const Duration(milliseconds: 1500),
                            child: PartyListItem(
                              party: parties[index],
                              onToggleFavorite: _togglePartyFavoriteStatus,
                            ),
                          ),
                        );
                      },
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
