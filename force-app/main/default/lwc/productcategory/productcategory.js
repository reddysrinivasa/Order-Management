import { LightningElement,track,wire,api } from 'lwc';
import getProductCategoryList from '@salesforce/apex/Categoryclass.getProductCategory';
export default class Productcategory extends LightningElement {

@track records;
handleChangeAction(event)
 {
    console.log('Id',event.detail)
    getProductCategoryList({catid:event.detail}).then(result=>{
        this.records=result
        console.log('this.records'+JSON.stringify(this.records))
    }).catch(error=>{
        console.log('error',error)
    })
 }
}