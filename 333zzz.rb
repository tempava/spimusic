# 333zzz
# on soundcloud: https://soundcloud.com/avasarchive/333zzz
# based on ambient experiment by darin wilson
# note1 .. note 4 play one of two randomly selected pitches with two different synths. attacks, releases, and sleeps are different so they move in and out of phase with each other
# piano randomly selects a pitch to be played (in this case, the a mixolydian scale), but only sometimes, because nothing (:r) is predominantly picked
# bass randomly selects one of three pitches or nothing

use_random_seed 333

with_fx :reverb, mix: 0.7 do
  with_fx :hpf, cutoff: 60 do
    
    use_synth :hollow
    use_synth_defaults amp: 2.75
    
    live_loop :note1 do
      play choose([:A4,:E4]), attack: 6, release: 6
      sleep 8
    end
    
    live_loop :note2 do
      play choose([:Cs5,:G4]), attack: 4, release: 5
      sleep 10
    end
    
    use_synth :dark_ambience
    use_synth_defaults amp: 3
    
    live_loop :note3 do
      play choose([:D3, :G3]), attack: 7, release: 3
      sleep 6
    end
    
    live_loop :note4 do
      play choose([:Fs4, :B4]), attack: 3, release: 7
      sleep 5
    end
    
  end
end

with_fx :reverb do
  with_fx :echo do
    use_synth :piano
    use_synth_defaults attack: 0.1, release: 0.2
    live_loop :piano do
      play choose([:r, :r, :r, :Fs6, :r, :r, :r, :A6, :r, :r, :r, :B5, :r, :r, :r, :E6, :r, :r, :r, :A5, :r, :r, :r, :D6, :r, :r, :r, :G6, :r, :r, :r, :Cs6, :r, :r, :r]), pan: rrand(-0.6, 0.6)
      sleep 3
    end
  end
end

with_fx :reverb do
  with_fx :lpf do
    use_synth :hollow
    live_loop :bass do
      play choose([:r, :A0, :r, :Cs1, :r, :E1, :r,]), attack: 4, release: 4, amp: 3.25
      sleep 5
    end
  end
end
