public class Odysseus.WebTab : Granite.Widgets.Tab {
    public WebKit.WebView web; // To allow it to be wrapped in layout views. 
    private Gtk.Revealer find;
    
    public WebTab(Granite.Widgets.DynamicNotebook parent,
                  WebKit.WebView? related = null,
                  string uri = "https://ddg.gg/") {
        if (related != null) {
            this.web = (WebKit.WebView) related.new_with_related_view();
        } else {
            this.web = new WebKit.WebView.with_context(ctx);
        }
        var container = new Gtk.Overlay();
        container.add(this.web);
        this.page = container;
        
        // Avoid taking too much screen realestate away from the page.
        // That's why we're using an overlay
        var find_toolbar = new FindToolbar(web.get_find_controller());
        find = new Gtk.Revealer();
        find.add(find_toolbar);
        find.transition_type = Gtk.RevealerTransitionType.SLIDE_DOWN;
        find.halign = Gtk.Align.START;
        find.valign = Gtk.Align.START;
        container.add_overlay(find);
        find.show_all();
        
        web.bind_property("title", this, "label");
        web.notify["favicon"].connect((sender, property) => {
            var fav = BrowserWindow.surface_to_pixbuf(web.get_favicon());
            icon = fav.scale_simple(16, 16, Gdk.InterpType.BILINEAR);
        });
        web.bind_property("is-loading", this, "working");

        web.create.connect((nav_action) => {
            var tab = new WebTab(parent, web, nav_action.get_request().uri);
            parent.insert_tab(tab, -1);
            parent.current = tab;
            return tab.web;
        });
        web.button_press_event.connect((evt) => {
            find.set_reveal_child(false);
            return false;
        });
        web.grab_focus.connect(() => {
            find.set_reveal_child(false);
        });
        
        web.load_uri(uri);
    }
    
    public void find_in_page() {
        if (!find.has_focus || !find.child_revealed) {
            find.set_reveal_child(true);
            find.get_child().grab_focus();
        } else {
            find.set_reveal_child(false);
            web.grab_focus();
        }
            
    }
}