package task2;

//Пример №2. Применение метки в JavaFX
import javafx.application.*; import javafx.scene.*;
import javafx.stage.*; import javafx.scene.layout.*;
import javafx.scene.control.*;
public class JavaFxLabelDemo extends Application {
    public static void main(String[] args) {
        //Start the JavaFX application by calling launch()
        launch(args);}
    //переопределить метод start()
    @Override
    public void start(Stage stage) {
        //присвоить заголовок подмосткам
        stage.setTitle("Demonstrate а JavaFX label");
        //использовать панель типа FlowPane в качестве корневого узла
        FlowPane rootNode = new FlowPane();
        Label myLabel=new Label("This is а JavaFX label");//создать метку
        rootNode.getChildren().add(myLabel);//ввести метку в граф сцены
        Scene scene = new Scene(rootNode, 400, 200);//создать сцену
        //показать подмостки и сцену на них
        stage.setScene(scene); //установить сцену на подмостках
        stage.show();
    }
}

