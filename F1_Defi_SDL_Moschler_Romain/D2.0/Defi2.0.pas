program planes;
{$UNITPATH \SDL2}
//BUT: Faire un programme utilisant SDL2 dans FreePascal
//ENTREE:
//SORTIE:
uses crt, sdl2;

const
  Border:  TSDL_Rect = (x: 0;   y:   0; w: 640; h: 480);
  Quarter: TSDL_Rect = (x: 320; y: 240; w: 320; h: 240);

var
  sdlWindow1: PSDL_Window;
  sdlRenderer: PSDL_Renderer;
  texture: PSDL_Texture;
  surface: PSDL_Surface;
  rectangle: TSDL_Rect;
begin

  // initilization of video subsystem
  if SDL_Init(SDL_INIT_VIDEO) < 0 then
    Halt;

  if SDL_CreateWindowAndRenderer(1000, 1000, SDL_WINDOW_SHOWN, @sdlWindow1, @sdlRenderer) <> 0 then
    	Halt;

 	 // set scaling filter
 	 SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'linear');

 	// set logical resolution
  if SDL_RenderSetLogicalSize(sdlRenderer, 640, 480) <> 0 then
  	Halt;

 	 // carrer rouge
  SDL_SetRenderDrawColor(sdlRenderer, 255, 0, 0, SDL_ALPHA_OPAQUE);
  SDL_RenderDrawRect(sdlRenderer, @Border);

  // carrer vert
  SDL_SetRenderDrawColor(sdlRenderer, 0, 255, 0, SDL_ALPHA_OPAQUE);
  SDL_RenderDrawRect(sdlRenderer, @Quarter);

	// Load le rider
  surface:= SDL_LoadBMP('AssetsF1_F2/rider.bmp');
  if surface = nil then Halt;
  texture:= SDL_CreateTextureFromSurface(sdlRenderer, surface);
  if texture = nil then Halt;
  rectangle.x:= 100;
  rectangle.y:= 100;
  rectangle.w:= 100;
  rectangle.h:= 100;


  SDL_RenderCopy( sdlRenderer, texture, nil, @rectangle);

  // Attendre 3 seconde
  SDL_RenderPresent(sdlRenderer);
  SDL_Delay(3000);

  // Effacer la memoire
  SDL_DestroyRenderer(sdlRenderer);
  SDL_DestroyWindow (sdlWindow1);
  SDL_FreeSurface(surface);
  SDL_DestroyTexture(texture);

  // fermer SDL2
  SDL_Quit;

end.
