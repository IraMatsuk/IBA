package task5;

//Пример №5. Применение вращения, масштабирования, свечения, внутренней тени для элементов GUI
import javafx.application.*;
import javafx.scene.*;
import javafx.stage.*;
import javafx.scene.layout.*;
import javafx.scene.control.*;
import javafx.event.*;
import javafx.geometry.*;
import javafx.scene.transform.*;
import javafx.scene.effect.*;
import javafx.scene.paint.*;

public class EffectsAndTransformsDemo extends Application {
    double angle = 0.0;
    double glowVal = 0.0;
    boolean shadow = false;
    double scaleFactor = 1.0;
    // создать первоначальные эффекты и преобразования
    Glow glow = new Glow(0.0);
    InnerShadow innerShadow = new InnerShadow(10.0, Color.RED);
    Rotate rotate = new Rotate();
    Scale scale = new Scale(scaleFactor, scaleFactor);
    // создать четыре экранные кнопки
    Button btnRotate = new Button("Rotate");
    Button btnGlow = new Button("Glow");
    Button btnShadow = new Button("Shadow off");
    Button btnScale = new Button("Scale");
    public static void main(String[] args) {
        // запустить Jаvа FХ-приложение, вызвав метод launch()
        launch(args);
    }
    // переопределить метод start()
    @Override
    public void start(Stage stage) {
        // присвоить заголовок подмосткам
        stage.setTitle("Effects and Transforms Demo");
        //Использовать панель поточной компоновки FlowPane в качестве корневого узла.
        // В данном случае с промежутками 10 по вертикали и по горизонтали
        FlowPane rootNode = new FlowPane(10, 10);
        // выровнять элементы управления по центру сцены
        rootNode.setAlignment(Pos.CENTER);
        // создать сцену
        Scene scene = new Scene(rootNode, 300, 100);
        // установить сцену на подмостках
        stage.setScene(scene);
        // задать первоначальный эффект свечения
        btnGlow.setEffect(glow);
        // ввести вращение в список преобразований для кнопки Rotate
        btnRotate.getTransforms().add(rotate);
        //ввести масштабирование в список преобразований для кнопки Scale
        btnScale.getTransforms().add(scale);
        // обработать события действия от кнопки Rotate
        btnRotate.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ае) {
                //когда кнопка нажимается, она поворачивается на 30 градусов вокруг своего центра
                angle += 30.0;
                rotate.setAngle(angle);
                rotate.setPivotX(btnRotate.getWidth() / 2);
                rotate.setPivotY(btnRotate.getHeight() / 2);
            }
        });
        // обработать события действия от кнопки Scale
        btnScale.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ае) {
                //когда кнопка нажимается, изменяется ее масштаб
                scaleFactor += 0.1;
                if (scaleFactor > 1.0) {
                    scaleFactor = 0.4;
                }
                scale.setX(scaleFactor);
                scale.setY(scaleFactor);
            }
        });
        // обработать события действия от кнопки Glow
        btnGlow.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ае) {
                //когда кнопка нажимается, изменяется степень ее свечения
                glowVal += 0.1;
                if (glowVal > 1.0) {
                    glowVal = 0.0;
                }
// установить новое значение свечения
                glow.setLevel(glowVal);
            }
        });
        // обработать события действия от кнопки Shadow
        btnShadow.setOnAction(new EventHandler<ActionEvent>() {
            public void handle(ActionEvent ае) {
                //когда кнопка нажимается, изменяется состояние ее затенения
                        shadow = !shadow;
                if (shadow) {
                    btnShadow.setEffect(innerShadow);
                    btnShadow.setText("Shadow on");
                } else {
                    btnShadow.setEffect(null);
                    btnShadow.setText("Shadow off");
                }
            }
        });
        // ввести метку и кнопки в граф сцены
        rootNode.getChildren().addAll(btnRotate, btnScale, btnGlow,
                btnShadow);
        // показать подмостки и сцену на них
        stage.show();
    }
}
