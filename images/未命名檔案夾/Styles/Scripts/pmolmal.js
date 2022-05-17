var bankList = [
        {code:'B1',short:'CIMB',name:'CIMB Bank',avb:false},
        {code:'B2',short:'RBB',name:'RHB Bank',avb:false},
        {code:'B3',short:'HLB',name:'HongLeong Bank',avb:false},
        {code:'B4',short:'MBB',name:'May Bank',avb:false}  
    ];

var submitObjs = {
    methods:{
      /*
        submit_txn:function(){
            this.isWaitingForRetry=false;
            var payload = { TxID: "", Txtbox:"", Type:"", P1:""};
            payload.TxID = this.order_id;
            payload.Txtbox = this.pname;
            payload.Type = this.selectedCurrency.submit_id;
            payload.P1 = this.selectedBank.short;
            //console.log("mal input = " + JSON.stringify(payload));
            this.$http.post("/API_Step3Submit.aspx?lang="+langVar,payload)
            .then(function(res){
              res.json();
              var resJson = res.body;
              let actioncode = resJson.actioncode;
              //console.log("pong = " + JSON.stringify(resJson));
                if(actioncode == 0){
                  this.redirect(resJson.ReturnURL+"?lang="+langVar, resJson.Token);
                }else{
                  //this.waitForRetry(actioncode);
                  this.waitForRetry(10);
                }
              }, function(res){
                alert("Fail");
             });
        },
        */
        getAvbBankList:function(pcode){
          //console.log("getting avb bank list!");
          this.$http.get("/API_ChannelP.aspx?pcode="+pcode)
          .then(function(res){
            res.json();
            var resJson = res.body;
            //console.log("getAvbBankList = " + JSON.stringify(resJson));
            if(resJson.length>0){
              this.updateBankList(resJson);
            }
            }, function(res){
              alert("Fail");
           });
        },
        updateBankList:function(avbList){
          for(let i=0; i<this.bankList.length;i++){
            for(let j=0; j<avbList.length; j++){
              if(this.bankList[i].short == avbList[j].P1){
                this.bankList[i].avb = true;
                break;
              }
            }
          }
        },
        testingabc:function(){
            console.log("test exist override");
        }
    }
} 


