unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TTextFileHandler = class
  private
    FFileName: string;
    FFile: TextFile;
  public
    constructor Create(AFileName: string); // Declaração do construtor
    destructor Destroy; override; // Declaração do destrutor
    procedure WriteLine(AText: string);
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TTextFileHandler }

constructor TTextFileHandler.Create(AFileName: string);
begin
  inherited Create;
  FFileName := AFileName;
  AssignFile(FFile, FFileName);
  Rewrite(FFile); // Cria o arquivo
end;

destructor TTextFileHandler.Destroy;
begin
  CloseFile(FFile); // Fecha o arquivo
  inherited Destroy;
end;

procedure TTextFileHandler.WriteLine(AText: string);
begin
  WriteLn(FFile, AText); // Escreve uma linha no arquivo
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  TextHandler: TTextFileHandler;
begin
  //Cria o arquivo texto - o arquivo será criado na mesma pasta do executável
  TextHandler := TTextFileHandler.Create('example.txt');
  try
    TextHandler.WriteLine('Hello, world!');   //escreve no arquivo texto
    TextHandler.WriteLine('This is a test.'); //escreve no arquivo texto
  finally
    TextHandler.Free; // Chama o destrutor para liberar o recurso
  end;
end;

end.
