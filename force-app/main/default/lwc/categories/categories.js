import { LightningElement, wire } from 'lwc';
import getparentcategory from '@salesforce/apex/Categoryclass.getparentcategory'
export default class Categories extends LightningElement {

    @wire(getparentcategory)ctgList;
}