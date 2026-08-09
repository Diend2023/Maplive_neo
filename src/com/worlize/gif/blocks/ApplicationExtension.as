package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.BlockType;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class ApplicationExtension implements IGIFBlockCodec
   {
      
      public var appIdentifier:String;
      
      public var appAuthCode:String;
      
      public var bytes:ByteArray;
      
      public function ApplicationExtension()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         var _loc2_:DataBlock = new DataBlock();
         _loc2_.decode(param1);
         this.appIdentifier = _loc2_.bytes.readMultiByte(8,"ascii");
         this.appAuthCode = _loc2_.bytes.readMultiByte(3,"ascii");
         this.bytes = DataBlock.decodeDataBlocks(param1);
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(this.appIdentifier.length !== 8)
         {
            throw new Error("Application Extension field appIdentifier must be exactly 8 characters long.");
         }
         if(this.appAuthCode.length !== 3)
         {
            throw new Error("Application Extension field appAuthCode must be exactly 3 characters long.");
         }
         var _loc2_:DataBlock = new DataBlock();
         _loc2_.bytes = new ByteArray();
         _loc2_.bytes.writeMultiByte(this.appIdentifier,"ascii");
         _loc2_.bytes.writeMultiByte(this.appAuthCode,"ascii");
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeByte(BlockType.EXTENSION);
         param1.writeByte(BlockType.APPLICATION_EXT);
         param1.writeBytes(_loc2_.encode());
         param1.writeBytes(DataBlock.encodeDataBlocks(this.bytes));
         return param1;
      }
      
      public function dispose() : void
      {
         if(this.bytes)
         {
            this.bytes.clear();
            this.bytes = null;
         }
      }
   }
}

