import java.util.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import javax.sound.sampled.*;


class STAudioInputController extends SettingsReceiver{
    public STAudioInput stethoscope;


    STAudioInputController(Settings def){
        super(def);

        this.stethoscope = new STAudioInput(def, def.GLOBALMINIM, def.AUDIOINPUTCHANNEL);

        

    }


    public float[] getSampleAverages(int resolution){

        float[] partialAverages = new float[resolution];

        for(int i = 0; i < resolution; i++){
            float[] bufferPartial = this.stethoscope.getBufferPartial(i, resolution);
            partialAverages[i] = this.getBufferPartialAverage(bufferPartial);
        }
        return partialAverages;

    }

    public float getBufferPartialAverage(float[] bufferPartial){
        float tmp = 0.0;
        int samplecount = 0;
        for(float sample: bufferPartial){
            // if(sample < 0) sample *= -1;
            if(sample > 0){
                tmp += sample;
                samplecount++;
            }
            
        }
        return tmp / samplecount;
    }

    public float[] getAudioMappedTo(float max, int resolution){
        float[] sampleAverages = this.getSampleAverages(resolution);
        float[] mapped = new float[sampleAverages.length];
        for(int i = 0; i < sampleAverages.length; i++){
            mapped[i] = 100 + (sampleAverages[i] * max);
        }
        return mapped;
    }




}