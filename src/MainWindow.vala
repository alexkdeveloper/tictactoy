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
        private bool first_X = true;

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
                css_provider.load_from_data(".symbols_size {font-size: 60px}");
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
        if(first_X){
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
              first_X = true;
              new_game();
              dialog.destroy ();
              break;
          case 2:
              first_X = false;
              new_game();
              logic();
              dialog.destroy ();
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

        string a;
        string b;

        if(first_X){
            a = "o";
            b = "x";
        }else{
            a = "x";
            b = "o";
        }

        if (s1.str == b+b+b||s2.str == b+b+b||s3.str == b+b+b
                ||s4.str == b+b+b||s5.str == b+b+b||s6.str == b+b+b||s7.str == b+b+b||s8.str == b+b+b){
            alert("YOU WON!");
            return;
        }
        if (is_last()){
            alert("DRAWN GAME!");
            return;
        }
        if (s1.str == "n"+a+a||s4.str == "n"+a+a||s7.str == "n"+a+a){
            show_symbol(0,0,a);
            alert("YOU LOST!");
        }else if (s1.str == a+"n"+a||s5.str == "n"+a+a){
            show_symbol(0,1,a);
            alert("YOU LOST!");
        }else if (s1.str == a+a+"n"||s6.str == "n"+a+a||s8.str == a+a+"n"){
            show_symbol(0,2,a);
            alert("YOU LOST!");
        }else if (s2.str == "n"+a+a||s4.str == a+"n"+a){
            show_symbol(1,0,a);
            alert("YOU LOST!");
        }else if (s2.str == a+"n"+a||s5.str == a+"n"+a||s7.str == a+"n"+a||s8.str == a+"n"+a){
            show_symbol(1,1,a);
            alert("YOU LOST!");
        }else if (s2.str == a+a+"n"||s6.str == a+"n"+a){
            show_symbol(1,2,a);
            alert("YOU LOST!");
        }else if (s3.str == "n"+a+a||s4.str == a+a+"n"||s8.str == "n"+a+a){
            show_symbol(2,0,a);
            alert("YOU LOST!");
        }else if (s3.str == a+"n"+a||s5.str == a+a+"n"){
            show_symbol(2,1,a);
            alert("YOU LOST!");
        }else if (s3.str == a+a+"n"||s6.str == a+a+"n"||s7.str == a+a+"n"){
            show_symbol(2,2,a);
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
        if(!first_X&&is_last()){
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
    private void alert (string str){
           var dialog = new Granite.MessageDialog.with_image_from_icon_name ("Message", str, "dialog-warning");
                  dialog.show_all ();
                  dialog.run ();
                  dialog.destroy ();
                  new_game();
                  if(!first_X){
                      logic();
                  }
       }
   }
}
