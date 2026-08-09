package com.worlize.gif.blocks
{
   import com.worlize.gif.errors.FileTypeError;
   import flash.utils.ByteArray;
   import flash.utils.Endian;
   import flash.utils.IDataInput;
   
   public class NetscapeExtension implements IGIFBlockCodec
   {
      
      public static const APP_IDENTIFIER:String = "NETSCAPE";
      
      public static const APP_AUTH_CODE:String = "2.0";
      
      protected var appExtension:ApplicationExtension;
      
      public var loopCount:uint = 0;
      
      public function NetscapeExtension()
      {
         super();
         this.appExtension = new ApplicationExtension();
         this.appExtension.appIdentifier = APP_IDENTIFIER;
         this.appExtension.appAuthCode = APP_AUTH_CODE;
      }
      
      public function decodeFromApplicationExtension(param1:ApplicationExtension) : void
      {
         this.appExtension = param1;
         if(this.appExtension.appIdentifier !== APP_IDENTIFIER || this.appExtension.appAuthCode !== APP_AUTH_CODE)
         {
            throw new FileTypeError("Unknown application data block.  Was expecting a NETSCAPE2.0 block.");
         }
         if(this.appExtension.bytes.readUnsignedByte() === 1)
         {
            this.loopCount = this.appExtension.bytes.readUnsignedShort();
         }
      }
      
      public function decode(param1:IDataInput) : void
      {
         var _loc2_:ApplicationExtension = new ApplicationExtension();
         _loc2_.decode(param1);
         this.decodeFromApplicationExtension(_loc2_);
      }
      
      public function encode(param1:ByteArray = null) : ByteArray
      {
         var _loc2_:ByteArray = null;
         this.appExtension.bytes = _loc2_ = new ByteArray();
         _loc2_.endian = Endian.LITTLE_ENDIAN;
         _loc2_.writeByte(1);
         _loc2_.writeShort(this.loopCount);
         _loc2_.position = 0;
         return this.appExtension.encode(param1);
      }
      
      public function dispose() : void
      {
      }
   }
}

