# このように使うがURLは実際には存在しないので動作しない

futureResult := URL with("http://google.com") @fetch
writeln("Do Something immediately while fetch is in progress...")
writeln("This will block until the result is available.")
writeln("Fetched", futureResult size, " bytes")
