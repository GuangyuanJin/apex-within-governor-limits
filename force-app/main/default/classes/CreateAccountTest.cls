@isTest 
private class CreateAccountTest {
    @isTest
    static void tryCreateAccount() {
        String acctName = 'Test Account';
        String acctNumber = '123 Best Company';

        Test.startTest();
        CreateAccount newAccount = new CreateAccount();
        Account acct = newAccount.createAccounts( 
            acctName, 
            acctNumber 
        );
        insert acct; 
        Test.stopTest();

        List<Account> acnts = [ 
            SELECT Id, Name, AccountNumber 
            FROM Account 
            WHERE Id = :acct.Id 
        ];
        System.assertEquals( 1, acnts.size(), 'Couldn\t find a new account' ); 
        System.assertEquals( acctName, acnts[0].Name, 'Test Account' );
        System.assertEquals( acctNumber, acnts[0].AccountNumber, '123 Best Company' ); 
    }
}
