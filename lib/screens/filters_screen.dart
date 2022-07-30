import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  Map<String, bool> filters;
  final Function updateFilters;

  FiltersScreen(this.filters, this.updateFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchListTile(
      String title, String desc, bool value, Function updateValue) {
    return SwitchListTile(
      value: value,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(desc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        // actions: [
        //   IconButton(
        //       onPressed: () => widget.updateFilters(widget.filters),
        //       icon: Icon(Icons.save))
        // ],
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(children: [
            _buildSwitchListTile(
              'Gluten-free',
              'Only include gluten-free meals',
              widget.filters['gluten'],
              (newVal) {
                setState(
                  () {
                    widget.filters['gluten'] = newVal;
                    widget.updateFilters(widget.filters);
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegetarian',
              'Only include vegetarian meals',
              widget.filters['vegetarian'],
              (newVal) {
                setState(
                  () {
                    widget.filters['vegetarian'] = newVal;
                    widget.updateFilters(widget.filters);
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Vegan',
              'Only include vegan meals',
              widget.filters['vegan'],
              (newVal) {
                setState(
                  () {
                    widget.filters['vegan'] = newVal;
                    widget.updateFilters(widget.filters);
                  },
                );
              },
            ),
            _buildSwitchListTile(
              'Lactose-free',
              'Only include lactose-free meals',
              widget.filters['lactose'],
              (newVal) {
                setState(
                  () {
                    widget.filters['lactose'] = newVal;
                    widget.updateFilters(widget.filters);
                  },
                );
              },
            ),
          ]),
        )
      ]),
    );
  }
}
