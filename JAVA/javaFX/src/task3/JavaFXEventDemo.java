package task3;

//Пример №3. Применение экранных кнопок и обработка событий в JavaFX
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.FlowPane;
import javafx.stage.Stage;
public class JavaFXEventDemo extends Application {
    public static void main(String[] args) {
        // запустить JаvаFХ-приложение, вызвав метод launch()
        launch(args);
    }
    // переопределить метод start()
    @Override
    public void start(Stage stage) {
        // присвоить заголовок подмосткам
        stage.setTitle("Обработка событий от кнопок");
        // Использовать панель поточной компоновки FlowPane в
        //качестве корневого узла. Установить промежутки между элементам
        //управления по горизонтали и по вертикали равными 10
        FlowPane rootNode = new FlowPane(20, 10);
        // выровнять элементы управления по центру сцены
        rootNode.setAlignment(Pos.CENTER);
        // создать метку
        Label response = new Label("Нажмите любую кнопку"); //Нажать кнопку
        // Adding images
        Image img1 = new Image("images/information.png");
        Image img2 = new Image("images/close.png");
        // создать две экранные кнопки
        Button btnAbout = new Button("О компании", new ImageView(img1));
        Button btnClose = new Button("Закрыть", new ImageView(img2));
        // обработать события действия от кнопки aBOUT
        btnAbout.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ае) {
                response.setText("Нажата кнопка \"О Компании\"");
            }
        });
        // обработать события действия от кнопки Вetа
        btnClose.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ае) {
                response.setText("Нажата кнопка \"Закрыть\"");
            }
        });
        // ввести метку и кнопки в граф сцены
        rootNode.getChildren().addAll(btnAbout, btnClose,
                response);
        // создать сцену
        Scene scene = new Scene(rootNode, 550, 100);
        // установить сцену на подмостках
        stage.setScene(scene);
        // показать подмостки и сцену на них
        stage.show();
    }
}
