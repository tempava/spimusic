# sine chords and stuff song

use_bpm 40

use_synth :sine
use_synth_defaults amp: 0.75, attack: 0.25, sustain: 1.75, release: 0.5
in_thread do
  12.times do
    play_chord [:e3, :gs3, :b3, :ds4]
    sleep 2
    play_chord [:d3, :fs3, :a3, :gs4]
    sleep 2
  end
end

sleep 6
use_synth :sine
use_synth_defaults amp: 0.75, attack: 1.5, sustain: 1.5, release: 1
in_thread do
  6.times do
    play :e4
    sleep 3
    play :gs4
    sleep 3
    play :b4
    sleep 1
    play :e4, sustain: 0.5
    sleep 1
  end
end

in_thread do
  with_fx :hpf, mix: 0.3 do
    sleep 10
    8.times do
      sample :arovane_beat_c, amp: 0.7, rate: 120.0/130.0
      sleep 4
    end
  end
end

in_thread do
  sleep 12
  with_fx :lpf do
    6.times do
      sample :arovane_beat_e, amp: 0.5, rate: 120.0/130.0
      sleep 4
    end
  end
end

in_thread do
  sleep 14
  with_fx :slicer, mix: 0.3 do
    with_fx :lpf do
      use_synth :subpulse
      use_synth_defaults amp: 0.4, attack: 0.25, sustain: 1.25, release: 0.5
      in_thread do
        4.times do
          play :e2
          sleep 2
          play :d2
          sleep 2
          play :gs2
          sleep 2
          play :fs2
          sleep 2
        end
      end
    end
  end
end
