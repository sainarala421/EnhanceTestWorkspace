package co.nz.enhanceconsulting.utils;

/**
 * A raised exception of this type ends all test executions.
 */
@SuppressWarnings("serial")
public class Selenium2LibraryFatalException extends RuntimeException {

	/**
	 * Mark this exception as fatal
	 */
	public static final boolean ROBOT_EXIT_ON_FAILURE = true;

	public Selenium2LibraryFatalException() {
		super();
	}

	public Selenium2LibraryFatalException(String string) {
		super(string);
	}

	public Selenium2LibraryFatalException(Throwable t) {
		super(t);
	}

	public Selenium2LibraryFatalException(String string, Throwable t) {
		super(string, t);
	}
}