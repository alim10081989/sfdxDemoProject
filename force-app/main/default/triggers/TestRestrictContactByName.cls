@isTest
public class TestRestrictContactByName {

    @isTest
    static void testInsertInvalidLastName() {
        // Create a Contact with the invalid last name
        Contact invalidContact = new Contact(FirstName = 'Test', LastName = 'INVALIDNAME');

        // Attempt to insert the contact and catch the expected exception
        try {
            insert invalidContact;
            // If no exception is thrown, fail the test
            System.assert(false, 'Expected DML exception for invalid last name.');
        } catch (DmlException e) {
            // Verify that the correct error message is returned
            System.assert(e.getDmlMessage(0).contains('The Last Name "INVALIDNAME" is not allowed for DML'), 
                          'Unexpected error message: ' + e.getDmlMessage(0));
        }
    }

    @isTest
    static void testInsertValidLastName() {
        // Create a Contact with a valid last name
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'VALIDNAME');

        // Insert the contact and verify no exceptions are thrown
        insert validContact;
        System.assert(validContact.Id != null, 'Contact with valid last name should be inserted.');
    }

    @isTest
    static void testUpdateInvalidLastName() {
        // Create and insert a Contact with a valid last name
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'VALIDNAME');
        insert validContact;

        // Attempt to update the contact with an invalid last name
        validContact.LastName = 'INVALIDNAME';

        // Attempt to update the contact and catch the expected exception
        try {
            update validContact;
            // If no exception is thrown, fail the test
            System.assert(false, 'Expected DML exception for invalid last name.');
        } catch (DmlException e) {
            // Verify that the correct error message is returned
            System.assert(e.getDmlMessage(0).contains('The Last Name "INVALIDNAME" is not allowed for DML'), 
                          'Unexpected error message: ' + e.getDmlMessage(0));
        }
    }

    @isTest
    static void testUpdateValidLastName() {
        // Create and insert a Contact with a valid last name
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'VALIDNAME');
        insert validContact;

        // Update the contact with another valid last name
        validContact.LastName = 'ANOTHERVALIDNAME';
        update validContact;

        // Verify the update was successful
        Contact updatedContact = [SELECT LastName FROM Contact WHERE Id = :validContact.Id];
        System.assertEquals('ANOTHERVALIDNAME', updatedContact.LastName, 
                            'Contact should be updated with the new valid last name.');
    }
}