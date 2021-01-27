package task4;

//Пример №4. Рисование на холсте
import javafx.application.*;
import javafx.scene.*;
import javafx.stage.*;
import javafx.scene.layout.*;
import javafx.scene.control.*;
import javafx.event.*;
import javafx.geometry.*;
import javafx.scene.canvas.*;
import javafx.scene.paint.*;
import javafx.scene.text.*;

public class DirectDrawDemo extends Application {
    GraphicsContext gc;
    Color[] colors = {Color.RED, Color.BLUE, Color.GREEN,
            Color.BLACK, Color.AQUAMARINE, Color.ANTIQUEWHITE};
    int colorIdx = 0;
    public static void main(String[] args) {
        // запустить JаvаFХ-приложение, вызвав метод launch()
        launch(args);
    }
    // переопределить метод start()
    @Override
    public void start(Stage stage) {
        // присвоить заголовок подмосткам
        stage.setTitle("Draw Directly to а Canvas.");
        // Использовать панель поточной компоновки FlowPane в качестве корневого узла
        FlowPane rootNode = new FlowPane();
        // расположить узлы по центру сцены
        rootNode.setAlignment(Pos.CENTER);
        // создать сцену
        Scene scene = new Scene(rootNode, 450, 450);
        // установить сцену на подмостках
        stage.setScene(scene);
        // создать холст
        Canvas myCanvas = new Canvas(400, 400);
        // получить графический контекст для холста
        gc = myCanvas.getGraphicsContext2D();
        // создать экранную кнопку
        Button btnChangeColor = new Button("Change Color");
        // обработать события действия от кнопки btnChangeColor
        btnChangeColor.setOnAction(new EventHandler<ActionEvent>(){
            public void handle(ActionEvent ае) {
                // задать цвет обводки и заливки
                gc.setStroke(colors[colorIdx]);
                gc.setFill(colors[colorIdx]);
                // Перерисовать линию, текст и заполненный прямоугольник новым цветом.
                //При этом цвет остальных узлов графа сцены останется без изменения
                gc.strokeLine(0, 0, 200, 200);
                gc.fillText("This is drawn on the canvas.", 60,
                        50);
                gc.fillRect(100, 320, 300, 40);
                gc.fillOval(0, 0, 20, 20);
                // изменить цвет
                colorIdx++;
                if (colorIdx == colors.length) colorIdx = 0;
            }});
        //нарисовать на холсте графические объекты, первоначально выводимые на экран
        gc.strokeLine(0, 0, 200, 200);
        gc.strokeOval(100, 100, 200, 200);
        gc.strokeRect(0, 200, 50, 200);
        gc.fillOval(0, 0, 20, 20);
        gc.fillRect(100, 320, 300, 40);
        // задать шрифт размером 20 и воспроизвести текст
        gc.setFont(new Font(20));
        gc.fillText("This is drawn on the canvas.", 60, 50);
        // ввести холст и кнопку в граф сцены
        rootNode.getChildren().addAll(myCanvas, btnChangeColor);
        // показать подмостки и сцену на них
        stage.show();
    }
}
