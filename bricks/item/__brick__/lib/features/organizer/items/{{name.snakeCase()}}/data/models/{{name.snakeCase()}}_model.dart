// Class name in PascalCase (TaskTagLink)
class {{name}} {
// Variable in camelCase (taskTagLink)
final String {{name.camelCase()}};

// Variable in snake_case (task_tag_link)
final String {{name.snakeCase()}};

{{name}}({
required this.{{name.camelCase()}},
required this.{{name.snakeCase()}}
});
}