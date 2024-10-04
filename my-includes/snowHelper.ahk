/*

Shows an Input to run a search for snow items;
The Run to be executed depends on the content of the input value.

*/

class SnowInput {
	Call()
	{
		SNOW_URL := EnvGet("SNOW_URL")
		
		SNOW_LINK_INC := SNOW_URL . '/nav_to.do?uri=incident.do?sys_id='
		SNOW_LINK_KB := SNOW_URL . '/kb_view.do?sysparm_article='
		SNOW_LINK_PRB := SNOW_URL . '/nav_to.do?uri=problem.do?sys_id='
		SNOW_LINK_SEARCH := SNOW_URL . '/textsearch.do?sysparm_search='

		WINDOW_TITLE := "Service Now"
		INPUT_LABEL := "
		(
			Search SNOW Items:`n
			INC - Incident Number
			PRB - Problem Number
			KB  - Knowledge Base Number
			/    - general text search
		)"

		; actions/options
		KB := "KB"
		INC := "INC"
		PRB := "PRB"
		SEARCH := "/"

		item := InputBox(INPUT_LABEL, WINDOW_TITLE, "w240 h180").value

		; evaluates the input and runs the command
		If InStr( SubStr(item, 1, 3), INC ) 
			Run BROWSER_PROFILE1 . " " . SNOW_LINK_INC . item
		If InStr( SubStr(item, 1, 3), PRB ) 
			Run BROWSER_PROFILE1 . " " . SNOW_LINK_PRB . item
		If InStr(SubStr(item, 1, 2), KB) 
			Run BROWSER_PROFILE1 . " " . SNOW_LINK_KB . item
		If InStr( SubStr(item, 1, 1), SEARCH ) 
			Run BROWSER_PROFILE1 . " " . SNOW_LINK_SEARCH . UrlEncode(SubStr(item, 2))
		If (item == "" )
			return
		Else 
			myToolTip("No options available.", 2000)
	}
}