# 333zzz

use_random_seed 999

set_volume! 2

use_bpm 60

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :m1 do
  sleep 1
end

live_loop :kick, sync: :m1 do
  #stop
  sample :bd_klub, amp: 2 if pattern (knit, "x-x-", 8, "xxxx", 1).choose
  sleep 0.25
end

live_loop :chats, sync: :m1 do
  stop
  sample :drum_cymbal_closed, amp: 0.025
  sleep 0.25
end

live_loop :ohats, sync: :m1 do
  stop
  sample :drum_cymbal_open, amp: 0.0125 if pattern "--x-"
  sleep 0.125
end

live_loop :clap, sync: :m1 do
  #stop
  sample :elec_snare, cutoff: 100, rpitch: 7, amp: 0.05 if pattern "--x-"
  sleep 0.25
end

with_fx :slicer, invert_wave: true, phase: 0.5, smooth: 0.3, mix: 1 do
  with_fx :reverb, mix: 0.7 do
    with_fx :hpf, cutoff: 60 do
      
      use_synth :hollow
      use_synth_defaults amp: 1.5
      
      live_loop :note1, sync: :m1 do
        #stop
        play choose([:A4,:E4]), attack: 6, release: 6
        sleep 8
      end
      
      live_loop :note2, sync: :m1 do
        #stop
        play choose([:Cs5,:G4]), attack: 4, release: 5
        sleep 10
      end
      
      use_synth :dark_ambience
      use_synth_defaults amp: 1.75
      
      live_loop :note3, sync: :m1 do
        #stop
        play choose([:D3, :G3]), attack: 7, release: 3
        sleep 6
      end
      
      live_loop :note4, sync: :m1 do
        #stop
        play choose([:Fs4, :B4]), attack: 3, release: 7
        sleep 5
      end
      
    end
  end
  
  with_fx :reverb do
    with_fx :echo do
      use_synth :piano
      use_synth_defaults attack: 0.1, release: 0.2, amp: 0.5
      live_loop :piano, sync: :m1 do
        #stop
        play choose([:r, :r, :r, :Fs6, :r, :r, :r, :A6, :r, :r, :r, :B5, :r, :r, :r, :E6, :r, :r, :r, :A5, :r, :r, :r, :D6, :r, :r, :r, :G6, :r, :r, :r, :Cs6, :r, :r, :r]), pan: rrand(-0.6, 0.6)
        sleep 3
      end
    end
  end
  
  with_fx :reverb do
    with_fx :lpf do
      use_synth :hollow
      use_synth_defaults amp: 2
      live_loop :bass, sync: :m1 do
        #stop
        play choose([:r, :A2, :r, :Cs3, :r, :E3, :r,]), attack: 4, release: 4, cutoff: 90
        sleep 5
      end
    end
  end
end
