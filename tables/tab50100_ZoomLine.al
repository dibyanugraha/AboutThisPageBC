table 50100 "ad_Zoom Line"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "PK Value"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Field No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Source Table"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Field Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Field Value"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "PK Value", "Field No.")
        {
            Clustered = true;
        }
    }
}