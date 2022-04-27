package by.matsuk.FinalProjectShop.controller.command;

import jakarta.servlet.http.HttpServletRequest;

/**
 * The interface Custom command.
 */
public interface CustomCommand {
    /**
     * Execute string.
     *
     * @param request the request
     * @return the string
     */
    String execute(HttpServletRequest request);
}
