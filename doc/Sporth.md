# Sporth

A sound-generating scripting language, manipulates with harmonics, etc. Uses stack to do all that.

https://audiomasher.org/learn

---

This is how a sample looks like:

    # store melody in a table
    _seq "0 5 0 3 0 3 5 0 3" gen_vals
    
    # create beat and half-beat triggers
    _half var _beat var
    4 metro _half set
    _half get 2 0 tdiv _beat set
    
    # play melody with a sine wave
    (_half get 0 _seq tseq 75 +) mtof 0.1 sine
    
    # apply envelopes on beats and half-beats
    _half get 0.001 0.1 0.2 tenvx *
    _beat get 0.001 0.1 0.2 tenvx *
    
    # add delay
    dup (0.5 (4 inv) delay) (0.4 *) +

---