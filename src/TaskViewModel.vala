sealed class Tla.TaskViewModel : Object {
    public TaskRepository repository { get; construct; }
    public ListStore tasks { get; default = new ListStore (typeof (Task)); }

    public TaskViewModel (TaskRepository repository) {
        Object (repository: repository);
    }

    construct {
        this.update_tasks ();
    }

    public void create_task (string name, string detail) {
        var task = new Task () {
            id = Uuid.string_random (),
            name = name,
            detail = detail
        };

        this.repository.add (task);
        this.tasks.append (task);
    }

    private void update_tasks () {
        var tasks = this.repository.get_tasks ();
        var tasks_array = new Object[0];

        foreach (var task in tasks) {
            tasks_array += task;
        }

        this.tasks.splice (0, this.tasks.get_n_items (), tasks_array);
    }
}
