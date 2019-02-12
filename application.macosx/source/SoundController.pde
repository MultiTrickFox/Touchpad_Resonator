import processing.sound.*;

final int hm_waves = 3;


class SoundController {
  
 
  Env           env;
  
  //LowPass   lowPass;
  //HighPass highPass;
  //BandPass bandPass;
  
  Delay       delay;
  Reverb     reverb;
    
  TriOsc     triOsc;
  SawOsc     sawOsc;
  SqrOsc     sqrOsc;
  
  //SinOsc    sinOsc1;
  //SinOsc    sinOsc2;
  //SinOsc    sinOsc3;
  
  ArrayList<SoundObject> dasContainer;
  
    
  SoundController(PApplet activity) {
            
    env        = new Env(activity);
    
    //lowPass    = new LowPass(activity);
    //highPass   = new HighPass(activity);
    //bandPass   = new BandPass(activity);
    
    delay      = new Delay(activity);
    reverb     = new Reverb(activity);
    
    triOsc     = new TriOsc(activity);
    sawOsc     = new SawOsc(activity);
    sqrOsc     = new SqrOsc(activity);
    
    dasContainer = new ArrayList();
    
    for (int i = 0; i < hm_waves; i++)
    
      dasContainer.add(new SinOsc(activity));
    
    //dasContainer.add(triOsc);
    //dasContainer.add(sawOsc);
    //dasContainer.add(sqrOsc);
    
    //for (SoundObject wave : dasContainer) {     // todo : uncomment me.
      
    //  delay.process(wave);
    //  reverb.process(wave);
      
    //} 
              
  }
  
  void update_params( OscMessage msg
  
                     //float delay_time,
                     //float delay_repeats,
                     //float delay_feedback,
                     
                     //float reverb_damp, 
                     //float reverb_room, 
                     //float reverb_wet,
                     
                     //float attack_time,
                     //float sustain_time,
                     //float sustain_level,
                     //float release_time,
  
                     ////float tri_freq,  float tri_amp,  float tri_pan,
                     ////float saw_freq,  float saw_amp,  float saw_pan,
                     ////float sqr_freq,  float sqr_amp,  float sqr_pan,
  
                     //float sin1_freq, float sin1_amp, float sin1_pan,
                     //float sin2_freq, float sin2_amp, float sin2_pan,
                     //float sin3_freq, float sin3_amp, float sin3_pan

                     
                     ) {
    
    int item_id = 0;               
    for (int i = 0; i < hm_waves; i++) {
      
      SinOsc wave = (SinOsc) dasContainer.get(i);
      wave.freq(msg.get(item_id).floatValue()*500);
      wave.amp(msg.get(item_id+1).floatValue());
      wave.pan(msg.get(item_id+2).floatValue()-0.5);
      dasContainer.set(i, wave);
      
      item_id +=3;
      
    }
    
    delay.feedback(msg.get(item_id).floatValue());
    delay.time(msg.get(item_id+1).floatValue());
    
    reverb.damp(msg.get(item_id+2).floatValue());
    reverb.room(msg.get(item_id+3).floatValue());
    reverb.wet(msg.get(item_id+4).floatValue());
    
      
    float attack_time   = msg.get(item_id+5).floatValue();
    float sustain_time  = msg.get(item_id+6).floatValue();
    float sustain_level = msg.get(item_id+7).floatValue();
    float release_time  = msg.get(item_id+8).floatValue();
                                      
                                                      
    //triOsc.freq(tri_freq*1000);
    // triOsc.amp(0);
    //triOsc.pan(tri_pan);
    
    //sawOsc.freq(saw_freq*1000);
    //sawOsc.amp(0);
    //sawOsc.pan(saw_pan);

    //sqrOsc.freq(sqr_freq*1000);
    // sqrOsc.amp(0);
    //sqrOsc.pan(sqr_pan);


    for (SoundObject wave : dasContainer)
      wave.play();
      // env.play(wave, attack_time, sustain_time, sustain_level, release_time);
    
    
    // 3 params for lo-hi-band pass
    // upper bound - lower bound
    // filter type
    
    
    // lowPass.freq(200);
    // highPass.freq(20);
    // lowPass.process(waves[0]);
    // bandPass.process(waves[0], freq_low, freq_high);
                       
  }
  
  
}
