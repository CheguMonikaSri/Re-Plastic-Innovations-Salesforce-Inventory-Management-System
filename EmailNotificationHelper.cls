public class EmailNotificationHelper {

    public static void sendRestockNotification(
        List<Re_Plastic_Innovations_Restock_Request__c> restockRequests
    ) {
        List<Messaging.SingleEmailMessage> emails =
            new List<Messaging.SingleEmailMessage>();

        for (Re_Plastic_Innovations_Restock_Request__c restock : restockRequests) {

            Messaging.SingleEmailMessage email =
                new Messaging.SingleEmailMessage();

            email.setSubject('Restock Request Approved');

            email.setToAddresses(
                new List<String>{'monika032024@gmail.com'}
            );
            

            
            email.setPlainTextBody(
    'Hello Monika,\n\n' +

    'Your restock request has been reviewed and approved successfully.\n\n' +

    'Restock Details:\n' +
    '--------------------------------\n' +
    'Restock Request ID: ' + restock.Id + '\n' +
    'Product ID: ' + restock.Product__c + '\n' +
    'Approved Quantity: ' + restock.Requested_Quantity__c + '\n' +
    'Status: ' + restock.Status__c + '\n' +
    '--------------------------------\n\n' +

    'The requested quantity has been added to the product inventory, ' +
    'and the stock level has been updated successfully in the system.\n\n' +

    'Please verify the updated inventory details and proceed with the ' +
    'necessary warehouse operations.\n\n' +

    'Thank you for your attention.\n\n' +

    'Regards,\n' +
    'Re Plastic Innovations\n' +
    'Inventory Management Team'
);

            emails.add(email);
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
