unit Model.Base;

interface

type

  TBaseModel = class
  private
    FID: Integer;
    procedure SetID(const Value: Integer);
    public
      property ID: Integer read FID write SetID;
  end;

implementation

{ TBaseModel }

procedure TBaseModel.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
