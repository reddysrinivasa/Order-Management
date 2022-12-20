import { LightningElement, wire } from 'lwc';
import getProduct from '@salesforce/apex/allProd.getProducts2';
export default class DemoProList extends LightningElement {
    
    @wire (getProduct)proList;
}