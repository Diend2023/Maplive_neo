package tmx
{
   import utils.Base64;
   
   public class PoltDisplay extends SaveObject
   {
      
      public var dialogue:String = "left";
      
      public var poltData:Array;
      
      public function PoltDisplay()
      {
         super();
      }
      
      override public function getName() : String
      {
         return instanceName;
      }
      
      public function getPath() : String
      {
         return "";
      }
      
      public function applyObject(param1:Object) : void
      {
         var _loc2_:Object = null;
         for(_loc2_ in param1)
         {
            try
            {
               if(_loc2_ == "poltData")
               {
                  if(param1[_loc2_] is Array)
                  {
                     this.poltData = param1[_loc2_];
                  }
                  else
                  {
                     this.poltData = JSON.parse(Base64.decode(param1[_loc2_])) as Array;
                  }
               }
               else
               {
                  this[_loc2_] = param1[_loc2_];
               }
            }
            catch(e:Error)
            {
            }
         }
      }
      
      override public function toObject() : Object
      {
         return {
            "x":this.x,
            "y":this.y,
            "name":this.getName(),
            "path":this.getPath(),
            "scaleX":this.scaleX,
            "scaleY":this.scaleY,
            "blendMode":this.starlingBlendMode,
            "dialogue":this.dialogue,
            "poltData":Base64.encode(JSON.stringify(this.poltData)),
            "instanceName":this.instanceName,
            "other":this.other,
            "width":this.width,
            "height":this.height,
            "noChange":this.noChange
         };
      }
      
      public function get currentInstanceName() : String
      {
         if(this.instanceName == "" || this.instanceName == null)
         {
            return this.getName();
         }
         return this.instanceName;
      }
   }
}

