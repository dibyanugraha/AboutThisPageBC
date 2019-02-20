pageextension 50100 "ts_Extends Cust. List" extends "Customer List"
{
    actions
    {
        addlast(Processing)
        {
            action("About This Page")
            {
                CaptionML = ENG = 'About This Page',
                            ENU = 'About This Page';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Database;
                ApplicationArea = All;
            }
        }
    }
}