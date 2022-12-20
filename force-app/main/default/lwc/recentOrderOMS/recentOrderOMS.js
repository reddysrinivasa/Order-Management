import { LightningElement ,api, wire, track} from 'lwc';
import getOrderList from '@salesforce/apex/RecentOrderHelper.getOrderList';
export default class OpenOrderOMS extends LightningElement {
    @track columns = [{
        label: 'Order Name',
        fieldName: 'Name',
        type: 'Autonumber',
        sortable: true
    },
    {
        label: 'Shipping Address',
        fieldName: 'ShippingAddress__c',
        type: 'Long Text Area',
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
@wire(getOrderList)
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