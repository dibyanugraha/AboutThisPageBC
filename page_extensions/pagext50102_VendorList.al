pageextension 50102 "ad_Extends Item List" extends "Item List"
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