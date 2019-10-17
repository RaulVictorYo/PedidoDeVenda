unit Model.Base;

interface

type

  TBaseModel = class
  private
    FID: Integer;
    FTable: string;
    FGenerator: string;
    procedure SetID(const Value: Integer);
    procedure SetGenerator(const Value: string);
    procedure SetTable(const Value: string);
    public
      property ID: Integer read FID write SetID;
      property Table: string read FTable write SetTable;
      property Generator: string read FGenerator write SetGenerator;
  end;

implementation

{ TBaseModel }

procedure TBaseModel.SetGenerator(const Value: string);
begin
  FGenerator := Value;
end;

procedure TBaseModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TBaseModel.SetTable(const Value: string);
begin
  FTable := Value;
end;

end.
