{
  description = ''UI building with Gnome's Glade'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-uibuilder-0_2_0.flake = false;
  inputs.src-uibuilder-0_2_0.owner = "ba0f3";
  inputs.src-uibuilder-0_2_0.ref   = "refs/tags/0.2.0";
  inputs.src-uibuilder-0_2_0.repo  = "uibuilder.nim";
  inputs.src-uibuilder-0_2_0.type  = "github";
  
  inputs."ui".owner = "nim-nix-pkgs";
  inputs."ui".ref   = "master";
  inputs."ui".repo  = "ui";
  inputs."ui".type  = "github";
  inputs."ui".inputs.nixpkgs.follows = "nixpkgs";
  inputs."ui".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."https://github.com/ba0f3/xml.nim@".owner = "nim-nix-pkgs";
  inputs."https://github.com/ba0f3/xml.nim@".ref   = "master";
  inputs."https://github.com/ba0f3/xml.nim@".repo  = "https://github.com/ba0f3/xml.nim@";
  inputs."https://github.com/ba0f3/xml.nim@".type  = "github";
  inputs."https://github.com/ba0f3/xml.nim@".inputs.nixpkgs.follows = "nixpkgs";
  inputs."https://github.com/ba0f3/xml.nim@".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-uibuilder-0_2_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-uibuilder-0_2_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}