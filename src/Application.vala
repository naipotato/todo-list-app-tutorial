sealed class Tla.Application : Adw.Application {
    construct {
        this.application_id = "com.nahuelwexd.TodoListAppTutorial";
    }

    public static int main (string[] args) {
        var app = new Application ();
        return app.run (args);
    }

    public override void activate () {
        this.active_window?.present ();
    }

    public override void startup () {
        base.startup ();

        this.setup_actions ();

        var repository = new TaskRepository ();
        var view_model = new TaskViewModel (repository);

        new MainWindow (this, view_model);
    }

    private void setup_actions () {
        var action_entries = new ActionEntry[] {
            { "show-about", this.show_about, },
        };

        this.add_action_entries (action_entries, this);
    }

    private void show_about () {
        var about = new Gtk.AboutDialog () {
            transient_for = this.active_window,
            destroy_with_parent = modal = true,
            program_name = "Todo List App Tutorial",
            comments = "Una pequeña app de lista de tareas"
        };

        about.present ();
    }
}
