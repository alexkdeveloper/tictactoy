using Gtk;

namespace TicTacToe {

    public class MainWindow : Gtk.ApplicationWindow {

        private Label l_1;
        private Label l_2;
        private Label l_3;
        private Label l_4;
        private Label l_5;
        private Label l_6;
        private Label l_7;
        private Label l_8;
        private Label l_9;
        private string a;
        private string[,] m;
        private bool human_start_X = true;

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
                css_provider.load_from_data(".symbols_size {font-size: 60px} .red_symbols {color: red} .green_symbols {color: green}");
                Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), css_provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            } catch (Error e) {
                error ("Cannot load CSS stylesheet: %s", e.message);
        }
        get_style_context ().add_class ("rounded");
        Gtk.HeaderBar headerbar = new Gtk.HeaderBar();
        headerbar.get_style_context().add_class(Gtk.STYLE_CLASS_FLAT);
        headerbar.show_close_button = true;
        set_titlebar(headerbar);
        var new_game_button = new Gtk.Button ();
            new_game_button.set_image (new Gtk.Image.from_icon_name ("input-gaming", Gtk.IconSize.LARGE_TOOLBAR));
            new_game_button.vexpand = false;
          new_game_button.set_tooltip_text("new game");
          new_game_button.clicked.connect(on_new_game_clicked);
          headerbar.pack_start(new_game_button);
          var b_1 = new Button();
          b_1.set_size_request(100, 100);
          l_1 = new Label("");
          b_1.add(l_1);
          l_1.set_xalign((float)0.5);
          l_1.set_yalign((float)0.2);
          l_1.get_style_context().add_class("symbols_size");
          var b_2 = new Button();
          b_2.set_size_request(100, 100);
          l_2 = new Label("");
          b_2.add(l_2);
          l_2.set_xalign((float)0.5);
          l_2.set_yalign((float)0.2);
          l_2.get_style_context().add_class("symbols_size");
          var b_3 = new Button();
          b_3.set_size_request(100, 100);
          l_3 = new Label("");
          b_3.add(l_3);
          l_3.set_xalign((float)0.5);
          l_3.set_yalign((float)0.2);
          l_3.get_style_context().add_class("symbols_size");
          var b_4 = new Button();
          b_4.set_size_request(100, 100);
          l_4 = new Label("");
          b_4.add(l_4);
          l_4.set_xalign((float)0.5);
          l_4.set_yalign((float)0.2);
          l_4.get_style_context().add_class("symbols_size");
          var b_5 = new Button();
          b_5.set_size_request(100, 100);
          l_5 = new Label("");
          b_5.add(l_5);
          l_5.set_xalign((float)0.5);
          l_5.set_yalign((float)0.2);
          l_5.get_style_context().add_class("symbols_size");
          var b_6 = new Button();
          b_6.set_size_request(100, 100);
          l_6 = new Label("");
          b_6.add(l_6);
          l_6.set_xalign((float)0.5);
          l_6.set_yalign((float)0.2);
          l_6.get_style_context().add_class("symbols_size");
          var b_7 = new Button();
          b_7.set_size_request(100, 100);
          l_7 = new Label("");
          b_7.add(l_7);
          l_7.set_xalign((float)0.5);
          l_7.set_yalign((float)0.2);
          l_7.get_style_context().add_class("symbols_size");
          var b_8 = new Button();
          b_8.set_size_request(100, 100);
          l_8 = new Label("");
          b_8.add(l_8);
          l_8.set_xalign((float)0.5);
          l_8.set_yalign((float)0.2);
          l_8.get_style_context().add_class("symbols_size");
          var b_9 = new Button();
          b_9.set_size_request(100, 100);
          l_9 = new Label("");
          b_9.add(l_9);
          l_9.set_xalign((float)0.5);
          l_9.set_yalign((float)0.2);
          l_9.get_style_context().add_class("symbols_size");
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
        if(human_start_X){
            show_symbol(0,0,"x");
        }else{
            show_symbol(0,0,"o");
        }
        logic();
      }

      private void on_b_2_clicked(){
          if (m[0,1] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(0,1,"x");
        }else{
            show_symbol(0,1,"o");
        }
        logic();
      }

      private void on_b_3_clicked(){
          if (m[0,2] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(0,2,"x");
        }else{
            show_symbol(0,2,"o");
        }
        logic();
      }

      private void on_b_4_clicked(){
          if (m[1,0] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(1,0,"x");
        }else{
            show_symbol(1,0,"o");
        }
        logic();
      }

      private void on_b_5_clicked(){
          if (m[1,1] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(1,1,"x");
        }else{
            show_symbol(1,1,"o");
        }
        logic();
      }

      private void on_b_6_clicked(){
          if (m[1,2] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(1,2,"x");
        }else{
            show_symbol(1,2,"o");
        }
        logic();
      }

      private void on_b_7_clicked(){
          if (m[2,0] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(2,0,"x");
        }else{
            show_symbol(2,0,"o");
        }
        logic();
      }

      private void on_b_8_clicked(){
          if (m[2,1] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(2,1,"x");
        }else{
            show_symbol(2,1,"o");
        }
        logic();
      }

      private void on_b_9_clicked(){
          if (m[2,2] != "n"){
            return;
        }
        if(human_start_X){
            show_symbol(2,2,"x");
        }else{
            show_symbol(2,2,"o");
        }
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
                l_1.set_text(s);
                break;
            case 2:
                l_2.set_text(s);
                break;
            case 3:
                l_3.set_text(s);
                break;
            case 4:
                l_4.set_text(s);
                break;
            case 5:
                l_5.set_text(s);
                break;
            case 6:
                l_6.set_text(s);
                break;
            case 7:
                l_7.set_text(s);
                break;
            case 8:
                l_8.set_text(s);
                break;
            case 9:
                l_9.set_text(s);
                break;
            default:
                break;
        }
        m[k,l]=s;
    }
    private void on_new_game_clicked(){
      var dialog = new Granite.MessageDialog.with_image_from_icon_name ("Question", "Start new game?", "dialog-question", Gtk.ButtonsType.NONE);
      dialog.add_button ("No", 0);
      dialog.add_button ("New game with X", 1);
      dialog.add_button ("New game with O", 2);
      dialog.show_all ();
      int result = dialog.run ();
      switch (result) {
          case 0:
              dialog.destroy ();
              break;
          case 1:
              human_start_X = true;
              new_game();
              dialog.destroy ();
              break;
          case 2:
              human_start_X = false;
              new_game();
              logic();
              dialog.destroy ();
              break;
          default:
              break;
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
        l_1.set_text("");
        l_2.set_text("");
        l_3.set_text("");
        l_4.set_text("");
        l_5.set_text("");
        l_6.set_text("");
        l_7.set_text("");
        l_8.set_text("");
        l_9.set_text("");
        color_reset();
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

        string b;

        if(human_start_X){
            a = "o";
            b = "x";
        }else{
            a = "x";
            b = "o";
        }

        if (s1.str == b+b+b||s2.str == b+b+b||s3.str == b+b+b
                ||s4.str == b+b+b||s5.str == b+b+b||s6.str == b+b+b||s7.str == b+b+b||s8.str == b+b+b){
            set_color_symbols(b);
            alert("YOU WON!");
            return;
        }
        if (is_last()){
            alert("DRAWN GAME!");
            return;
        }
        if (s1.str == "n"+a+a||s4.str == "n"+a+a||s7.str == "n"+a+a){
            show_symbol(0,0,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s1.str == a+"n"+a||s5.str == "n"+a+a){
            show_symbol(0,1,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s1.str == a+a+"n"||s6.str == "n"+a+a||s8.str == a+a+"n"){
            show_symbol(0,2,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s2.str == "n"+a+a||s4.str == a+"n"+a){
            show_symbol(1,0,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s2.str == a+"n"+a||s5.str == a+"n"+a||s7.str == a+"n"+a||s8.str == a+"n"+a){
            show_symbol(1,1,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s2.str == a+a+"n"||s6.str == a+"n"+a){
            show_symbol(1,2,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s3.str == "n"+a+a||s4.str == a+a+"n"||s8.str == "n"+a+a){
            show_symbol(2,0,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s3.str == a+"n"+a||s5.str == a+a+"n"){
            show_symbol(2,1,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s3.str == a+a+"n"||s6.str == a+a+"n"||s7.str == a+a+"n"){
            show_symbol(2,2,a);
            set_color_symbols(a);
            alert("YOU LOST!");
        }else if (s1.str == "n"+b+b||s4.str == "n"+b+b||s7.str == "n"+b+b){
            show_symbol(0,0,a);
        }else if (s1.str == b+"n"+b||s5.str == "n"+b+b){
            show_symbol(0,1,a);
        }else if (s1.str == b+b+"n"||s6.str == "n"+b+b||s8.str == b+b+"n"){
            show_symbol(0,2,a);
        }else if (s2.str == "n"+b+b||s4.str == b+"n"+b){
            show_symbol(1,0,a);
        }else if (s2.str == b+"n"+b||s5.str == b+"n"+b||s7.str == b+"n"+b||s8.str == b+"n"+b){
            show_symbol(1,1,a);
        }else if (s2.str == b+b+"n"||s6.str == b+"n"+b){
            show_symbol(1,2,a);
        }else if (s3.str == "n"+b+b||s4.str == b+b+"n"||s8.str == "n"+b+b){
            show_symbol(2,0,a);
        }else if (s3.str == b+"n"+b||s5.str == b+b+"n"){
            show_symbol(2,1,a);
        }else if (s3.str == b+b+"n"||s6.str == b+b+"n"||s7.str == b+b+"n"){
            show_symbol(2,2,a);
        }else {
            int p=0;
            int q=0;
              do {
                  p = Random.int_range(0,3);
                  q = Random.int_range(0,3);
              }while (m[p,q] != "n");
            show_symbol(p,q,a);
        }
        if(!human_start_X&&is_last()){
            logic();
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
    private void color_reset(){
            l_1.get_style_context().remove_class("red_symbols");
            l_2.get_style_context().remove_class("red_symbols");
            l_3.get_style_context().remove_class("red_symbols");
            l_4.get_style_context().remove_class("red_symbols");
            l_5.get_style_context().remove_class("red_symbols");
            l_6.get_style_context().remove_class("red_symbols");
            l_7.get_style_context().remove_class("red_symbols");
            l_8.get_style_context().remove_class("red_symbols");
            l_9.get_style_context().remove_class("red_symbols");

            l_1.get_style_context().remove_class("green_symbols");
            l_2.get_style_context().remove_class("green_symbols");
            l_3.get_style_context().remove_class("green_symbols");
            l_4.get_style_context().remove_class("green_symbols");
            l_5.get_style_context().remove_class("green_symbols");
            l_6.get_style_context().remove_class("green_symbols");
            l_7.get_style_context().remove_class("green_symbols");
            l_8.get_style_context().remove_class("green_symbols");
            l_9.get_style_context().remove_class("green_symbols");
    }
    private void set_color_symbols(string s){
        string c;
        if(s == a){
            c = "red_symbols";
        }else{
            c = "green_symbols";
        }
        if (l_1.get_text()==s&&l_2.get_text()==s&&l_3.get_text()==s){
            l_1.get_style_context().add_class(c);
            l_2.get_style_context().add_class(c);
            l_3.get_style_context().add_class(c);
        }else if(l_4.get_text()==s&&l_5.get_text()==s&&l_6.get_text()==s){
            l_4.get_style_context().add_class(c);
            l_5.get_style_context().add_class(c);
            l_6.get_style_context().add_class(c);
        }else if(l_7.get_text()==s&&l_8.get_text()==s&&l_9.get_text()==s){
            l_7.get_style_context().add_class(c);
            l_8.get_style_context().add_class(c);
            l_9.get_style_context().add_class(c);
        }else if(l_1.get_text()==s&&l_4.get_text()==s&&l_7.get_text()==s){
            l_1.get_style_context().add_class(c);
            l_4.get_style_context().add_class(c);
            l_7.get_style_context().add_class(c);
        }else if(l_2.get_text()==s&&l_5.get_text()==s&&l_8.get_text()==s){
            l_2.get_style_context().add_class(c);
            l_5.get_style_context().add_class(c);
            l_8.get_style_context().add_class(c);
        }else if(l_3.get_text()==s&&l_6.get_text()==s&&l_9.get_text()==s){
            l_3.get_style_context().add_class(c);
            l_6.get_style_context().add_class(c);
            l_9.get_style_context().add_class(c);
        }else if(l_1.get_text()==s&&l_5.get_text()==s&&l_9.get_text()==s){
            l_1.get_style_context().add_class(c);
            l_5.get_style_context().add_class(c);
            l_9.get_style_context().add_class(c);
        }else if(l_3.get_text()==s&&l_5.get_text()==s&&l_7.get_text()==s){
            l_3.get_style_context().add_class(c);
            l_5.get_style_context().add_class(c);
            l_7.get_style_context().add_class(c);
        }
    }
    private void alert (string str){
           var dialog = new Granite.MessageDialog.with_image_from_icon_name ("Message", str, "dialog-warning");
                  dialog.show_all ();
                  dialog.run ();
                  dialog.destroy ();
                  new_game();
                  if(!human_start_X){
                      logic();
                  }
       }
   }
}
