public without sharing class DonationForm_Ctrl {

    @AuraEnabled
    public static Contact createContact(String data){
        try {
            ContactDTO contactDto = (ContactDTO) JSON.deserialize(data, ContactDTO.class);
            Contact contact = new Contact(
                FirstName = contactDto.firstName,
                LastName = contactDto.lastName,
                Phone = contactDto.phone,
                Email = contactDto.email
            );

            insert contact;
            return contact;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public class ContactDTO {
        @AuraEnabled public String firstName { get; set; }
        @AuraEnabled public String lastName { get; set; }
        @AuraEnabled public String email { get; set; }
        @AuraEnabled public String phone { get; set; }
    }

}
