import { LightningElement,track,wire,api } from 'lwc';
import getCategoryList from '@salesforce/apex/Categoryclass.getCategory';

export default class Category extends LightningElement {


 @api catId

 @track records;

 @track errorMsg;

 @track getCcId; 
 @api getshowcategory;
 handleClick(event)
 {
    console.log('detail',event.detail)
    getCategoryList({parentid:event.detail}).then(result=>{
        this.records=result
    })
   
 }
 handleChangeRadio(event)
 {
    this.dispatchEvent(new CustomEvent('prod',{
        detail:event.target.value
    }))

 }


}