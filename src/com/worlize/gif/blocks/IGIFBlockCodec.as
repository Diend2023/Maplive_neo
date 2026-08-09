package com.worlize.gif.blocks
{
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   
   public interface IGIFBlockCodec
   {
      
      function decode(param1:IDataInput) : void;
      
      function encode(param1:ByteArray = null) : ByteArray;
      
      function dispose() : void;
   }
}

