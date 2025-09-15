import 'package:aegis/i18n/app_localizations.dart';
import 'package:aegis/pages/home.dart';
import 'package:flutter/material.dart';

class Shell extends StatefulWidget {
  final void Function(Locale) onLocaleChanged;
  const Shell({super.key, required this.onLocaleChanged});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: const [
          HomePage(),
          _AnalyticsPage(),
          _SettingsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black, width: 4)),
          boxShadow: const [
            BoxShadow(color: Colors.black, offset: Offset(0, -6), blurRadius: 0),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          backgroundColor: const Color(0xFFF1F1F1),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: const Icon(Icons.home_filled), label: t.t('home')),
            BottomNavigationBarItem(icon: const Icon(Icons.bar_chart), label: t.t('analytics')),
            BottomNavigationBarItem(icon: const Icon(Icons.settings), label: t.t('settings')),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsPage extends StatelessWidget {
  const _AnalyticsPage();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Analytics – coming soon')),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.t('settings').toUpperCase(),
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 4),
                  boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(6, 6), blurRadius: 0)],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.language),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        t.t('language'),
                        style: const TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ),
                    _LangButton(locale: const Locale('en')),
                    const SizedBox(width: 8),
                    _LangButton(locale: const Locale('te')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  final Locale locale;
  const _LangButton({required this.locale});

  @override
  Widget build(BuildContext context) {
    final inherited = context.findAncestorStateOfType<_ShellState>();
    return GestureDetector(
      onTap: () => inherited?.widget.onLocaleChanged(locale),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(color: Colors.black, width: 4),
          boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(4, 4), blurRadius: 0)],
        ),
        child: Text(locale.languageCode.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w900)),
      ),
    );
  }
}
