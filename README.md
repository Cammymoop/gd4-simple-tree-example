# Custom Tree Control Node example for Godot 4

The current `Tree` control node in godot (4.2 soon to be 4.3 as of writing), is very rigidly designed, and the code behind it is a bit of a mess. It's hard to tell when signals actually come out and the parameters that are passed through signals are... less than ideal.

This is just a quick proof-of-concept example of one way to set a custom tree up. Doing it with your own nodes allows you to easily add whatever funcitonality you need for your use-case, whichever signals you need, etc. 

![Screenshot of example tree](https://raw.githubusercontent.com/Cammymoop/gd4-simple-tree-example/master/screenshot.png)

This example uses only one scene to create the tree, a TreeItem which has a method for adding other TreeItems (or other nodes) as children, it can also collapse and show children with a button. Children are indented using a margin container and there's a very basic implementation of those little line graphs that we like to put into tree UIs. I added a button into each tree item that adds a child tree item so that you can try it out with just a single tree item. `treeeeee.tscn` is just a single tree item in a scroll container for your viewing pleasure. Hope it inspires you to throw some containers together and make something pretty!

You only need the `tree_item.tscn` and it's `TreeItem.gd` script to use this. It works more or less automatically, just set the root item as root to avoid it having a stem sticking out.
