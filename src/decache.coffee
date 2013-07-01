
do ->
	# Global decache method for adding a timestamp to a uri when we want to make sure we are
	# avoiding browser caching
	decache = (uri, stamp) ->
		stamp = new Date().getTime() if not stamp
		seperator = if uri.indexOf('?') > -1 then '&' else '?'
		uri.concat seperator, stamp
	
	#--------------------------------------------------
	
	# Export as a module for use in node
	module?.exports = decache
	
	# Attach to the window for global use in the browser
	window?.decache = decache
	
	# Define 'decache' for AMD/requirejs
	if typeof define is 'function' and define.amd and typeof define.amd is 'object'
		define 'decache', [], -> decache
