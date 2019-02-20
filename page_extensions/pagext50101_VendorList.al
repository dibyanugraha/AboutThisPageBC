pageextension 50101 "ad_Extends Vendor List" extends "Vendor List"
{
    actions
    {
        addlast(Processing)
        {
            action("About This Page")
            {
                Caption = 'About This Page';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Database;
                ApplicationArea = All;
            }
        }
    }
}