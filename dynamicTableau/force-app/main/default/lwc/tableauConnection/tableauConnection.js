import { LightningElement,track } from 'lwc';

export default class TableauConnection extends LightningElement {

    @track recId="Selected Account ID";
    @track adv1="Selected Account ID";
    @track adv2="Selected Account ID";
    @track url1="https://tableau.corp.global/t/cs/views/ProspectorEmbeddedDashboards_16863189589020/Account?:showAppBanner=false&:display_count=n&:showVizHome=n&:origin=viz_share_link";


    connectedCallback(){

        this.url1="https://tableau.corp.global/t/cs/views/ProspectorEmbeddedDashboards_16863189589020/Account?:showAppBanner=false&:display_count=n&:showVizHome=n&:origin=viz_share_link";
        this.recId= '0013i00000CBJ5TAAX';
        this.adv1='0013i00000CBJ5TAAX';
        this.adv2='0013i00000CBJ5TAAX';
    }

}