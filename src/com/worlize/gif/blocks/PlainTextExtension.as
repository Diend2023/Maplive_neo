package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.BlockType;
   import com.worlize.gif.errors.FileTypeError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class PlainTextExtension implements IGIFBlockCodec
   {
      
      public var text:String;
      
      public var metadataBlock:DataBlock;
      
      public function PlainTextExtension()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         var textBytes:ByteArray = null;
         var stream:IDataInput = param1;
         try
         {
            this.metadataBlock = new DataBlock();
            this.metadataBlock.decode(stream);
            textBytes = DataBlock.decodeDataBlocks(stream);
         }
         catch(e:FileTypeError)
         {
            throw new FileTypeError("Error while decoding a plain text block.");
         }
         this.text = textBytes.readMultiByte(textBytes.length,"ascii");
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         if(param1 === null)
         {
            param1 = new ByteArray();
            param1.endian = Endian.LITTLE_ENDIAN;
         }
         param1.writeByte(BlockType.EXTENSION);
         param1.writeByte(BlockType.PLAIN_TEXT_EXT);
         param1.writeBytes(this.metadataBlock.encode());
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeMultiByte(this.text,"ascii");
         param1.writeBytes(DataBlock.encodeDataBlocks(_loc2_));
         return param1;
      }
      
      public function dispose() : void
      {
      }
   }
}

