package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.BlockType;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class TrailerBlock implements IGIFBlockCodec
   {
      
      public function TrailerBlock()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeByte(BlockType.TRAILER);
         return param1;
      }
      
      public function dispose() : void
      {
      }
   }
}

