import 'package:flutter_icons/flutter_icons.dart';
import 'package:meet/models/design_process.dart';

final List<DesignProcess> designProcesses = [
  DesignProcess(
    title: "Web",
    icon: FontAwesome.code,
    subtitle:
        "HTML/CSS, SASS, React/NodeJS/Typescript, etc. MVC pattern and REST/GraphQL architecture.",
  ),
  DesignProcess(
    title: "Database",
    icon: FontAwesome.database,
    subtitle:
        "Familiar with MySQL, PostgreSQL, and NoSQL: MongoDB, Couchbase and Firebase.",
  ),
  DesignProcess(
    title: "Mobile",
    icon: FontAwesome.mobile,
    subtitle:
        "Familiar with Cross-platform technologies such as Flutter/Dart and familiar with Ionic 3.",
  ),
  DesignProcess(
    title: "Style",
    icon: FontAwesome.css3,
    subtitle:
        "Familiar with CSS frameworks such as Ant Design, Material UI, CoreUI, Tailwind CSS, etc.",
  ),
];
