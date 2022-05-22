project(
    'todo-list-app-tutorial',
    'vala', 'c',
)

gnome = import('gnome')

subdir('data')
subdir('src')

gnome.post_install(
    update_desktop_database : true,
)
