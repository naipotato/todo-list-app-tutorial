sources = [
    'Application.vala',
    'MainWindow.vala',
    'Task.vala',
    'TaskRepository.vala',
    'TaskViewModel.vala',
]

gnome = import('gnome')
resources = gnome.compile_resources(
    'todo-list-app-tutorial-ui-resources',
    'todo-list-app-tutorial-ui-resources.xml',
)

deps = [
    dependency('libadwaita-1', version : '>=1.1')
]

executable(
    meson.project_name(),
    sources, resources,

    dependencies : deps,
    install      : true,
)
