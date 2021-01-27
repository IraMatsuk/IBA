package task6;

//Пример №6. Использование всплывающих подсказок
import javafx.scene.control.PasswordField;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Tooltip;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

public class TooltipExample extends Application {
    final PasswordField pf = new PasswordField();
    final Tooltip tooltip = new Tooltip();
    public static void main(String[] args) {
        launch(args);
    }

    @Override
    public void start(Stage stage) {
        Scene scene = new Scene(new Group());
        stage.setTitle("Tooltip Sample");
        stage.setWidth(330);
        stage.setHeight(150);
        tooltip.setText("\nYour password must be\n"
                        + "at least 8 characters in length\n");
        pf.setTooltip(tooltip);
        HBox root = new HBox();
        root.getChildren().add(pf);
        root.setSpacing(40);
        root.setPadding(new Insets(20, 10, 10, 20));
        ((Group) scene.getRoot()).getChildren().add(root);
        stage.setScene(scene);
        stage.show();
    }
}
