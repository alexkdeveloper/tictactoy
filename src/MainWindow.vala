using Gtk;

namespace TicTacToe {

    public class MainWindow : Gtk.ApplicationWindow {

        private Button b_1;
        private Button b_2;
        private Button b_3;
        private Button b_4;
        private Button b_5;
        private Button b_6;
        private Button b_7;
        private Button b_8;
        private Button b_9;
        private string[,] m;

        public MainWindow(Gtk.Application application) {
            GLib.Object(application: application,
                         title: "TicTacToy",
                         window_position: WindowPosition.CENTER,
                         resizable: false,
                         border_width: 5);
        }

      construct {
      var css_provider = new Gtk.CssProvider();
       try {
                css_provider.load_from_data(".symbols_size {font-size: 50px}");
                Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            } catch (Error e) {
                error ("Cannot load CSS stylesheet: %s", e.message);
        }
        Gtk.HeaderBar headerbar = new Gtk.HeaderBar();
        headerbar.get_style_context().add_class(Gtk.STYLE_CLASS_FLAT);
        headerbar.show_close_button = true;
        set_titlebar(headerbar);
        var new_game_button = new Gtk.Button ();
            new_game_button.set_image (new Gtk.Image.from_icon_name ("input-gaming-symbolic", Gtk.IconSize.SMALL_TOOLBAR));
            new_game_button.vexpand = false;
          new_game_button.set_tooltip_text("new game");
          new_game_button.clicked.connect(on_new_game_clicked);
          headerbar.pack_start(new_game_button);
          b_1 = new Button();
          b_1.set_size_request(100, 100);
          b_1.get_style_context().add_class("symbols_size");
          b_2 = new Button();
          b_2.set_size_request(100, 100);
          b_2.get_style_context().add_class("symbols_size");
          b_3 = new Button();
          b_3.set_size_request(100, 100);
          b_3.get_style_context().add_class("symbols_size");
          b_4 = new Button();
          b_4.set_size_request(100, 100);
          b_4.get_style_context().add_class("symbols_size");
          b_5 = new Button();
          b_5.set_size_request(100, 100);
          b_5.get_style_context().add_class("symbols_size");
          b_6 = new Button();
          b_6.set_size_request(100, 100);
          b_6.get_style_context().add_class("symbols_size");
          b_7 = new Button();
          b_7.set_size_request(100, 100);
          b_7.get_style_context().add_class("symbols_size");
          b_8 = new Button();
          b_8.set_size_request(100, 100);
          b_8.get_style_context().add_class("symbols_size");
          b_9 = new Button();
          b_9.set_size_request(100, 100);
          b_9.get_style_context().add_class("symbols_size");
          b_1.clicked.connect(on_b_1_clicked);
          b_2.clicked.connect(on_b_2_clicked);
          b_3.clicked.connect(on_b_3_clicked);
          b_4.clicked.connect(on_b_4_clicked);
          b_5.clicked.connect(on_b_5_clicked);
          b_6.clicked.connect(on_b_6_clicked);
          b_7.clicked.connect(on_b_7_clicked);
          b_8.clicked.connect(on_b_8_clicked);
          b_9.clicked.connect(on_b_9_clicked);
          var grid = new Grid();
          grid.row_spacing = 5;
          grid.column_spacing = 5;
          grid.attach(b_1,0,0,1,1);
          grid.attach(b_2,1,0,1,1);
          grid.attach(b_3,2,0,1,1);
          grid.attach(b_4,0,1,1,1);
          grid.attach(b_5,1,1,1,1);
          grid.attach(b_6,2,1,1,1);
          grid.attach(b_7,0,2,1,1);
          grid.attach(b_8,1,2,1,1);
          grid.attach(b_9,2,2,1,1);
          add(grid);
          massive();
      }

      private void on_b_1_clicked(){
           if (m[0,0] != "n"){
            return;
        }
        show_symbol(0,0,"x");
        logic();
      }

      private void on_b_2_clicked(){
          if (m[0,1] != "n"){
            return;
        }
        show_symbol(0,1,"x");
        logic();
      }

      private void on_b_3_clicked(){
          if (m[0,2] != "n"){
            return;
        }
        show_symbol(0,2,"x");
        logic();
      }

      private void on_b_4_clicked(){
          if (m[1,0] != "n"){
            return;
        }
        show_symbol(1,0,"x");
        logic();
      }

      private void on_b_5_clicked(){
          if (m[1,1] != "n"){
            return;
        }
        show_symbol(1,1,"x");
        logic();
      }

      private void on_b_6_clicked(){
          if (m[1,2] != "n"){
            return;
        }
        show_symbol(1,2,"x");
        logic();
      }

      private void on_b_7_clicked(){
          if (m[2,0] != "n"){
            return;
        }
        show_symbol(2,0,"x");
        logic();
      }

      private void on_b_8_clicked(){
          if (m[2,1] != "n"){
            return;
        }
        show_symbol(2,1,"x");
        logic();
      }

      private void on_b_9_clicked(){
          if (m[2,2] != "n"){
            return;
        }
        show_symbol(2,2,"x");
        logic();
      }
      private void show_symbol(int k,int l, string s){
        int i=0;
        switch (k) {
            case 0:
                i=l+1;
                break;
            case 1:
                i=l+4;
                break;
            default:
                i=l+7;
                break;
        }
        switch(i){
            case 1:
                b_1.set_label(s);
                break;
            case 2:
                b_2.set_label(s);
                break;
            case 3:
                b_3.set_label(s);
                break;
            case 4:
                b_4.set_label(s);
                break;
            case 5:
                b_5.set_label(s);
                break;
            case 6:
                b_6.set_label(s);
                break;
            case 7:
                b_7.set_label(s);
                break;
            case 8:
                b_8.set_label(s);
                break;
            case 9:
                b_9.set_label(s);
                break;
            default:
                break;
        }
        m[k,l]=s;
    }
    private void on_new_game_clicked(){
    var dialog = new Gtk.MessageDialog(this, Gtk.DialogFlags.MODAL,Gtk.MessageType.QUESTION, Gtk.ButtonsType.OK_CANCEL, "Start new game?");
         dialog.set_title("Question");
         Gtk.ResponseType result = (ResponseType)dialog.run ();
         dialog.destroy();
         if(result==Gtk.ResponseType.OK){
             new_game();
      }
    }
    private void massive(){
        m=new string[3,3];
        for (int i=0;i<3;i++){
            for (int j=0;j<3;j++){
                m[i,j]="n";
            }
        }
    }
    private void new_game(){
        b_1.set_label("");
        b_2.set_label("");
        b_3.set_label("");
        b_4.set_label("");
        b_5.set_label("");
        b_6.set_label("");
        b_7.set_label("");
        b_8.set_label("");
        b_9.set_label("");
        massive();
    }
    private void logic(){
        StringBuilder s1=new StringBuilder();
        StringBuilder s2=new StringBuilder();
        StringBuilder s3=new StringBuilder();
        StringBuilder s4=new StringBuilder();
        StringBuilder s5=new StringBuilder();
        StringBuilder s6=new StringBuilder();
        StringBuilder s7=new StringBuilder();
        StringBuilder s8=new StringBuilder();

            for (int i=0;i<3;i++) {
                s1.append(m[0,i]);
                s2.append(m[1,i]);
                s3.append(m[2,i]);
                s4.append(m[i,0]);
                s5.append(m[i,1]);
                s6.append(m[i,2]);
            }

        s7.append(m[0,0]).append(m[1,1]).append(m[2,2]);
        s8.append(m[2,0]).append(m[1,1]).append(m[0,2]);

        if (s1.str == "xxx"||s2.str == "xxx"||s3.str == "xxx"
                ||s4.str == "xxx"||s5.str == "xxx"||s6.str == "xxx"||s7.str == "xxx"||s8.str == "xxx"){
            alert("YOU WON!");
            return;
        }
        if (is_last()){
            alert("DRAW!");
            return;
        }
        if (s1.str == "noo"||s4.str == "noo"||s7.str == "noo"){
            show_symbol(0,0,"o");
            alert("YOU LOST!");
        }else if (s1.str == "ono"||s5.str == "noo"){
            show_symbol(0,1,"o");
            alert("YOU LOST!");
        }else if (s1.str == "oon"||s6.str == "noo"||s8.str == "oon"){
            show_symbol(0,2,"o");
            alert("YOU LOST!");
        }else if (s2.str == "noo"||s4.str == "ono"){
            show_symbol(1,0,"o");
            alert("YOU LOST!");
        }else if (s2.str == "ono"||s5.str == "ono"||s7.str == "ono"||s8.str == "ono"){
            show_symbol(1,1,"o");
            alert("YOU LOST!");
        }else if (s2.str == "oon"||s6.str == "ono"){
            show_symbol(1,2,"o");
            alert("YOU LOST!");
        }else if (s3.str == "noo"||s4.str == "oon"||s8.str == "noo"){
            show_symbol(2,0,"o");
            alert("YOU LOST!");
        }else if (s3.str == "ono"||s5.str == "oon"){
            show_symbol(2,1,"o");
            alert("YOU LOST!");
        }else if (s3.str == "oon"||s6.str == "oon"||s7.str == "oon"){
            show_symbol(2,2,"o");
            alert("YOU LOST!");
        }else if (s1.str == "nxx"||s4.str == "nxx"||s7.str == "nxx"){
            show_symbol(0,0,"o");
        }else if (s1.str == "xnx"||s5.str == "nxx"){
            show_symbol(0,1,"o");
        }else if (s1.str == "xxn"||s6.str == "nxx"||s8.str == "xxn"){
            show_symbol(0,2,"o");
        }else if (s2.str == "nxx"||s4.str == "xnx"){
            show_symbol(1,0,"o");
        }else if (s2.str == "xnx"||s5.str == "xnx"||s7.str == "xnx"||s8.str == "xnx"){
            show_symbol(1,1,"o");
        }else if (s2.str == "xxn"||s6.str == "xnx"){
            show_symbol(1,2,"o");
        }else if (s3.str == "nxx"||s4.str == "xxn"||s8.str == "nxx"){
            show_symbol(2,0,"o");
        }else if (s3.str == "xnx"||s5.str == "xxn"){
            show_symbol(2,1,"o");
        }else if (s3.str == "xxn"||s6.str == "xxn"||s7.str == "xxn"){
            show_symbol(2,2,"o");
        }else {
            int p=0;
            int q=0;
              do {
                  p = Random.int_range(0,3);
                  q = Random.int_range(0,3);
              }while (m[p,q] != "n");
            show_symbol(p,q,"o");
        }
    }
    private bool is_last(){
        int k=0;
        for (int i=0;i<3;i++){
            for (int j=0;j<3;j++){
                if (m[i,j] != "n") k++;
            }
        }
        return k==9;
    }
    private void alert (string str){
          var dialog_alert = new Gtk.MessageDialog(this, Gtk.DialogFlags.MODAL, Gtk.MessageType.INFO, Gtk.ButtonsType.OK, str);
          dialog_alert.set_title("Message");
          dialog_alert.run();
          dialog_alert.destroy();
          new_game();
       }
   }
}
