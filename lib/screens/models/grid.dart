
class GridItem {
  final String title;
  final String path;

//to initialise them
  GridItem({required this.title, required this.path});
}

GridList allGrid = GridList(grid: [
  GridItem(title: 'Hospital Near Me', path: 'gridimages/profile1.png'),
  GridItem(title: 'Pharmacy Near Me', path: 'gridimages/profile2.png'),
  GridItem(title: 'Ambulance', path: 'gridimages/profile3.png'),
  GridItem(title: 'Appointments', path: 'gridimages/profile4.png'),
  GridItem(title: 'Chat Bot', path: 'gridimages/profile5.png'),
  GridItem(title: 'Settings', path: 'gridimages/profile6.png'),
]);

class GridList {
  late List<GridItem> grid;

  GridList({required this.grid});
}
