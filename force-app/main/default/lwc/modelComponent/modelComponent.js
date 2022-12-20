import { LightningElement,api } from 'lwc';

export default class ModelComponent extends LightningElement {
@api recId
    handleclick()
    {
     this.dispatchEvent(new CustomEvent('show',{
     detail:this.isShowModal
     }))
    }
}