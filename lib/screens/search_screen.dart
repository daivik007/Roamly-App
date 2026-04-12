import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _bg = Color(0xFF0E1514);
const _chipBorder = Color(0xFF9CF1EC);
const _chipBg = Color(0xFF051F1E);
const _searchBg = Color(0xFFD0E4FF);
const _searchHint = Color(0xFF616161);
const _backBg = Color(0xFFD2E2FC);

const _filterChips = [
  {'label': 'Nearby', 'icon': true},
  {'label': 'Rated 4+', 'icon': false},
  {'label': 'Open Now', 'icon': false},
  {'label': 'Budget', 'icon': false},
  {'label': 'Outdoor Seating', 'icon': false},
  {'label': 'Live Music', 'icon': false},
  {'label': 'Vegan', 'icon': false},
  {'label': 'Free Parking', 'icon': false},
];

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _query = '';
  final Set<String> _selectedChips = {};

  @override
  void initState() {
    super.initState();
    // auto-focus search field when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // ── Back button ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: _backBg,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── Search bar ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  color: _searchBg,
                  borderRadius: BorderRadius.circular(60),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: _searchHint, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        onChanged: (val) => setState(() => _query = val),
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF011D34),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Find places to roam',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 17,
                            color: _searchHint,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (_) => _performSearch(),
                      ),
                    ),
                    if (_query.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                        child: const Icon(
                          Icons.close,
                          color: _searchHint,
                          size: 20,
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ── Filter chips (wrap) ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _filterChips.map((chip) {
                  final label = chip['label'] as String;
                  final hasIcon = chip['icon'] as bool;
                  final isSelected = _selectedChips.contains(label);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected
                            ? _selectedChips.remove(label)
                            : _selectedChips.add(label);
                      });
                    },
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? _chipBorder.withOpacity(0.2)
                            : _chipBg,
                        border: Border.all(color: _chipBorder),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (hasIcon) ...[
                            const Icon(
                              Icons.near_me,
                              color: Colors.white,
                              size: 13,
                            ),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            label,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 24),

            // ── Results area ───────────────────────────────────────────────
            Expanded(
              child: _query.isEmpty
                  ? _buildEmptyState()
                  : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  void _performSearch() {
    // hook up real search logic here
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search,
            size: 64,
            color: Colors.white.withOpacity(0.2),
          ),
          const SizedBox(height: 12),
          Text(
            'Search for places to explore',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    // placeholder results — wire up real data here
    final results = [
      'Assumption Cathedral',
      'Wat Arun',
      'ICONSIAM',
      'The Grand Palace',
      'Lumphini Park',
      'Erawan Shrine',
    ].where((r) => r.toLowerCase().contains(_query.toLowerCase())).toList();

    if (results.isEmpty) {
      return Center(
        child: Text(
          'No results for "$_query"',
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: results.length,
      separatorBuilder: (_, __) => Divider(
        color: Colors.white.withOpacity(0.1),
        height: 1,
      ),
      itemBuilder: (context, i) {
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 4),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF051F1E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.place_outlined,
              color: _chipBorder,
              size: 20,
            ),
          ),
          title: Text(
            results[i],
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Bangkok, Thailand',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white38,
            size: 14,
          ),
        );
      },
    );
  }
}