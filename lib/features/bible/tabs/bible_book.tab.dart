import 'package:flutter/material.dart';

class BibleBookTab extends StatelessWidget {
  const BibleBookTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Material(
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.primaryContainer,
              title: Text(
                'Old Testament',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 25,
              separatorBuilder: (_, index) => const Divider(height: 0),
              itemBuilder: (_, index) {
                final isSelected = index == 2;
                return Material(
                  child: ListTile(
                    tileColor: isSelected ? Theme.of(context).colorScheme.primary : null,
                    title: Text(
                      'Genesis',
                      style: isSelected ? Theme.of(context).primaryTextTheme.titleLarge : null,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                );
              }),
          Material(
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.primaryContainer,
              title: Text(
                'New Testament',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            separatorBuilder: (_, index) => const Divider(height: 0),
            itemBuilder: (_, index) {
              final isSelected = index == 2;
              return Material(
                child: ListTile(
                  tileColor: isSelected ? Theme.of(context).colorScheme.primary : null,
                  title: Text(
                    'Matthew',
                    style: isSelected ? Theme.of(context).primaryTextTheme.titleLarge : null,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
