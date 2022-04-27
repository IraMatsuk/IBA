package by.matsuk.FinalProjectShop.exception;

/**
 * The type Interaction exception.
 */
public class InteractionException extends Exception{
    /**
     * Instantiates a new Interaction exception.
     */
    public InteractionException() {
    }

    /**
     * Instantiates a new Interaction exception.
     *
     * @param message the message
     */
    public InteractionException(String message) {
        super(message);
    }

    /**
     * Instantiates a new Interaction exception.
     *
     * @param message the message
     * @param cause   the cause
     */
    public InteractionException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * Instantiates a new Interaction exception.
     *
     * @param cause the cause
     */
    public InteractionException(Throwable cause) {
        super(cause);
    }
}
