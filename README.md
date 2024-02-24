# Custom Tree Control Node example for Godot 4

The current `Tree` control node in godot (4.2 soon to be 4.3 as of writing), is very rigidly designed, and the code behind it is a bit of a mess. It's hard to tell when signals actually come out and the parameters that are passed through signals are... less than ideal.

This is just a quick proof-of-concept example of one way to set a custom tree up. Doing it with your own nodes allows you to easily add whatever funcitonality you need for your use-case, whichever signals you need, etc. 
