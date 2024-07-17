[Home](Readme.md)
# Unity

https://unity3d.com/

See Also:

 - [AugmentedReality](AugmentedReality.md)
 - [UnrealEngine](UnrealEngine.md)
 - [Quaternions](Quaternions.md)
 - [Graphics](Graphics.md)
 - [Godot](Godot.md)

---

**Content**

- [Audio on Unity](Unity.md#Audio-on-Unity)
- [Controls](Unity.md#Controls)
- [Positioning](Unity.md#Positioning)
- [Motions](Unity.md#Motions)
- [Camera controls](Unity.md#Camera-controls)
- [UI](Unity.md#UI)
- [AR/VR](Unity.md#arvr)
- [Compiling](Unity.md#Compiling)
- [Testing](Unity.md#testing)
- [Deployment](Unity.md#deployment)
  - [Deploying to WebGL](Unity.md#deploying-to-webgl)
  - [Deploying to Android](Unity.md#deploying-to-android)
  - [Deploying for AR/VR](Unity.md#deploying-for-arvr)
- [Authentication](Unity.md#authentication)
- [Miscellaneous](Unity.md#Miscellaneous)

---

## Audio on Unity

---

https://johnleonardfrench.com/articles/10-unity-audio-tips-that-you-wont-find-in-the-tutorials/

https://github.com/deadlyfingers/UnityWav/blob/master/WavUtility.cs

https://answers.unity.com/questions/354401/save-audio-to-a-file.html

https://johnleonardfrench.com/articles/ultimate-guide-to-playscheduled-in-unity/

---

## Controls

---

There are some deprecated controls, I think this one works on the latest Unity:

```
//if (Input.GetMouseButton(0))
if (Input.GetMouseButtonDown(0))
{
   // if(Time.time >= nextFire)
    {
        // from here: https://forum.unity.com/threads/make-my-bow-shoot-help-please.358610/
        Projectile fabProjectile = Resources.Load<Projectile>("Prefabs/Objects/Projectile");
        Projectile gProjectile;
        Vector3 pt_pos = Camera.main.ScreenToWorldPoint(Input.mousePosition); // Vector3.zero;
        Quaternion pt_rot = Quaternion.identity;
        nextFire = Time.time + fireRate;
        gProjectile = (Projectile)Instantiate(fabProjectile, pt_pos, pt_rot) as Projectile;
        gProjectile.Launch(pt_pos);
        shotSound.Play();
        //projectiles.Add(gProjectile);
        Destroy(gProjectile, 10.0f);
    }
}
```
---

## Positioning

---

Example of camera-to-world translations and instantiating of an object from a prefab.

```
Projectile fabProjectile = Resources.Load<Projectile>("Prefabs/Objects/Projectile");
Projectile gProjectile;
Vector3 pt_pos = Camera.main.ScreenToWorldPoint(Input.mousePosition); // Vector3.zero;
Quaternion pt_rot = Quaternion.identity;
nextFire = Time.time + fireRate;
gProjectile = (Projectile)Instantiate(fabProjectile, pt_pos, pt_rot) as Projectile;
gProjectile.Launch(pt_pos);
```

---

## Motions

---

I implemented a simple clock, placing ClockHand objects on a clock face.

```
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ClockHand : MonoBehaviour
{
public GameObject _hand;
public int _type = 0; // 0 - seconds, 1 - minutes, 2 - hours, 3 - calendar,

    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
        var rot = System.DateTime.Now.Hour * 60 * 60
                + System.DateTime.Now.Minute * 60
                + System.DateTime.Now.Second
                ;
        switch (_type)
        {
            case 0:
                rot %= 60;
                rot *= 6;
                break;
            case 1:
                rot /= 60;
                rot %= 60;
                rot *= 6;
                break;
            case 2:
                rot /= 60*60;
                rot %= 24;
                rot *= 360/24;
                break;
        }
        print($"hour is {System.DateTime.Now.Hour} minutes {System.DateTime.Now.Minute} seconds {System.DateTime.Now.Second}");
        transform.rotation = Quaternion.Euler(0,0,-(float)rot);
    }
}
```

---

## Camera controls

--- 

Flip/mirror camera samples:

https://answers.unity.com/questions/20337/flipmirror-camera.html                           
https://forum.unity.com/threads/flipping-texture2d-image-within-unity.35974/ - basic pixel by pixel snippet

```
Texture2D FlipTexture(Texture2D original) {
     Texture2D flipped = new Texture2D(original.width,original.height);
     int xN = original.width;
     int yN = original.height;
         
     for(int i=0;i<xN;i++) {
         for(int j=0;j<yN;j++) {
             flipped.SetPixel(xN-i-1, j, original.GetPixel(i,j));
         }
     }
     flipped.Apply();
     return flipped;
}
```

---

## UI

---

Unity UI Tutorial | An introduction

https://www.youtube.com/watch?v=IuuKUaZQiSU

---

Unity UI Toolkit in 5 Minutes

https://www.youtube.com/watch?v=yUXFHAOXhcA

---

## AR/VR

---

## Compiling

Here is the link to CLI: https://docs.unity3d.com/Manual/EditorCommandLineArguments.html

Create a build script:

```
using UnityEditor;
class MyEditorScript
{
     static void PerformBuild ()
     {
        BuildPlayerOptions buildPlayerOptions = new BuildPlayerOptions();
        buildPlayerOptions.scenes = new[] { "Assets/Scene1.unity", "Assets/Scene2.unity" };
        BuildPipeline.BuildPlayer(buildPlayerOptions);
     }
}
```

Then, on Mac:

    $ /Applications/Unity/Unity.app/Contents/MacOS/Unity -quit -batchmode -projectPath ~/UnityProjects/MyProject -executeMethod MyEditorScript.PerformBuild

Or, on Windows:

    $ "C:\Program Files\Unity\Editor\Unity.exe" -quit -batchmode -projectPath "C:\Users\UserName\Documents\MyProject" -executeMethod MyEditorScript.PerformBuild

---

## Testing

---

Here is the link to the snippets with async tests, etc.:

https://docs.unity3d.com/Manual/CLIBatchmodeCoroutines.html

---

## Deployment

### Deploying to WebGL 

---

Uploading WebGL deployments:

https://docs.unity3d.com/Manual/webgl-building.html
https://www.youtube.com/watch?v=s9kpPI-_QDA

---

### Deploying to Android

---

---

### Deploying for AR/VR

---

## Authentication

---

There is a Unity support for [FireBase](https://firebase.google.com/)

---

## Miscellaneous 

---

Neat Unity snippets. Several ways of loading an image at runtime

http://gyanendushekhar.com/2017/07/08/load-image-runtime-unity/

---

A simple implementation of drawing a graph. 
https://www.youtube.com/watch?v=CmU5-v-v1Qo

--- 

Unity handtracking.
https://skarredghost.com/2020/01/03/how-to-oculus-quest-hands-sdk-unity/

---

Unity ML-Agents Release 10, Beginner Walkthrough
https://www.youtube.com/watch?v=6lilCUCX4ik

Unity ML-Agents Toolkit
https://github.com/Unity-Technologies/ml-agents

---

Idiomatic Unity singleton
https://wiki.unity3d.com/index.php/Singleton

---

- https://learn.unity.com/tutorial/rendering-and-shading?signup=true#
- https://www.youtube.com/watch?v=aK-Y8zU0pQM -- scrolling
- https://www.youtube.com/watch?v=BTSBL8fi3rE  -- scrolling
- https://www.youtube.com/watch?v=zCkC5e_Pkz4 – shaders
- https://www.youtube.com/watch?v=A-GkNM8M5p8 – large tutorial on Unity
- The shader script assets for the Unity samples: http://bit.ly/firstshader

---

Neat tutorial about making a Flappy Bird in 3 hours.
https://www.youtube.com/watch?v=A-GkNM8M5p8

---

Simple JSON implementation

http://www.defectivestudios.com and the github.com for jsonobject project

---

Unity Singleton

https://wiki.unity3d.com/index.php/Singleton - UnitySingleton implementation

---

From Unity chats, about making games:

1. Define your game concept: Decide what type of game you want to make, what the gameplay mechanics will be, and what the overall story or theme will be. Consider the audience you want to target and what type of game will appeal to them.

2. Choose your game engine: There are many game engines available, such as Unity, Unreal Engine, and Godot. Research the features, tools, and costs of each engine, and choose one that fits your needs and skill level.

3. Create a development plan: Break down your game concept into smaller tasks and create a timeline or schedule for completing them. This plan should include milestones, deadlines, and resources required for each task.

4. Create a prototype: Start with a basic prototype that includes only the core gameplay mechanics. This will help you test and refine your ideas before adding more complexity.

5. Develop the game: Use your development plan to guide your progress, and create game assets, program the game mechanics, and test your game frequently. Iterate and make changes based on feedback and testing.

6. Publish and market your game: Once your game is complete, publish it on a platform such as Steam, the App Store, or Google Play. Create marketing materials such as trailers, screenshots, and social media posts to promote your game and attract players.

Remember that making a video game can be a complex and time-consuming process, but it can also be a rewarding experience. It's important to stay motivated, stay organized, and stay open to feedback and suggestions throughout the development process.

---

FileBrowser a la system

Crosstales.FB.FileBrowser nice FileBrowser plugin for Unity

---

Applying Materials, shaders, textures, etc.

https://www.youtube.com/watch?v=MGIBLPIz4oM

---
