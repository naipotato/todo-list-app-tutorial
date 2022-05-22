[GtkTemplate (ui = "/com/nahuelwexd/TodoListAppTutorial/MainWindow.ui")]
sealed class Tla.MainWindow : Adw.ApplicationWindow {
    [GtkChild]
    private unowned Adw.Leaflet _leaflet;

    [GtkChild]
    private unowned Gtk.Button _create_btn;

    [GtkChild]
    private unowned Gtk.Entry _name_entry;

    [GtkChild]
    private unowned Gtk.Entry _detail_entry;

    public TaskViewModel? view_model { get; construct; }

    public MainWindow (Application app, TaskViewModel view_model) {
        Object (application: app, view_model: view_model);
    }

    [GtkCallback]
    private void on_add_btn_clicked () {
        this._leaflet.navigate (Adw.NavigationDirection.FORWARD);
    }

    [GtkCallback]
    private void on_back_btn_clicked () {
        this._leaflet.navigate (Adw.NavigationDirection.BACK);
    }

    [GtkCallback]
    private void on_text_changed () {
        var name_text = this._name_entry.text;
        var detail_text = this._detail_entry.text;

        this._create_btn.sensitive = name_text != null &&
            name_text != "" &&
            detail_text != null &&
            detail_text != "";
    }

    [GtkCallback]
    private void on_create_btn_clicked () {
        var name_text = this._name_entry.text;
        var detail_text = this._detail_entry.text;

        this.view_model.create_task (name_text, detail_text);

        this._name_entry.text = "";
        this._detail_entry.text = "";

        this.on_back_btn_clicked ();
    }
}
