# Jammin Ghost Collision Shapes - Godot 4.x Plugin

Ever had trouble seeing your collision shapes? This tiny addon gives you editor-only ghostly collision shapes (meshes) that mimic your collision shapes, so it's easy to see where they are and how well they match up to your models. You can turn them on and off with a simple checkbox, and during the game they act as simple CollisionShape3Ds.

> **Note:** Starting with Godot 4.4, collision shapes will have built-in support for custom debug colors! See [godotengine/godot#90644](https://github.com/godotengine/godot/pull/90644). However, this plugin still provides some things like the ghost effect and individual shape control that that won't be available in the core engine.

![GhostCollisionShape3D](https://github.com/user-attachments/assets/754c7229-4e0b-4708-b526-6474e5fd742f)

![Editor view](https://github.com/user-attachments/assets/1dc4420b-6e51-44bd-a419-3c235474a45f)

Watch the YouTube short here:

<a href="https://youtube.com/shorts/hm1-zX81HA0" alt="YouTube Short about GhostCollisionShape3D">
<img width="200" src="https://img.youtube.com/vi/hm1-zX81HA0/hqdefault.jpg?" alt="YouTube Short about GhostCollisionShape3D">
</a>

Find more info about this, and more, at [jammin.games](https://jammin.games).

## Installation

Copy the `addons/jammin_ghost_collision_shapes` folder into your Godot project in the same location (addons/) as your other Godot plugins. Then enable the plugin in the Godot Project Settings -> Plugins tab.

## Usage

Instead of adding a CollisionShape3D node to your scene, add a GhostCollisionShape3D node instead. You'll get an extra checkbox in the inspector to toggle the ghost shape on and off.

The ghost shape will only be visible in the editor, and during the game it will act as a simple CollisionShape3D.

Currently supported shapes:

- SphereShape3D
- BoxShape3D
- CapsuleShape3D
- CylinderShape3D

Shapes not yet supported:

- ConcavePolygonShape3D
- ConvexPolygonShape3D
- HeightMapShape3D
- PlaneShape3D
- Any 2D shapes (this is 3D only)

## Issues

If you find any issues, please feel free to open an issue or pull request. Note that I don't watch Github issues very closely, so if you need a faster response, contact me on Discord (jamonholmgren) and send me the link to the issue.

## License

This addon is free to use and modify, but I would love it if you would give credit to Jamon Holmgren (jammin.games).

License: MIT
