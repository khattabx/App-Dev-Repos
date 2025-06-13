import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _Summer = false;
  var _Winter = false;
  var _Family = false;

  @override
  initState() {
    _Summer = widget.currentFilters['summer']!;
    _Winter = widget.currentFilters['winter']!;
    _Family = widget.currentFilters['family']!;

    super.initState();
  }

  Widget buildSwitchLisTile(BuildContext context, String title, String subtitle,
      var currentValue, ValueChanged<bool>? updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).primaryColor,
      inactiveTrackColor: Colors.grey,
      inactiveThumbColor: Colors.grey[700],
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلتر'),
        actions: [
          IconButton(
            // تعديل زر الحفظ لتمرير الفلاتر كـ Map
            onPressed: () {
              final selectedFilters = {
                'summer': _Summer,
                'winter': _Winter,
                'family': _Family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: const Icon(Icons.save_rounded),
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                buildSwitchLisTile(
                  context,
                  'الرحلات الصيفية',
                  'كدا رحلات الصيف بس الـهتظهرلك',
                  _Summer,
                  (newValue) {
                    setState(() {
                      _Summer = newValue;
                    });
                  },
                ),
                buildSwitchLisTile(
                  context,
                  'الرحلات الشتوية',
                  'كدا رحلات الشتاء بس الـهتظهرلك',
                  _Winter,
                  (newValue) {
                    setState(() {
                      _Winter = newValue;
                    });
                  },
                ),
                buildSwitchLisTile(
                  context,
                  'الرحلات العائلية',
                  'كدا رحلات العائلية بس الـهتظهرلك',
                  _Family,
                  (newValue) {
                    setState(() {
                      _Family = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
