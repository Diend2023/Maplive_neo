package tmx
{
   import io.arkeus.tiled.TiledObjectLayer;
   
   public class MapEidtLayer extends MapLayer
   {
      
      public var layer:TiledObjectLayer;
      
      public function MapEidtLayer(param1:String)
      {
         super(param1);
      }
      
      override public function getName() : String
      {
         return this.layer.name;
      }
   }
}

