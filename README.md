# Utility
Various Utility functions that make life easier

### API
```
Utility.GetDescendants(Object)
Much like GetChildren, except GetDescendants efficiently gets the children of children, and so on

Utility.CallOnChildren(Object, Function)
Calls Function on every child of Object

Utility.CallOnDescendants(Object, Function)
Calls Function on every descendant of Object
```

As you can see in the source code, the CallOn functions are little more than basic for loop wrappers, but `GetDescendants` is a very important function that should be built-in to the platform but isn't
