package com.worlize.gif.events
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   
   public class AsyncDecodeErrorEvent extends ErrorEvent
   {
      
      public static const ASYNC_DECODE_ERROR:String = "asyncDecodeError";
      
      public function AsyncDecodeErrorEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = "", param5:int = 0)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         return new AsyncDecodeErrorEvent(type,bubbles,cancelable,text,errorID);
      }
   }
}

