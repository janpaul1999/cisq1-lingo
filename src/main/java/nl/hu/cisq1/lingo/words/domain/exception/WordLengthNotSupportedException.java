package nl.hu.cisq1.lingo.words.domain.exception;

public class WordLengthNotSupportedException extends RuntimeException {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public WordLengthNotSupportedException(Integer length) {
        super("Could not find word of length " + length);
    }
}
