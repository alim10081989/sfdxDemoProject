@isTest
public class VerifyDateTest {

    @isTest
    static void testDateWithin30Days() {
        // Create two dates where date2 is within 30 days of date1
        Date date1 = Date.newInstance(2023, 7, 1);
        Date date2 = Date.newInstance(2023, 7, 20);

        // Call the CheckDates method
        Date result = VerifyDate.CheckDates(date1, date2);

        // Assert that date2 is returned
        System.assertEquals(date2, result, 'Date within 30 days should be returned');
    }

    @isTest
    static void testDateNotWithin30Days() {
        // Create two dates where date2 is not within 30 days of date1
        Date date1 = Date.newInstance(2023, 7, 1);
        Date date2 = Date.newInstance(2023, 8, 5);

        // Call the CheckDates method
        Date result = VerifyDate.CheckDates(date1, date2);

        // Calculate the end of the month for date1
        Date endOfMonth = Date.newInstance(2023, 7, 31);

        // Assert that the end of the month is returned
        System.assertEquals(endOfMonth, result, 'End of the month date should be returned');
    }

    @isTest
    static void testDateBeforeDate1() {
        // Create two dates where date2 is before date1
        Date date1 = Date.newInstance(2023, 7, 1);
        Date date2 = Date.newInstance(2023, 6, 20);

        // Call the CheckDates method
        Date result = VerifyDate.CheckDates(date1, date2);

        // Calculate the end of the month for date1
        Date endOfMonth = Date.newInstance(2023, 7, 31);

        // Assert that the end of the month is returned
        System.assertEquals(endOfMonth, result, 'End of the month date should be returned for date2 before date1');
    }
}
