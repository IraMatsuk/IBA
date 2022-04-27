package by.matsuk.FinalProjectShop.exception;

/**
 * The type Pool custom exception.
 */
public class PoolCustomException extends Exception{
    /**
     * Instantiates a new Pool custom exception.
     */
    public PoolCustomException() {
    }

    /**
     * Instantiates a new Pool custom exception.
     *
     * @param message the message
     */
    public PoolCustomException(String message) {
        super(message);
    }

    /**
     * Instantiates a new Pool custom exception.
     *
     * @param message the message
     * @param cause   the cause
     */
    public PoolCustomException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * Instantiates a new Pool custom exception.
     *
     * @param cause the cause
     */
    public PoolCustomException(Throwable cause) {
        super(cause);
    }
}