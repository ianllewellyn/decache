# Global decache method for adding a timestamp to a uri when we want to make sure we are
# avoiding browser caching

do ->
	decache = (uri, stamp) ->
		stamp = new Date().getTime() if not stamp
		seperator = if uri.indexOf('?') > -1 then '&' else '?'
		uri.concat seperator, stamp
	
	module.exports = decache
