import { LightningElement ,api, wire, track} from 'lwc';
import getAccountList from '@salesforce/apex/OpenCartHelper.getAccountList';
export default class datatable extends LightningElement {
    @track columns = [{
            label: 'Cart#',
            fieldName: 'Name',
            type: 'Autonumber',
            sortable: true
        },
        {
            label: 'Cart ID',
            fieldName: 'Cart_Id__c',
            type: 'Text',
            sortable: true
        },
        {
            label: 'Status',
            fieldName: 'Status__c',
            type: 'Picklist',
            sortable: true
        }
    ];
 
    @track error;
    @track accList ;
    @wire(getAccountList)
    wiredAccounts({
        error,
        data
    }) {
        if (data) {
            this.accList = data;
        } else if (error) {
            this.error = error;
        }
    }
}