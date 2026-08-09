package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.BlockType;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class CommentExtension implements IGIFBlockCodec
   {
      
      public var text:String;
      
      public function CommentExtension()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         var _loc2_:ByteArray = DataBlock.decodeDataBlocks(param1);
         this.text = _loc2_.readMultiByte(_loc2_.length,"ascii");
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(this.text,"ascii");
         param1.writeByte(BlockType.EXTENSION);
         param1.writeByte(BlockType.COMMENT_EXT);
         param1.writeBytes(DataBlock.encodeDataBlocks(_loc2_));
         return param1;
      }
      
      public function dispose() : void
      {
      }
   }
}

