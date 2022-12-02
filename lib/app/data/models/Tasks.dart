import 'package:equatable/equatable.dart';

class Tasks extends Equatable {
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? todos;

  const Tasks({
    required this.title,
    required this.icon,
    required this.color,
    this.todos,});

  Tasks copyWith({
    String? title,
    int? icon,
    String? color,
    List<dynamic>? todos,
  }) =>
      Tasks(title: title ?? this.title,
          icon: icon ?? this.icon,
          color: color ?? this.color);

  factory Tasks.fromJson(Map<String, dynamic> json) =>
      Tasks(title: json['title'],
          icon: json['icon'],
          color: json['color'],
          todos: json['todos']);


  Map<String, dynamic> toJson() => {
    'title' : title,
    'icon' : icon,
    'color' : color,
    'todos' : todos
  };

  @override
  List<Object?> get props => [title, icon, color];

}