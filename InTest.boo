"""
https://github.com/Andyhasit/InTest
"""
namespace InTestExample # Change this to your namespace.

import System
import System.Reflection
import System.Runtime.Serialization

def RunTests():
	passCount = 0
	failCount = 0
	previousConsoleColour = Console.ForegroundColor
	print "Running Tests"
	myAssembly = Assembly.GetExecutingAssembly()
	for type in myAssembly.GetTypes():
		for methodInfo in type.GetMethods():
			if methodInfo.Name.StartsWith("Test"):
				try:
					myObject = FormatterServices.GetUninitializedObject(type)
					methodInfo.Invoke(myObject, null)
					Console.ForegroundColor = ConsoleColor.Green
					print "${methodInfo.Name}"
					passCount += 1
				except e as Exception:
					Console.ForegroundColor = ConsoleColor.Red
					print "${methodInfo.Name}"
					print e
					failCount += 1
	Console.ForegroundColor = previousConsoleColour
	print "Found ${passCount + failCount} tests. Pass: ${passCount}. Fail: ${failCount}."
	Console.ReadLine()