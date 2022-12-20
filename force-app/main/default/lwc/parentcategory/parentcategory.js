import { LightningElement, track,wire } from 'lwc';
import getParentCategoryList from '@salesforce/apex/Categoryclass.getparentcategory';

export default class Parentcategory extends LightningElement {

    @track getPcId

    @wire(getParentCategoryList) parentCat

    handleChangeRadio(event){        

        this.getPcId = event.target.value;
        window.console.log('getPcId ' + this.getPcId);
        var selectedEvent = new CustomEvent('parid', 
        { 
            detail:this.getPcId
        });
// Dispatches the event.
this.dispatchEvent(selectedEvent);

}
showModal=false
pcId
viewModal(event)
{
this.showModal=true
this.pcId=event.target.name 
console.log('this.pcId'+this.pcId)
}
handleShow()
{
    this.showModal=false
}
}