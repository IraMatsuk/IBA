package by.matsuk.FinalProjectShop.controller.tag;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.SkipPageException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

/**
 * The type Locale name formatter tag.
 */
public class LocaleNameFormatterTag extends SimpleTagSupport {

    private String initialLocaleName;

    /**
     * Instantiates a new Locale name formatter tag.
     */
    public LocaleNameFormatterTag() {
    }

    /**
     * Sets initial locale name.
     *
     * @param initialLocaleName the initial locale name
     */
    public void setInitialLocaleName(String initialLocaleName) {
        this.initialLocaleName = initialLocaleName;
    }

    @Override
    public void doTag() throws JspException {
        try {
            String formattedLocaleName = initialLocaleName.replaceAll("ru_","");
            formattedLocaleName = formattedLocaleName.replaceAll("en_","");
            getJspContext().getOut().write(formattedLocaleName);
        } catch (Exception e) {
            throw new SkipPageException(e.getMessage());
        }
    }
}
