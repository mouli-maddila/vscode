import 'package:flutter/material.dart';
import 'package:aegis/i18n/app_localizations.dart';
// Neo‑Brutalism palette
class NB {
  static const Color bg = Color(0xFFF1F1F1); // off‑white canvas
  static const Color ink = Colors.black; // thick borders
  static const Color primary = Color(0xFFFF3B30); // bold red
  static const Color secondary = Color(0xFF34C759); // bold green
  static const Color accent = Color(0xFF007AFF); // bold blue
  static const double border = 4.0; // 3‑4px
  static const double radius = 12.0; // slightly rounded
  static const List<BoxShadow> harshShadow = [
    BoxShadow(
      color: Colors.black,
      offset: Offset(6, 6),
      blurRadius: 0,
      spreadRadius: 0,
    ),
  ];
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: NB.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: NB.accent,
                      border: Border.all(color: NB.ink, width: NB.border),
                      boxShadow: NB.harshShadow,
                    ),
                    child: const Icon(Icons.shield, color: Colors.white),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    t.t('app_name'),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      letterSpacing: 1.5,
                      color: NB.ink,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      border: Border.all(color: NB.ink, width: NB.border),
                      boxShadow: NB.harshShadow,
                    ),
                    child: Text(
                      t.t('beta'),
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Main buttons column
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _NBButton(
                      label: t.t('send'),
                      color: NB.primary,
                      icon: Icons.send_rounded,
                      big: true,
                      width: MediaQuery.of(context).size.width - 32,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 24),
                    _NBButton(
                      label: t.t('receive'),
                      color: NB.secondary,
                      icon: Icons.download_rounded,
                      big: true,
                      width: MediaQuery.of(context).size.width - 32,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 24),
                    _NBButton(
                      label: t.t('balance'),
                      color: Colors.orange,
                      icon: Icons.account_balance_wallet,
                      big: true,
                      width: MediaQuery.of(context).size.width - 32,
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: NB.accent,
                    borderRadius: BorderRadius.circular(NB.radius),
                    border: Border.all(color: NB.ink, width: NB.border),
                    boxShadow: NB.harshShadow,
                  ),
                  child: const Icon(Icons.mic, color: Colors.white, size: 48),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NBButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final bool big;
  final Color textColor;
  final double? width;

  const _NBButton({
    required this.label,
    required this.color,
    required this.icon,
    this.big = false,
    this.textColor = Colors.white,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: big ? 90 : 68,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: NB.ink, width: NB.border),
          boxShadow: NB.harshShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: big ? 36 : 26),
            const SizedBox(width: 18),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w900,
                  fontSize: big ? 28 : 18,
                  letterSpacing: 1,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Removed previous header/cards/buttons for pixel perfect screenshot mode.
