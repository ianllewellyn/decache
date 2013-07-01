
decache = require '../../src/decache'

describe 'window.decache', ->
	
	it 'should add a timestamp to the url', ->
		
		decache('/API/Image').should.match /\/API\/Image\?\d+$/
	
	describe 'when the url already has arguments', ->
		
		it 'should add the timestamp with an & not a ?', ->
			
			decache('/API/Image?width=100').should.match /\/API\/Image\?width=100&\d+$/
	
	describe 'when the \'stamp\' paramater is passed in', ->
		
		it 'should use the stamp instad of a timestamp', ->
			
			decache('/API/Image', '01062013').should.match /\/API\/Image\?01062013$/
		
		describe 'when the url already has arguments', ->
			
			it 'should add the timestamp with an & not a ?', ->
				
				decache('/API/Image?width=100', '01062013').should.match /\/API\/Image\?width=100&01062013$/
