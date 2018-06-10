package SkyTV.keywords;

public class RunOnFailure{
	protected String runOnFailureKeyword = "Capture Page Screenshot";
	//protected Logging logging;
	public String registerKeywordToRunOnFailure(String keyword) {
		String oldKeyword = runOnFailureKeyword;
		String oldKeywordText = oldKeyword != null ? oldKeyword : "No keyword";

		String newKeyword = !keyword.trim().toLowerCase().equals("nothing") ? keyword : null;
		String newKeywordText = newKeyword != null ? newKeyword : "No keyword";

		runOnFailureKeyword = newKeyword;
		//logging.info(String.format("%s will be run on failure.", newKeywordText));

		return oldKeywordText;
	}
	
}