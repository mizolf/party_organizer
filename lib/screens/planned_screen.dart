import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:party_organizer/models/party.dart';
import 'package:party_organizer/widgets/party_list_item.dart';

class PlannedScreen extends StatefulWidget {
  const PlannedScreen(
      {super.key,
      required this.parties,
      required this.togglePartyFavoriteStatus});

  final List<Party> parties;
  final void Function(Party party) togglePartyFavoriteStatus;

  @override
  State<PlannedScreen> createState() {
    return _PlannedScreenState();
  }
}

class _PlannedScreenState extends State<PlannedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planirane zabave'),
        backgroundColor: Colors.transparent,
      ),
      body: widget.parties.isNotEmpty
          ? Container(
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.parties.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        child: PartyListItem(
                          party: widget.parties[index],
                          image: Image.network(widget.parties[index].imagePath),
                          onToggleFavorite: (party) {
                            setState(() {
                              widget.togglePartyFavoriteStatus(party);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: Text('Nema planiranih zabava'),
            ),
    );
  }
}
