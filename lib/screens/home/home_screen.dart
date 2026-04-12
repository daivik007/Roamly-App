import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../search_screen.dart';

// ── Trending place model ──────────────────────────────────────────────────────
class _TrendingPlace {
  final String name;
  final String status;
  final String distance;
  final String price;
  final String rating;
  final String imageUrl;

  const _TrendingPlace({
    required this.name,
    required this.status,
    required this.distance,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });
}

// ── Pick model ────────────────────────────────────────────────────────────────
class _Pick {
  final String name;
  final String imageUrl;

  const _Pick({required this.name, required this.imageUrl});
}

// ── Data ──────────────────────────────────────────────────────────────────────
const _trendingPlaces = [
  _TrendingPlace(
    name: 'Mahanakhon SkyWalk',
    status: 'Open now',
    distance: '12 Km away',
    price: 'From ₹3,406.52',
    rating: '4.5 (22,798)',
    imageUrl: 'assets/home/t1.png',
  ),
  _TrendingPlace(
    name: 'Jodd Fairs Night Market',
    status: 'Open now',
    distance: '15 Km away',
    price: 'From ₹300',
    rating: '4.3 (13,478)',
    imageUrl: 'assets/home/t2.png',
  ),
  _TrendingPlace(
    name: 'Benjakitti Forest Park',
    status: 'Open now',
    distance: '8 Km away',
    price: 'From ₹4,598',
    rating: '4.6 (9,062)',
    imageUrl: 'assets/home/t3.png',
  ),
  _TrendingPlace(
    name: 'Bangkok Art & Culture Centre',
    status: 'Closed',
    distance: '18 Km away',
    price: 'From ₹2,902',
    rating: '4.5 (19,062)',
    imageUrl: 'assets/home/t4.png'
  ),
];

const _picks = [
  _Pick(
    name: 'Assumption\nCathedral',
    imageUrl: 'assets/home/1.png',
  ),
  _Pick(
    name: 'Wat Arun',
    imageUrl: 'assets/home/2.png',
  ),
  _Pick(
    name: 'ICONSIAM',
    imageUrl: 'assets/home/3.png',
  ),
  _Pick(
    name: 'The Grand\nPalace',
    imageUrl: 'assets/home/4.png',
  ),
  _Pick(
    name: 'Lumphini\nPark',
    imageUrl: 'assets/home/5.png',
  ),
  _Pick(
    name: 'Erawan Shrine',
    imageUrl: 'assets/home/6.png',
  ),
];

const _filterChips = [
  'Nearby',
  'Rated 4+',
  'Open Now',
  'Budget',
  'Outdoor Seating',
  'Live Music',
  'Vegan',
  'Free Parking',
];

// ── Colors ────────────────────────────────────────────────────────────────────
const _bg = Color(0xFF0E1514);
const _primary = Color(0xFF006A66);
const _chipBorder = Color(0xFF9CF1EC);
const _chipBg = Color(0xFF051F1E);
const _searchBg = Color(0xFFD0E4FF);
const _searchText = Color(0xFF011D34);

// ── Screen ────────────────────────────────────────────────────────────────────
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Stack(
          children: [
            // ── Scrollable content ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SearchScreen()),
                      ),
                      child: _buildSearchBar(),
                    ),
                    const SizedBox(height: 16),
                    _buildFilterChips(),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Picks for you'),
                    const SizedBox(height: 14),
                    _buildPicksRow(),
                    const SizedBox(height: 28),
                    _buildSectionTitle('Trending Places'),
                    const SizedBox(height: 14),
                    _buildTrendingList(),
                  ],
                ),
              ),
            ),

            // ── Bottom nav bar ──────────────────────────────────────────────
            Positioned(
              left: 16,
              right: 16,
              bottom: 8,
              child: _buildNavBar(),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ─────────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Roamly',
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            const Icon(Icons.near_me, color: _chipBorder, size: 22),
            const SizedBox(width: 4),
            Text(
              'Mandarin\nOriental',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color(0xFFCCE8E5),
                height: 1.4,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ],
    );
  }


  // ── Search bar ─────────────────────────────────────────────────────────────
  Widget _buildSearchBar() {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: _searchBg,
        borderRadius: BorderRadius.circular(60),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.search, color: _searchText, size: 28),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Where to?',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: _searchText,
                ),
              ),
              Text(
                'Things to do, eat and much more',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: const Color(0xFF4E4E4E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Filter chips ───────────────────────────────────────────────────────────
  Widget _buildFilterChips() {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filterChips.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, i) {
          final isFirst = i == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: _chipBg,
              border: Border.all(color: _chipBorder),
              borderRadius: BorderRadius.circular(60),
            ),
            alignment: Alignment.center,
            child: Row(
              children: [
                if (isFirst) ...[
                  const Icon(Icons.near_me, color: Colors.white, size: 13),
                  const SizedBox(width: 4),
                ],
                Text(
                  _filterChips[i],
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ── Section title ──────────────────────────────────────────────────────────
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 0.1,
      ),
    );
  }

  // ── Picks horizontal row ───────────────────────────────────────────────────
  Widget _buildPicksRow() {
    return SizedBox(
      height: 136,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _picks.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, i) {
          final pick = _picks[i];
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 125,
              height: 136,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(pick.imageUrl, fit: BoxFit.cover),
                  // gradient overlay
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                        stops: [0.5, 1.0],
                      ),
                    ),
                  ),
                  // label
                  Positioned(
                    bottom: 8,
                    left: 0,
                    right: 0,
                    child: Text(
                      pick.name,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: Colors.white,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Trending list ──────────────────────────────────────────────────────────
  Widget _buildTrendingList() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _trendingPlaces.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, i) {
        final place = _trendingPlaces[i];
        return _TrendingCard(place: place);
      },
    );
  }

  // ── Bottom nav bar ─────────────────────────────────────────────────────────
  Widget _buildNavBar() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: _primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home_outlined,
            label: 'Home',
            selected: _navIndex == 0,
            onTap: () => setState(() => _navIndex = 0),
          ),
          _NavItem(
            icon: Icons.favorite_border,
            label: '',
            selected: _navIndex == 1,
            onTap: () => setState(() => _navIndex = 1),
          ),
          _NavItem(
            icon: Icons.person_outline,
            label: '',
            selected: _navIndex == 2,
            onTap: () => setState(() => _navIndex = 2),
          ),
        ],
      ),
    );
  }
}

// ── Trending card widget ──────────────────────────────────────────────────────
class _TrendingCard extends StatelessWidget {
  final _TrendingPlace place;

  const _TrendingCard({required this.place});

  @override
  Widget build(BuildContext context) {
    final isOpen = place.status == 'Open now';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // image
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            place.imageUrl,
            height: 131,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        // name + rating row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                place.name,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
                const SizedBox(width: 3),
                Text(
                  place.rating,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 4),
        // status + distance
        Row(
          children: [
            Text(
              place.status,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: isOpen ? const Color(0xFF9CF1EC) : const Color(0xFFFF6B6B),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              place.distance,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        // price
        Text(
          place.price,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// ── Nav item widget ───────────────────────────────────────────────────────────
class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: selected
            ? BoxDecoration(
                color: const Color(0x801295901),
                border: const Border(
                  top: BorderSide(color: Colors.white, width: 2),
                ),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            if (label.isNotEmpty) ...[
              const SizedBox(height: 2),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}