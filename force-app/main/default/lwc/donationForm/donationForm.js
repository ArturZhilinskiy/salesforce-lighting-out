import { LightningElement } from 'lwc';
import  createContact       from '@salesforce/apex/DonationForm_Ctrl.createContact';

export default class DonationForm extends LightningElement {

    contact = {
        firstName : '',
        lastName : '',
        phone : '',
        email : ''
    };

    handleChange(event) {
        let name = event.currentTarget.name;
        let value = event.currentTarget.value;
        this.contact[name] = value;
    }

    async handleClick() {
        console.log(JSON.stringify(this.contact));
        let result = await createContact({data : JSON.stringify(this.contact)});
        console.log(result);
    }

}