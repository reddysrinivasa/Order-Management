import { LightningElement ,api, wire, track} from 'lwc';
import getOrderList from '@salesforce/apex/OpenOrderHelper.getOrderList';
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
    },
    {
        label: 'Order Amount',
        fieldName: '	AmountPaid__c',
        type: 'Roll-Up Summary',
        sortable: true
    }
];

@track error;
@track orderList ;
@wire(getOrderList)
wiredAccounts({
    error,
    data
}) {
    if (data) {
        this.orderList = data;
    } else if (error) {
        this.error = error;
    }
}

}