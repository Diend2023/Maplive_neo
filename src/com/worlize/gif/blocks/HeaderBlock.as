package com.worlize.gif.blocks
{
   import com.worlize.gif.constants.GifVersion;
   import com.worlize.gif.errors.FileTypeError;
   import com.worlize.gif.errors.OutOfDataError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class HeaderBlock implements IGIFBlockCodec
   {
      
      public var bytes:ByteArray;
      
      public var identifier:String;
      
      public var version:String;
      
      public function HeaderBlock()
      {
         super();
      }
      
      public function decode(param1:IDataInput) : void
      {
         if(param1.bytesAvailable < 6)
         {
            throw new OutOfDataError("Ran out of data while reading GIF header.");
         }
         this.bytes = new ByteArray();
         param1.readBytes(this.bytes,0,6);
         this.identifier = this.bytes.readMultiByte(6,"ascii");
         if(this.identifier.slice(0,3) !== "GIF")
         {
            throw new FileTypeError("Invalid file type.");
         }
         this.version = this.identifier.slice(3);
         if(this.version !== GifVersion.VERSION_87A && this.version !== GifVersion.VERSION_89A)
         {
            throw new FileTypeError("Unsupported GIF version: " + this.version);
         }
         this.bytes.position = 0;
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         switch(param1)
         {
            case null:
               param1 = new ByteArray();
               param1.endian = Endian.LITTLE_ENDIAN;
               param1.writeMultiByte("GIF","ascii");
               if(["89a","87a"].indexOf(this.version) !== -1)
               {
                  break;
               }
            case param1.writeMultiByte("GIF","ascii"),-1:
               throw new Error("Invalid GIF version specified.");
         }
         param1.writeMultiByte(this.version,"ascii");
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

