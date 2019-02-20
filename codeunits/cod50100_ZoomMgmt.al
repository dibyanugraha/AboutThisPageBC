codeunit 50100 "ad_Zoom Management"
{
    procedure ZoomIn(RecordVariant: Variant);
    var
        DataTypeMgt: Codeunit "Data Type Management";
        RecReference: RecordRef;
        FieldReference: FieldRef;
        PKValue: Text[250];
        Index: Integer;
        ZoomLine: Record "ad_Zoom Line" temporary;
    begin

        if not DataTypeMgt.GetRecordRef(RecordVariant, RecReference) then
            exit;
        PKValue := GetPrimaryKeyValue(RecReference);

        FOR Index := 1 TO RecReference.FieldCount DO BEGIN
            Clear(FieldReference);
            FieldReference := RecReference.FieldIndex(Index);

            ZoomLine.Init;
            ZoomLine."PK Value" := PKValue;
            ZoomLine."Source Table" := StrSubstNo('%1 (%2)', RecReference.Name, RecReference.Number);
            ZoomLine."Field No." := FieldReference.Number;
            ZoomLine."Field Name" := FieldReference.Name;
            if FieldReference.Type = FieldReference.Type::Blob then
                ZoomLine."Field Value" := StrSubstNo('Length: %1', FieldReference.Length)
            else
                ZoomLine."Field Value" := Format(FieldReference.Value);
            ZoomLine.Insert;
        END;

        ZoomLine.FindSet; // Go back to the top of the list
        Page.Run(Page::"ad_Zoom List", ZoomLine);
    end;

    local procedure GetPrimaryKeyValue(RecReference: RecordRef): Text[250];
    var
        KeyReference: KeyRef;
        FieldReference: FieldRef;
        Index: Integer;
        PKValue: Text[250];
    begin
        KeyReference := RecReference.KeyIndex(1);

        FOR Index := 1 TO KeyReference.FieldCount DO BEGIN
            Clear(FieldReference);
            FieldReference := KeyReference.FieldIndex(Index);
            PKValue += StrSubstNo('%1 ,', FieldReference.Value);
        END;

        PKValue := CopyStr(PKValue, 1, StrLen(PKValue) - 1);
        exit(PKValue);
    end;

    // Event Subscribers
    [EventSubscriber(ObjectType::Page, Page::"Customer List", 'OnAfterActionEvent', 'About This Page', false, false)]
    local procedure ZoomIn_OnAfterAction_CustomerList(var Rec: Record Customer);
    begin
        ZoomIn(Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Vendor List", 'OnAfterActionEvent', 'About This Page', false, false)]
    local procedure ZoomIn_OnAfterAction_VendorList(var Rec: Record Vendor);
    begin
        ZoomIn(Rec);
    end;

    [EventSubscriber(ObjectType::Page, page::"Item List", 'OnAfterActionEvent', 'About This Page', false, false)]
    local procedure ZoomIn_OnAfterAction_ItemList(var Rec: Record Item)
    begin
        ZoomIn(Rec);
    end;
}