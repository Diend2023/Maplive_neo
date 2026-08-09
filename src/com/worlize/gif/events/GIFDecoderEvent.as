package com.worlize.gif.events
{
   import flash.events.Event;
   
   public class GIFDecoderEvent extends Event
   {
      
      public static const DECODE_COMPLETE:String = "decodeComplete";
      
      public function GIFDecoderEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}

