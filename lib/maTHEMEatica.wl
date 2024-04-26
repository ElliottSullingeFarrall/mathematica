(* ::Package:: *)

(* ::Input:: *)
(*SetOptions[EvaluationNotebook[],StyleDefinitions->$UserBaseDirectory<>"/SystemFiles/FrontEnd/StyleSheets/maTHEMEatica.nb"]*)


BeginPackage["maTHEMEatica`"];


(* ::Section:: *)
(*Public *)


SetColors::usage="Sets the active colors."
SetColors::badarg="Argument should be a Association of the form \[LeftAssociation]\"background\"\[Rule]RGBColor[0.1803921568627451, 0.20392156862745098`, 0.25098039215686274`],\"fontcolor\"\[Rule]RGBColor[0.8470588235294118, 0.8705882352941177, 0.9137254901960784],\"primary\"\[Rule]RGBColor[0.5333333333333333, 0.7529411764705882, 0.8156862745098039],\"variable\"\[Rule]RGBColor[0.5607843137254902, 0.7372549019607844, 0.7333333333333333],\"module\"\[Rule]RGBColor[0.5058823529411764, 0.6313725490196078, 0.7568627450980392],\"block\"\[Rule]RGBColor[0.3686274509803922, 0.5058823529411764, 0.6745098039215687],\"error\"\[Rule]RGBColor[0.7490196078431373, 0.3803921568627451, 0.41568627450980394`],\"headhighlight\"\[Rule]RGBColor[0.7058823529411765, 0.5568627450980392, 0.6784313725490196]\[RightAssociation]."
SetColors::length="It is advised for an entered list to have eight entries. Results may be unexpected."

GetColors::usage="Returns the active colors."

CreateStyleSheet::usage="Creates a Stylesheet based on the active colors."
ApplyStyleSheet::usage="Applies the last created StyleSheet to the current Notebook."
SaveStyleSheet::usage="Saves the last created Stylesheet under $UserBaseDirectory/SystemFiles/FrontEnd/StyleSheets/maTHEMEatica.nb."
SetDefault::usage="Sets $UserBaseDirectory/SystemFiles/FrontEnd/StyleSheets/maTHEMEatica.nb as the default StyleSheet."

SaveCSS::usage="Linux Only: Saves the last created CSS to '$UserBaseDirectory/FrontEnd/frontend.css'.";
CreateCSS::usage="Linux Only: Creates a CSS file based on the selected color (default: primary)."

maTHEMEatica::usage="Linux Only: Creates, saves and sets default for both StyleSheet and CSS."

DeleteAll::usage="Deletes frontend.css, maTHEMEatica.nb and sets the default StyleSheet to Default.nb"


(* ::Section:: *)
(*Private*)


Begin["`Private`"];


(* ::Subsection:: *)
(*General*)


(* ::Subsubsection:: *)
(*Default Colors*)


$colors=<|
	"background"->RGBColor["#140516"],
	"fontcolor"->RGBColor["#eeeeee"],
	"primary"->RGBColor["#eaa0eb"],
	"variable"->RGBColor["#55f7df"],
	"module"->RGBColor["#e638e9"],
	"block"->RGBColor["#35baa7"],
	"error"->RGBColor["#f51292"],
	"headhighlight"->RGBColor["#02584c"]
|>;



(* ::Subsubsection:: *)
(*Some popular color schemes*)


schemes["Nord"]=<|
	"background"->RGBColor["#2e3440"],
	"fontcolor"->RGBColor["#d8dee9"],
	"primary"->RGBColor["#88c0d0"],
	"variable"->RGBColor["#8fbcbb"],
	"module"->RGBColor["#81a1c1"],
	"block"->RGBColor["#5e81ac"],
	"error"->RGBColor["#bf616a"],
	"headhighlight"->RGBColor["#b48ead"]
|>;

schemes["Solarized"]=<|
	"background"->RGBColor["#002b36"],
	"fontcolor"->RGBColor["#eee8d5"],
	"primary"->RGBColor["#b58900"],
	"variable"->RGBColor["#6c71c4"],
	"module"->RGBColor["#268bd2"],
	"block"->RGBColor["#cb4b16"],
	"error"->RGBColor["#dc322f"],
	"headhighlight"->RGBColor["#2aa198"]
|>;

schemes["Gruvbox"]=<|
	"background"->RGBColor["#282828"],
	"fontcolor"->RGBColor["#ebdbb2"],
	"primary"->RGBColor["#689d6a"],
	"variable"->RGBColor["#b16286"],
	"module"->RGBColor["#458588"],
	"block"->RGBColor["#98971a"],
	"error"->RGBColor["#cc241d"],
	"headhighlight"->RGBColor["#d65d0e"]
|>;

schemes["Dracula"]=<|
	"background"->RGBColor["#282a36"],
	"fontcolor"->RGBColor["#f8f8f2"],
	"primary"->RGBColor["#ff79c6"],
	"variable"->RGBColor["#8be9fd"],
	"module"->RGBColor["#ffb86c"],
	"block"->RGBColor["#f1fa8c"],
	"error"->RGBColor["#ff5555"],
	"headhighlight"->RGBColor["#bd93f9"]
|>;

schemes["OneDark"]=<|
	"background"->RGBColor["#282c34"],
	"fontcolor"->RGBColor["#abb2bf"],
	"primary"->RGBColor["#98c379"],
	"variable"->RGBColor["#e5c07b"],
	"module"->RGBColor["#61afef"],
	"block"->RGBColor["#c678dd"],
	"error"->RGBColor["#e06c75"],
	"headhighlight"->Black
|>;
schemes["Jakob"]=<|
	"background"->RGBColor["#18181c"],
	"fontcolor"->RGBColor["#cad0df"],
	"primary"->RGBColor["#af82bb"],
	"variable"->RGBColor["#f6a04b"],
	"module"->RGBColor["#fbc46a"],
	"block"->RGBColor["#637dae"],
	"error"->RGBColor["#bb212d"],
	"headhighlight"->RGBColor["#3b4c78"]
|>;


(* ::Subsubsection:: *)
(*Setting and Getting colors*)


SetColors[colors_Association]/;AllTrue[colors,MatchQ[_RGBColor|_GrayLevel]]:=Module[{},
	$colors=Merge[{$colors,colors},Last];
]; 
SetColors[colors_List]/;AllTrue[colors,MatchQ[_RGBColor|_GrayLevel]]:=Module[{assoc},
	assoc = NewAssoc[colors];
	SetColors[assoc];
]; 
SetColors[scheme_String/;ValueQ@$colors[key]]:=
	$colors=schemes[scheme];
SetColors[key_String,color_RGBColor|color_GrayLevel]:=Module[{assoc},
	assoc = <|key->color|>;
	SetColors[assoc];
];
SetColors[foo_]:=Module[{},
	Message[SetColors::badarg];
	$Failed
];

Options[GetColors]={"Hex"->False};
GetColors[slot_Integer:All,OptionsPattern[]]:=Module[{hex,nohex},
	hex=Boole@OptionValue["Hex"];
	nohex=Boole@!OptionValue["Hex"];
	(hex ColorToHex@# + nohex #)&@$colors[[slot]]
];
GetColors[key_String,OptionsPattern[]]:=Module[{hex,nohex},
	hex=Boole@OptionValue["Hex"];
	nohex=Boole@!OptionValue["Hex"];
	(hex ColorToHex[#] + nohex #)&@$colors[key]
];


(* ::Subsubsection:: *)
(*Helpers*)


NewAssoc[colors_List]:=Module[{diff,keys,cutKeys,cutColors},
	keys={"background","fontcolor","primary","variable"};
	diff=Length@colors-Length@keys;
	cutKeys=If[diff<0,
		Message[SetColors::length];
		Drop[#,diff],
		#]&@keys;
	cutColors=If[diff>0,
		Message[SetColors::length];
		Drop[#,-diff],
		#]&@colors;
	<|cutKeys->cutColors//Thread|>
]


ColorToHex[color_RGBColor]:=Module[{red,green,blue},
	red=StringPadLeft[#,2,"0"]&@IntegerString[#,16]&@Round@(255 color[[1]]);
	green=StringPadLeft[#,2,"0"]&@IntegerString[#,16]&@Round@(255 color[[2]]);
	blue=StringPadLeft[#,2,"0"]&@IntegerString[#,16]&@Round@(255 color[[3]]);
	"#"<>red<>green<>blue
]
ColorToHex[color_GrayLevel]:=Module[{gray},
	gray=StringPadLeft[#,2,"0"]&@IntegerString[#,16]&@Round@(255 color[[1]]);
	"#"<>gray<>gray<>gray
]
Attributes[ColorToHex]={Listable};


(* ::Subsubsection:: *)
(*Summary*)


maTHEMEatica[]:=Module[{},
	CreateStyleSheet[];
	ApplyStyleSheet[];
	SaveStyleSheet[];
	SetDefault[];
	CreateCSS[];
	SaveCSS[];
]

maTHEMEatica[colors_]:=Module[{},
	SetColors[colors];
	maTHEMEatica[];
]


(* ::Subsubsection:: *)
(*Cleanup*)


DeleteStyleSheet[]:=DeleteFile[FileNameJoin[{$UserBaseDirectory,"SystemFiles","FrontEnd","StyleSheets","maTHEMEatica.nb"}]];
DeleteCSS[]:=DeleteFile[FileNameJoin[{$UserBaseDirectory,"FrontEnd","frontend.css"}]];
DeleteAll[]:=Module[{},
	DeleteStyleSheet[];
	DeleteCSS[];
	SetOptions[$FrontEnd,DefaultStyleDefinitions->"Default.nb"];
];


(* ::Subsection:: *)
(*Stylesheet*)


Options[CreateStyleSheet]={"LightMode"->False,"BlackInputBoxes"->False};
CreateStyleSheet[OptionsPattern[]]:=Module[{light,dark,fallback,fontcolor},
	Echo["Creating StyleSheet based on the colorscheme:"];
	Echo[List@@GetColors[]];
	$stylesheet=Notebook[{
	(*Setting Default inheritance to Defa.nb*)
		{light,dark}=Boole@{#,!#}&@OptionValue["LightMode"];
			fallback = light "Default.nb" + dark "ReverseColor.nb";
		Cell[StyleData[StyleDefinitions -> fallback]],
	(*Default settings for All and Notebook*)
		CellGroupData[{
		Cell["General setup and variable colors","Subsection"],
		Cell[StyleData["Notebook"],
			CellBracketOptions->{"HoverColor"->GetColors["primary"]},
			AutoStyleOptions->{
				"LocalVariableStyle"->{FontColor -> GetColors["module"]},
				"FunctionLocalVariableStyle"->{FontColor -> GetColors["block"]},
				"PatternVariableStyle"->{FontColor -> GetColors["variable"], FontSlant -> "Italic"},
				"UndefinedSymbolStyle"->{FontColor -> GetColors["primary"]}},
			CodeAssistOptions->{
				"HeadHighlightStyle"->{Background -> GetColors["headhighlight"], GetColors["fontcolor"]},
				"MatchHighlightStyle"->{Background -> GetColors["primary"], FontColor -> GrayLevel[0]},
				"MenuDefaultFillColor"->GetColors["primary"],
				"MenuDarkFillColor"->Black,
				"MenuBorderColor"->Black
				},
			FontColor->GetColors["fontcolor"],
			Background->GetColors["background"]],  
		Cell[StyleData["Input"],
			If[OptionValue["BlackInputBoxes"],Background->Black,##&[]],
			FontColor->GetColors["fontcolor"]],
		Cell[StyleData["InitializationCell"],
			If[OptionValue["BlackInputBoxes"],Background->Lighter[GetColors["background"],0.1],##&[]]]
		}], 
		CellGroupData[{
		Cell["Headers","Subsection"],
		Cell[StyleData["Section"],
			FontColor->GetColors["primary"]], 
		Cell[StyleData["Subsection"],
			FontColor->GetColors["variable"]], 
		Cell[StyleData["Subsubsection"],
			FontColor->GetColors["module"]],
		Cell[StyleData["Item"],
			CellDingbat->StyleBox["\[FilledSmallSquare]", GetColors["primary"]]],
		Cell[StyleData["MessageMenuLabel"], 
			FontColor->GetColors["error"]]
		}],
		CellGroupData[{
		Cell["Trying to make information boxes somewhat bearable","Subsection"],
		Cell[StyleData["InformationTitleText"],
			FontColor->GetColors["primary"]],
		Cell[StyleData["InformationTitleBackground"],
			ItemBoxOptions->{
			Background->GetColors["background"]}],
		Cell[StyleData["InformationUsageSubtitleBackground"],
			ItemBoxOptions->{Background->GetColors["background"]}],
		Cell[StyleData["InformationUsageText"],
			FontColor->GetColors["fontcolor"]],
		Cell[StyleData["InformationGridFrame"],
			FrameBoxOptions->{
				Background->GetColors["background"],
				FrameStyle->GetColors["fontcolor"]}]
		(*
		Cell[StyleData["InformationRowLabel"],
			FontColor->GetColors[1]],
		Cell[StyleData["DialogStyle"],
			Background->GetColors["background"],
			FontColor->GetColors["fontcolor"]],
		Cell[StyleData["TI"],
			Background->GetColors["background"],
			FontColor->GetColors["fontcolor"]],
		Cell[StyleData["TR"],
			Background->GetColors["background"],
			FontColor->GetColors["fontcolor"]],
		Cell[StyleData["Column"],
			Background->GetColors["background"],
			FontColor->GetColors["fontcolor"]],
		Cell[StyleData["Row"],
			Background->GetColors["background"],
			FontColor->GetColors["fontcolor"]]*)
		}]
	},StyleDefinitions->"PrivateStylesheetFormatting.nb"];
];

CreateStyleSheet[colors_]:=Module[{},
	SetColors[colors];
	CreateStyleSheet[];
]
	


PlayAround[]:=Module[{},
	Manipulate[CreateStyleSheet[{Hue[x],RGBColor["#35baa7"],RGBColor["#e638e9"],RGBColor["#55f7df"],RGBColor["#bf59de"],RGBColor["#bc0bf3"]}],{z,0,1}]
	ApplyStyleSheet;
]


ApplyStyleSheet[]:=SetOptions[EvaluationNotebook[],StyleDefinitions->$stylesheet];

SaveStyleSheet[]:=Module[{},
	Export[FileNameJoin[{$UserBaseDirectory,"SystemFiles","FrontEnd","StyleSheets","maTHEMEatica.nb"}],$stylesheet];
];

SetDefault[]:=Module[{file},
	file=FileNameJoin[{$UserBaseDirectory,"SystemFiles","FrontEnd","StyleSheets","maTHEMEatica.nb"}];
	SetOptions[$FrontEnd,DefaultStyleDefinitions->file];
]


(* ::Subsection:: *)
(*Menu Bars*)


CreateCSS[arg_:"primary",OptionsPattern[]]:=Module[{},
	$cssString=
	"
* {
	background: "<>GetColors["background","Hex"->True]<>";
	color: "<>GetColors["fontcolor","Hex"->True]<>";
	border: 1px solid #5A5A5A;
}

QWidget::item:selected {
	background: "<>GetColors[arg,"Hex"->True]<>";
	color: "<>GetColors["background","Hex"->True]<>";
}
QWidget::item:disabled {
	color: #888888;
}

QScrollBar {
	border: 1px solid #5A5A5A;
	background: #191919;
}

QScrollBar:horizontal {
	height: 15px;
	margin: 0px 0px 0px 32px;
}

QScrollBar:vertical {
	width: 15px;
	margin: 32px 0px 0px 0px;
}

QScrollBar::handle {
	background: #353535;
	border: 1px solid #5A5A5A;
}

QScrollBar::handle:horizontal {
	border-width: 0px 1px 0px 1px;
}

QScrollBar::handle:vertical {
	border-width: 1px 0px 1px 0px;
}

QScrollBar::handle:horizontal {
	min-width: 20px;
}

QScrollBar::handle:vertical {
	min-height: 20px;
}

QScrollBar::add-line, QScrollBar::sub-line {
	background:#353535;
	border: 1px solid #5A5A5A;
	subcontrol-origin: margin;
}

QScrollBar::add-line {
	position: absolute;
}

QScrollBar::add-line:horizontal {
	width: 15px;
	subcontrol-position: left;
	left: 15px;
}

QScrollBar::add-line:vertical {
	height: 15px;
	subcontrol-position: top;
	top: 15px;
}

QScrollBar::sub-line:horizontal {
	width: 15px;
	subcontrol-position: top left;
}

QScrollBar::sub-line:vertical {
	height: 15px;
	subcontrol-position: top;
}

QScrollBar:left-arrow, QScrollBar::right-arrow, QScrollBar::up-arrow, QScrollBar::down-arrow {
	border: 1px solid #5A5A5A;
	width: 3px;
	height: 3px;
}

QScrollBar::add-page, QScrollBar::sub-page {
	background: none;
}

";
];



SaveCSS[]:=Module[{check,file},
	(*check=FileExistsQ[FileNameJoin[{$UserBaseDirectory,"FrontEnd","frontend.css"}]];
	If[check,check=ChoiceDialog["The file "<>$UserBaseDirectory<>"/FrontEnd/frontend.css already exists. Do you want to override it?",{"Yes"->True,"No"->False},Background->GetColors[1]]];
	If[!check,Abort[]];*)
	file=OpenWrite[FileNameJoin[{$UserBaseDirectory,"FrontEnd","frontend.css"}]];
	WriteString[file,$cssString];
	Close[file]
];


(* ::Subsection:: *)
(*Ending Package*)


End[];
EndPackage[];
