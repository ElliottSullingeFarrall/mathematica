<<"lib/maTHEMEatica.wl";

lattePalette = <|
  "Rosewater" -> RGBColor["#dc8a78"],
  "Flamingo" -> RGBColor["#dd7878"],
  "Pink" -> RGBColor["#ea76cb"],
  "Mauve" -> RGBColor["#8839ef"],
  "Red" -> RGBColor["#d20f39"],
  "Maroon" -> RGBColor["#e64553"],
  "Peach" -> RGBColor["#fe640b"],
  "Yellow" -> RGBColor["#df8e1d"],
  "Green" -> RGBColor["#40a02b"],
  "Teal" -> RGBColor["#179299"],
  "Sky" -> RGBColor["#04a5e5"],
  "Sapphire" -> RGBColor["#209fb5"],
  "Blue" -> RGBColor["#1e66f5"],
  "Lavender" -> RGBColor["#7287fd"],
  "Text" -> RGBColor["#4c4f69"],
  "Subtext1" -> RGBColor["#5c5f77"],
  "Subtext0" -> RGBColor["#6c6f85"],
  "Overlay2" -> RGBColor["#7c7f93"],
  "Overlay1" -> RGBColor["#8c8fa1"],
  "Overlay0" -> RGBColor["#9ca0b0"],
  "Surface2" -> RGBColor["#acb0be"],
  "Surface1" -> RGBColor["#bcc0cc"],
  "Surface0" -> RGBColor["#ccd0da"],
  "Base" -> RGBColor["#eff1f5"],
  "Mantle" -> RGBColor["#e6e9ef"],
  "Crust" -> RGBColor["#dce0e8"]
|>;

frappePalette = <|
  "Rosewater" -> RGBColor["#f2d5cf"],
  "Flamingo" -> RGBColor["#eebebe"],
  "Pink" -> RGBColor["#f4b8e4"],
  "Mauve" -> RGBColor["#ca9ee6"],
  "Red" -> RGBColor["#e78284"],
  "Maroon" -> RGBColor["#ea999c"],
  "Peach" -> RGBColor["#ef9f76"],
  "Yellow" -> RGBColor["#e5c890"],
  "Green" -> RGBColor["#a6d189"],
  "Teal" -> RGBColor["#81c8be"],
  "Sky" -> RGBColor["#99d1db"],
  "Sapphire" -> RGBColor["#85c1dc"],
  "Blue" -> RGBColor["#8caaee"],
  "Lavender" -> RGBColor["#babbf1"],
  "Text" -> RGBColor["#c6d0f5"],
  "Subtext1" -> RGBColor["#b5bfe2"],
  "Subtext0" -> RGBColor["#a5adce"],
  "Overlay2" -> RGBColor["#949cbb"],
  "Overlay1" -> RGBColor["#838ba7"],
  "Overlay0" -> RGBColor["#737994"],
  "Surface2" -> RGBColor["#626880"],
  "Surface1" -> RGBColor["#51576d"],
  "Surface0" -> RGBColor["#414559"],
  "Base" -> RGBColor["#303446"],
  "Mantle" -> RGBColor["#292c3c"],
  "Crust" -> RGBColor["#232634"]
|>;

macchiatoPalette = <|
  "Rosewater" -> RGBColor["#f4dbd6"],
  "Flamingo" -> RGBColor["#f0c6c6"],
  "Pink" -> RGBColor["#f5bde6"],
  "Mauve" -> RGBColor["#c6a0f6"],
  "Red" -> RGBColor["#ed8796"],
  "Maroon" -> RGBColor["#ee99a0"],
  "Peach" -> RGBColor["#f5a97f"],
  "Yellow" -> RGBColor["#eed49f"],
  "Green" -> RGBColor["#a6da95"],
  "Teal" -> RGBColor["#8bd5ca"],
  "Sky" -> RGBColor["#91d7e3"],
  "Sapphire" -> RGBColor["#7dc4e4"],
  "Blue" -> RGBColor["#8aadf4"],
  "Lavender" -> RGBColor["#b7bdf8"],
  "Text" -> RGBColor["#cad3f5"],
  "Subtext1" -> RGBColor["#b8c0e0"],
  "Subtext0" -> RGBColor["#a5adcb"],
  "Overlay2" -> RGBColor["#939ab7"],
  "Overlay1" -> RGBColor["#8087a2"],
  "Overlay0" -> RGBColor["#6e738d"],
  "Surface2" -> RGBColor["#5b6078"],
  "Surface1" -> RGBColor["#494d64"],
  "Surface0" -> RGBColor["#363a4f"],
  "Base" -> RGBColor["#24273a"],
  "Mantle" -> RGBColor["#1e2030"],
  "Crust" -> RGBColor["#181926"]
|>;

mochaPalette = <|
  "Rosewater" -> RGBColor["#f5e0dc"],
  "Flamingo" -> RGBColor["#f2cdcd"],
  "Pink" -> RGBColor["#f5c2e7"],
  "Mauve" -> RGBColor["#cba6f7"],
  "Red" -> RGBColor["#f38ba8"],
  "Maroon" -> RGBColor["#eba0ac"],
  "Peach" -> RGBColor["#fab387"],
  "Yellow" -> RGBColor["#f9e2af"],
  "Green" -> RGBColor["#a6e3a1"],
  "Teal" -> RGBColor["#94e2d5"],
  "Sky" -> RGBColor["#89dceb"],
  "Sapphire" -> RGBColor["#74c7ec"],
  "Blue" -> RGBColor["#89b4fa"],
  "Lavender" -> RGBColor["#b4befe"],
  "Text" -> RGBColor["#cdd6f4"],
  "Subtext1" -> RGBColor["#bac2de"],
  "Subtext0" -> RGBColor["#a6adc8"],
  "Overlay2" -> RGBColor["#9399b2"],
  "Overlay1" -> RGBColor["#7f849c"],
  "Overlay0" -> RGBColor["#6c7086"],
  "Surface2" -> RGBColor["#585b70"],
  "Surface1" -> RGBColor["#45475a"],
  "Surface0" -> RGBColor["#313244"],
  "Base" -> RGBColor["#1e1e2e"],
  "Mantle" -> RGBColor["#181825"],
  "Crust" -> RGBColor["#11111b"]
|>;

CreateTheme[flavour_, accent_] := Module[{},
  palette = ToExpression[flavour <> "Palette"];

  SetColors[<|
    "background" -> palette["Base"],
    "fontcolor" -> palette["Text"],
    "primary" -> palette[Capitalize[accent]],
    "variable" -> palette["Teal"],
    "module" -> palette["Sapphire"],
    "block" -> palette["Blue"],
    "error" -> palette["Red"],
    "headhighlight" -> palette["Overlay0"]
  |>];

  If[
    DirectoryQ[FileNameJoin[{"themes", flavour, accent}]],
    _,
    CreateDirectory[FileNameJoin[{"themes", flavour, accent}]]
  ];

  CreateStyleSheet[];
  SaveStyleSheet[];
  CopyFile[FileNameJoin[{$UserBaseDirectory, "SystemFiles", "FrontEnd", "StyleSheets", "maTHEMEatica.nb"}], FileNameJoin[{"themes", flavour, accent, "Catppuccin.nb"}], OverwriteTarget -> True];

  CreateCSS["primary"];
  SaveCSS[];
  CopyFile[FileNameJoin[{$UserBaseDirectory, "FrontEnd", "frontend.css"}], FileNameJoin[{"themes", flavour, accent, "frontend.css"}], OverwriteTarget -> True];
];

Do[
  CreateTheme[flavour, accent],
  {accent, {"rosewater", "flamingo", "pink", "mauve", "red", "maroon", "peach", "yellow", "green", "teal", "sky", "sapphire", "blue", "lavender"}},
  {flavour, {"latte", "frappe", "macchiato", "mocha"}}
]
