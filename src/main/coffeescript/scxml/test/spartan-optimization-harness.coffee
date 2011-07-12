require ["scxml/test/optimization-harness","scxml/test/report2string","scxml/test/simple-env"],(optimizationHarness,report2string,SimpleEnv) ->

	this.console =
		log : this.print
		info : this.print
		error : this.print
		debug : this.print

	finish = (report) ->
		console.info report2string report

		#all spartan environments support quit()
		quit report.testCount == report.testsPassed

	env = new SimpleEnv()

	optimizationHarness env.setTimeout,env.clearTimeout,finish

	env.mainLoop()
