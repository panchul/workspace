# Unity

https://unity3d.com/

---

Idiomatic Unity singleton
https://wiki.unity3d.com/index.php/Singleton

--- 

flip/mirror camera samples:
https://answers.unity.com/questions/20337/flipmirror-camera.html                           
https://forum.unity.com/threads/flipping-texture2d-image-within-unity.35974/ - basic pixel by pixel snippet

```
    Texture2D FlipTexture(Texture2D original){
         Texture2D flipped = new Texture2D(original.width,original.height);
         int xN = original.width;
         int yN = original.height;
             
         for(int i=0;i<xN;i++){
             for(int j=0;j<yN;j++){
                 flipped.SetPixel(xN-i-1, j, original.GetPixel(i,j));
             }
         }
         flipped.Apply();
             
         return flipped;
    }
```

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

FileBrowser a la system

Crosstales.FB.FileBrowser nice FileBrowser plugin for Unity

---

Audio on Unity

https://johnleonardfrench.com/articles/10-unity-audio-tips-that-you-wont-find-in-the-tutorials/

https://github.com/deadlyfingers/UnityWav/blob/master/WavUtility.cs

https://answers.unity.com/questions/354401/save-audio-to-a-file.html

https://johnleonardfrench.com/articles/ultimate-guide-to-playscheduled-in-unity/

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
