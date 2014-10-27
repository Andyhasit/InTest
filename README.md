InTest
======

A tiny test framework for productive developers

##Overview

__InTest__ lets you write unit tests anywhere in your code, even __inside__ your logic classes, without the need to import additional references, use decorators, or set up an extra project to house your tests.

It runs on a mere 30 lines of code, currently in [Boo](https://github.com/bamboo/boo) only (translations to other languages welcome, .Net or otherwise), and that's all it needs!

##Why is this useful?

__1 - A separate unit test project creates extra work.__

The unit test project becomes a codebase on its own which needs to be organised, maintained, and taken into account whenever you want to make changes. That's extra work, but with your tests inside the main files and classes you do away with all that!

__2 - You can keep your tests in the same files__

You are far more likely to write, update and __read__ tests if you don't have to go finding them in another file. It's also less time-consuming. Try it, you might just find yourself being more productive!

__3 - Use TDD to develop private methods too__

TDD purists say you should only test public interfaces, and most frameworks are built on that premise. But what if you want some of the benefits of TDD (faster run-test-change iteration, documentation by test, and bug catching) for your private methods too?

Being able to see and control private members also means less jumping through hoops to set up tests.

__5 - Better creative flow__

Designing usually means coming up with an idea, part-implementing it, finding out it can't work that way, changing it around a bit, and then thinking of an even better way to do it. 

Having to worry about unit tests in some distant files, or worse, insisting that the unit tests are written first just kills the creative flow.

##But I don't want my code bloated with tests!

So long as you stick to one class per file and your classes are relatively small (which they generally are if you follow the [single responsibility principle](http://en.wikipedia.org/wiki/Single_responsibility_principle)) and put your test code at the bottom, this shouldn't really be a problem.

Besdies, you don't __have__ to write the test methods inside your classes, you can create separate class to hold your test methods if you prefer. 

I'm also working on a way to strip test methods during compilation for production code.

##OK, so how do I use it?

1 - Copy the source file into your project (There's only [Boo](https://github.com/bamboo/boo) so far, but it's only 30 lines and can easily be translated to VB or C#, anyone?)

2 - Set up a way to call __RunTests()__ in debug mode, or if you pass __"test"__ as your command line argument for example.

```Boo
if argv.Length == 1 and argv[0] == "test":
	RunTests()
else:
    RunNormally(argv)
```

__RunTests()__ will look for any instance or class method that starts with __"Test"__.

For every method it finds, it instantiates the defining class and calls the method with no arguments. A test fails, if it raises an exception, else it is deemed a pass.

##Limitations

1. Any setup or teardown functionality will have to be called explicitly in your test method, which I prefer anyway as it makes it clearer what's going on.
2. There's no feature to run individual tests yet, you have to do them all.
3. It uses FormatterServices.GetUninitializedObject() which means any code in your constructor might not run.
4. There is no equivalent of Assert.Throws(). You need to do this yourself.

##Contributing

See limitations above.

Could also do with translations into other languages:
 - C#
 - VB
 - IronPython (likely to be identical) 

I'd prefer to keep them all in the same repo rather than a separate one for each, but fork if you feel like it.

I'm also looking for a way to remove methods starting with __Test__ as part of the compile step, I'm sure this is something the [Boo Compiler](https://github.com/bamboo/boo/wiki/Boo-Compiler) could handle.

##Summary

I know this is a big README for something that's less than 30 lines of code, but it just goes to show that small can be powerful.

I also wanted to showcase how cool [Boo](https://github.com/bamboo/boo) is.
