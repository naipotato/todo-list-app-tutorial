sealed class Tla.TaskRepository {
    private List<Task> _tasks = new List<Task> ();

    public void add (owned Task task) {
        this._tasks.append ((owned) task);
    }

    public List<unowned Task> get_tasks () {
        return this._tasks.copy ();
    }

    public void remove (Task task) {
        this._tasks.remove (task);
    }
}
