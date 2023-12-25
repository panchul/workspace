[Home](Readme.md)
# Mutex

See Also:

 - [Linux](Linux.md) 
 - [Semaphore](Semaphore.md) 

---

Mutexes vs semaphores demo:

    // Task 1
    pthread_mutex_lock(mutex_thing);
    // Safely use shared resource
    pthread_mutex_unlock(mutex_thing);
 
    // Task 2
    pthread_mutex_lock(mutex_thing);
    // Safely use shared resource
    pthread_mutex_lock(mutex_thing);

The semaphore scenario is more like signalling between the processes:

    /* Task 1 - Producer */
    sema_post(&sem);   // Send the signal

    /* Task 2 - Consumer */
    sema_wait(&sem);   // Wait for signal
  
---
