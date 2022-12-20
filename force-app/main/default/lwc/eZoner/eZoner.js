import { LightningElement, wire } from 'lwc';
import closeimg from "@salesforce/resourceUrl/Close";
import getProduct from '@salesforce/apex/allProd.getProducts';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';


export default class EZoner extends LightningElement {
     @wire (getProduct) wiredProducts;
     clos=closeimg
     myQuantity=1
     QuantA=5
     isShowModal = true;
     _title= "Product";
     _title1= "Sorry";
     messageA="Added Successfully";
     messageB="Out Of Stocks";
     messageC="Limited Quantity Only";
     s="success";
     e="error";
     addQ(){
        this.myQuantity=this.myQuantity + 1  
     }
     subQ(){
         if(this.myQuantity>=1){
          this.myQuantity=this.myQuantity - 1  
         }

     }
     
     showToast(){
          if(this.myQuantity<= this.QuantA )  {
               const Tst = new ShowToastEvent({
                    title: this._title,
                    message: this.messageA,
                    variant: this.s,
                    });
                    this.dispatchEvent(Tst);
                    this.isShowModal = false;
               }
               
              else if (this.QuantA==0){
               const Tst2= new ShowToastEvent({
                    title: this._title1,
                    message: this.messageB,
                    variant: this.e,
               });
               this.dispatchEvent(Tst2);
               }
              else if(this.myQuantity > this.QuantA  )  {
               const Tst1 = new ShowToastEvent({
                    title: this._title,
                    message: this.messageC,
                    variant: this.e,
                    });
                    this.dispatchEvent(Tst1);
          }
     }
     cancel(event){
          this.isShowModal = false;
     }
}