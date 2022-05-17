<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TX_Order.aspx.vb" Inherits="BVAC_API_C.TX_Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="renderer" content="webkit" />
  <title></title>
  <link href="/Styles/googleapis.css" rel="stylesheet" type="text/css" />
  <link href="/Styles/all.css" rel="stylesheet" />
  <link href="/Styles/ionicons.min.css" rel="stylesheet" />


  <!-- Do you need MDI? -->
  <link href="/Styles/materialdesignicons.min.css" rel="stylesheet" />

  <!-- Do you need all animations? -->
  <link href="/Styles/animate.min.css" rel="stylesheet" />

  <link href="/Styles/quasar.min.css" rel="stylesheet" type="text/css" />
  <link href="/Styles/tx_order.css?v=1" rel="stylesheet" type="text/css" />

  <style>

    </style>
</head>
<body>
    <form id="form1"  runat="server">
      <div id="q-app">
        <script src="/Scripts/quasar.ie.polyfills.umd.min.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/vue.min.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/vue-i18n.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/vue-resource@1.5.1.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/quasar.umd.min.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/bvac_om_function.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/language.js?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>
        <script src="/Scripts/<%response.write(JSFile)%>?r=<%response.write(BVAC_API_C.EncModule.GetRandomStr(8))%>"></script>

        <div class="bg_black">
          <div style="background-color: #000;">
            <div class="top">
              <div class="insidetop" >
                <img src="images/bvac_logo1.png">
                <p>EASY & HASSLE FREE PAYMENT GATEWAY {{step}}</p>

                <div class="dropdown" style="float: right;margin-top: 10px; margin-right:10px;">
                  <a class="dropbtn">
                    <template v-if="this.$i18n.locale == 'zh'">
                    <div class="flag_cn" style="position: absolute;left: 17px; display:inline-block"></div>
                    <div style="display:inline-block;width: 41px;">中文</div>
                    </template>
                    <template v-else-if="this.$i18n.locale == 'en'">
                    <div class="flag_en" style="position: absolute;left: 17px;display:inline-block;"></div>
                    <div style="display:inline-block;width: 41px;">English</div>
                    </template>
                    <template v-else-if="this.$i18n.locale == 'jp'">
                    <div class="flag_jp" style="position: absolute;left: 17px;display:inline-block;"></div>
                    <div style="display:inline-block;width: 41px;">日本語</div>
                    </template>
                  </a>
                  <div class="dropdown-content">
                    <div style="width:105px;height:1px;background-color:#4A4A4A;"></div>
                    <a v-if="this.$i18n.locale != 'zh'" v-on:click.prevent.stop="change_language('zh')"><div class="flag_cn"></div>中文</a>
                    <a v-if="this.$i18n.locale != 'en'" v-on:click.prevent.stop="change_language('en')"><div class="flag_en"></div>English</a>
                    <a v-if="this.$i18n.locale != 'jp'" v-on:click.prevent.stop="change_language('jp')"><div class="flag_jp"></div>日本語</a>
                  </div>
               </div>
              </div>
          <!--  <a v-on:click.prevent.stop="change_language('zh')">中文</a>
            <a v-on:click.prevent.stop="change_language('en')">English</a>
            <a v-on:click.prevent.stop="change_language('jp')">日本語</a> -->
            </div>
          <div class="frame02 bg_crypto02">
            <div class="main_title">
            <p></p>
          </div>
          </div>
         </div>


         <div class="frame03 mt-15">
           <div class="icon_01 paper" ></div>
           <h3>{{$t('lan.orderDetail')}}</h3>

                <div class="content02">
                  <div v-if="step < 50" class="blue01" style="text-align: left;">
                    <template v-if="step < 40">
                      <div>
                        <h4 style="display: inline-block;">{{$t('lan.payAmt')}} : </h4>
						<h4 style="display: inline-block;"><% response.write(DisCurrency)%></h4>
						
                        <h2 style="display: inline-block;position: relative;top: 6px;font-weight: 400;padding: 10px;"><% Response.Write(DisAmtString) %> </h2>
                      </div>
                      <!--img src="images/trade_icon.png" style="    margin: 0 3em;"/>
                      <div>
                      <h4>{{$t('lan.exchangeQuantity')}}</h4>
                      <h3><% Response.Write(DisAmtString) %> BVAC</h3>
                    </div-->
                    </template>
                    <template v-if="step == 40">
                      <img src="images/clock_icon.png"/>
                      <div style="text-align:left;padding-left:10px;">
                        <h4 style="    margin: 0px;">{{$t('lan.remindTimeOfOrderPayment')}}</h4>
                        <h1>{{minutes}}分{{seconds}}秒</h1>
                      </div>


                      <h4 style="text-align: center;">{{$t('lan.longlong')}}</h4>
                      <div class="blue_frame" style="display:block">{{$t('lan.payAmt')}}：<span style="color:#1F7EFF;font-size:1.6em;font-weight:500;">{{amt}}</span></div>
                      <div class="blue_frame" style="display:block">{{$t('lan.receiverName')}}：{{rname}} <img v-on:click="copy(rname)" src="images/icon_copy.png" style="    float: right;"></div>
                      <div class="blue_frame" style="display:block">{{$t('lan.receiverAcc')}}：{{account_no}}<img v-on:click="copy(account_no)" src="images/icon_copy.png" style="    float: right;"></div>
                      <div class="blue_frame" style="display:block">{{$t('lan.bankOfAcc')}}：{{account_bank}}<img v-on:click="copy(account_bank)" src="images/icon_copy.png" style="    float: right;"></div>
                      <div class="blue_frame" style="display:block">{{$t('lan.LocateState')}}：{{account_bank_city}} <img v-on:click="copy(account_bank_city)" src="images/icon_copy.png" style="    float: right;"></div>
                    </template>
                  </div>
                  <!--update for new flow step 10 start-->
                  <template v-if="step == 15">
                    <div id="currency">
                      <h4>{{$t('lan.currency')}}</h4>
                      <div v-for="(obj) in rechargeCurrencyList" style="display:inline-block;">
                        <button v-if="obj.isSelectable == true" :key="obj.submit_id" :class="obj.style_class" v-on:click.stop.prevent="selectRechargeCurrency(obj)">
                          <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'" ></div>
                          <p>{{$t(obj.currency_name_chn)}}</p>
                        </button>
                        <button v-if="obj.isSelectable == false"  :key="obj.paymentmethod_id" :class="btn_disabled_style" disabled>
                            <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                            <p>{{$t(obj.currency_name_chn)}}</p>
                        </button>
                      </div>
                    </div>
                    <div style="margin-bottom: 1.5em;">
                      <div class="l_side" style="">
                        <div>
                          <h4 style="letter-spacing:-0.5px">充值 USDT 地址：</h4>
                          <input type="text" :placeholder="$t(extra_info_placeHolder)" v-model="recharge_addr" v-on:input="checkDisableNextStep(step,'top up addr')" autocomplete="off">
                        </div>
                        <div>
                          <h4 style="letter-spacing:-0.5px">充值 USDT 銀碼：</h4>
                          <input type="text" :placeholder="$t(extra_info_placeHolder)" v-model="recharge_amt" v-on:input="checkDisableNextStep(step,'top up amt')" autocomplete="off">
                        </div>
                      </div>
                    </div>

                  </template>
                  <template v-if="step >= 10 && step < 20">
                    <div id="payment_method" v-if="step == 10">
                      <h4></h4>
                      <div  style="display:inline-block;">
                        <button :class="(haveWallet==true)?btn_selected_style:btn_normal_style" v-on:click.stop.prevent="selectWithWallet(true)">
                          <div class="icon_02" :style="'background-image: url(images/icon_havewallet.png);'"></div>
                          <p>我已有數字貨幣錢包</p>
                        </button>
                      </div>
                      <div style="display:inline-block;">
                        <button :class="(haveWallet==false)?btn_selected_style:btn_normal_style" v-on:click.stop.prevent="selectWithWallet(false)">
                          <div class="icon_02" :style="'background-image: url(images/icon_nowallet.png);'"></div>
                          <p>無數字貨幣錢包</p>
                        </button>
                      </div>
                  </div>
                  <template v-if="haveWallet==true">
                    <div id="payment_method" v-if="step == 11">
                      <h4>轉/買幣</h4>
                      <div v-for="(obj) in this.paymentMethodJSON" style="display:inline-block;">
                        <button v-if="obj.isSelectable == true" :key="obj.paymentmethod_id" :class="obj.style_class" v-on:click.stop.prevent="selectPaymentMethod(obj)">
                          <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                          <p>{{$t(obj.paymentmethod_name_chn)}}</p>
                        </button>
                        <button v-if="obj.isSelectable == false"  :key="obj.paymentmethod_id" :class="btn_disabled_style" disabled>
                            <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                            <p>{{$t(obj.paymentmethod_name_chn)}}</p>
                          </button>
                      </div>
                    </div>

                    <div id="currency" :style="currencyDivStyle" v-if="step == 12">
                      <h4>{{$t('lan.currency')}}</h4>
                      <div v-for="(obj) in this.currencyList" style="display:inline-block;">
                        <button v-if="obj.isSelectable == true" :key="obj.submit_id" :class="obj.style_class" v-on:click.stop.prevent="selectCurrency(obj)">
                          <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'" ></div>
                          <p>{{$t(obj.currency_name_chn)}}</p>
                        </button>
                        <button v-if="obj.isSelectable == false"  :key="obj.paymentmethod_id" :class="btn_disabled_style" disabled>
                            <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                            <p>{{$t(obj.currency_name_chn)}}</p>
                        </button>
                      </div>
                    </div>
                  </template>
                  <template v-if="haveWallet==false">
                    <div id="payment_method" v-if="step == 11">
                      <h4>支付方式</h4>
                      <div v-for="(obj) in this.paymentMethodJSON" style="display:inline-block;">
                        <button v-if="obj.isSelectable == true" :key="obj.paymentmethod_id" :class="obj.style_class" v-on:click.stop.prevent="selectPaymentMethod(obj)">
                          <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                          <p>{{$t(obj.paymentmethod_name_chn)}}</p>
                        </button>
                        <button v-if="obj.isSelectable == false"  :key="obj.paymentmethod_id" :class="btn_disabled_style" disabled>
                            <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                            <p>{{$t(obj.paymentmethod_name_chn)}}</p>
                          </button>
                      </div>
                      <div style="display:inline-block; vertical-align:top; margin:10px;">
                        <a href="/CryptoIntro/Intro.html" target="_blank" class="blue_btn02">注冊新錢包</a>
                      </div>
                    </div>

                    <div id="currency" :style="currencyDivStyle" v-if="step == 12">
                      <h4>{{$t('lan.currency')}}</h4>
                      <div v-for="(obj) in this.currencyList" style="display:inline-block;">
                        <button v-if="obj.isSelectable == true" :key="obj.submit_id" :class="obj.style_class" v-on:click.stop.prevent="selectCurrency(obj)">
                          <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'" ></div>
                          <p>{{$t(obj.currency_name_chn)}}</p>
                        </button>
                        <button v-if="obj.isSelectable == false"  :key="obj.paymentmethod_id" :class="btn_disabled_style" disabled>
                            <div class="icon_02" :style="'background-image: url(images/icon_' + obj.code + '.png);'"></div>
                            <p>{{$t(obj.currency_name_chn)}}</p>
                        </button>
                      </div>
                    </div>
                  </template>
                </template>
                <!--update for new flow step10 end-->
                <!--update for new flow step 20 start-->
                <template v-if="step == 20">
                  <div style="margin-top: 1.5em;">
                    <h4>{{$t('lan.SelectPaymentMethod')}}：
                      <!--div class="icon_02 icon_03" :style="'background-image: url(images/icon_' + selectedPaymentMethod.code + '.png);'" style="position: relative;top: 14px;"></div-->
                      {{$t(selectedPaymentMethod.paymentmethod_name_chn)}}
                    </h4>
                    <h4 v-if="bankList.length > 0">{{$t('lan.bank')}}:</h4>
                    <div v-if="bankList.length > 0" v-for="(bankObj) in this.bankList" style="display:block;">
                      <button
                      v-if="bankObj.avb"
                      :class="(bankObj.short == selectedBank)?btn_selected_style:btn_normal_style"
                      :key="bankObj.code"
                      v-on:click.stop.prevent="selectedBank=bankObj.short; checkDisableNextStep(step, 'selectBank allow');">
                      <div :class="'icon_MYR_' + bankObj.code"></div><p>{{bankObj.name}}</p>
                      </button>
                      <button
                      v-if="!bankObj.avb"
                      :class="btn_disabled_style"
                      :key="bankObj.code"
                      v-on:click.stop.prevent="selectedBank=bankObj.short; checkDisableNextStep(step, 'selectBank disabled');"
                      disabled>
                      <div :class="'icon_MYR_' + bankObj.code"></div><p>{{bankObj.name}}</p>
                      </button>
                    </div>
                    <div style="display:inline-block;">&nbsp;</div>

                    <div class="l_side">
                      <h4 style="letter-spacing:-0.5px">{{$t(extra_info_title)}}：</h4>
                      <input type="text" :placeholder="$t(extra_info_placeHolder)" v-model="pname" v-on:input="checkDisableNextStep(step, 'pname')" autocomplete="off">
                    </div>

                    <div class="r_side">
                      <h4 style="line-height: 1.5rem;">{{$t('lan.followInsturctionAndPayEnoughAmt')}}</h4>
                      <img src="images/icon-02.png"/>
                    </div>
                  </div>
                </template>
                <!--update for new flow step 2 end-->
                <template v-if="step == 50">
                  <div class="content02" style="    text-align: center;">
                       <div ><img src="images/complete_icon.png" style="padding-top:40px;"/></div>
                       <h3 style="color:#14D977;">{{$t('lan.submitSuccess')}}</h3>
                       <p style="font-weight:400;">{{$t('lan.announcementAfterTranaction')}}</p>
                       <p style="margin-bottom: -30px;">{{$t('lan.announcementAfterTranactionTime')}}</p>
                   </div>
                </template>
              </div>
              <template v-if="step == 40">
              <p style="font-size:1.3em;color:#fff;text-align:center;">{{$t('lan.prevStep')}}</p>
              <div>
                <p style="font-size: 1em;color: rgb(185, 185, 185);border-top: 1px solid rgba(185, 185, 185,0.3);padding: 30px 0px 0px;">
                  <span style="color:#FF1C1C;">{{$t('lan.no1')}}{{$t('lan.unionPayRules1')}}</span><br/>
                  {{$t('lan.no2')}}{{$t('lan.unionPayRules2')}}<br/>
                  {{$t('lan.no3')}}{{$t('lan.unionPayRules3')}}
                <p>
              </div>
              </template>
              <q-dialog v-model="alert" persistent="true" >
                <div >
                  <div  v-if="isWaitingForRetry"   class="close01">
                    <a href="" ><img src="images/close_icon.png" style="display: block;"></a>
                  </div>
                  <div v-if="!isWaitingForRetry" class="popup01" >
                    <div>
                      <img src="images/search_icon01.png" style="display: block;text-align: center;margin: auto;width: 70%;max-width: 202px;">
                      <img src="images/search_icon02.png" style="text-align: center;margin: auto;width: 70%;max-width: 90px;margin-top: -40%;" class="move">
                    </div>
                    <h3>{{$t('lan.plsWaitDuringProcess')}}</h3>
                  </div>
                  <div v-if="isWaitingForRetry" class="popup01" >
                    <div>
                      <img src="images/reload_icon01.png" style="display: block;text-align: center;margin: auto;width: 70%;max-width: 202px;">
                      <img src="images/reload_icon02.png" style="    text-align: center;margin: -60% auto auto;width: 70%;max-width: 160px;user-select: auto;" class="move02">
                    </div>
                    <h3>{{$t('lan.cannotFindTheMatchYet')}}</h3>
                    <p>{{$t('lan.systemWillTryAgainSoon')}}</p>
                  </div>
                </div>
              </q-dialog>
         </div>
         <footer >
            <img src="images/footer_icon.png" style=";"/>
            <p>Copyright © 2019 BVAC All rights reserved and shall not be reproduced without permission.</p>
            
         </footer>

        </div>
        <input type="hidden" id="copy_txt" />
      </div>

      <script>
        var langVar = '<%Response.Write(Request.QueryString.Item("lang"))%>';
        if(langVar == "")
          {
            langVar = 'en';
          }
        var i18n = new VueI18n({
          locale: langVar , // set locale
          messages: messages, // set locale messages
          fallbackLocale: 'en',
        })

        var app = new Vue({
          el: '#q-app',
          i18n: i18n,
          mixins:[submitObjs],
          data: function(){
            return {order_id: "<%Response.Write(TXID)%>",
                  step: 10,
                  btn_text:'lan.continue',
                  btn_back:'lan.prevStep',
                  alert:false,
                  isWaitingForRetry:false,
                  pname:"",
                  rname:"",
                  amt:"",
                  bvac_amt:"",
                  account_no:"",
                  account_bank:"",
                  account_bank_city:"",
                  extra_info_title:"",
                  extra_info_placeHolder:"",
                   //timer data
                  timer:"",
                  wordString: {},
                  start: "",
                  end: "",
                  interval: "",
                  days:"",
                  minutes:"00",
                  hours:"00",
                  seconds:"00",
                  message:"",
                  statusType:"",
                  statusText: "",
                  //styles
                  currencyDivStyle:"display:none;",
                  btn_up_style:"button1",
                  btn_rmb_style:"button1",
                  btn_normal_style:"button1",
                  btn_selected_style:"button1 selected",
                  btn_disabled_style:"button1 disabled",
                  allowGoToStep2:false,
                  disableNextStep:false,
                  selectedCurrency:0,
                  selectedPaymentMethod:0,
                  countDownStatus:"",
                  //paymentMethod
                  paymentMethodJSON:"",
                  bankList:bankList,
                  selectedBank:"",
                  currencyList:"",
                  rechargePaymentList:[],
                  selectedRechargeCurrency:"",

                  haveWallet:true,
                  recharge_addr:"",
                  recharge_amt:0,
                  
                  window: {
                    width: 0,
                    height: 0
                  }

            }
          },
          methods:{
            change_language:function(lancode){
              langVar = lancode;
              this.$i18n.locale = lancode;
            },
            next_step:function(){
              //this.testingabc();
                console.log("paymentMedthod", this.selectedPaymentMethod);
                console.log("p - step == ", this.step);
                console.log("p - haveWallet == ", this.haveWallet);

                if(this.step == 12){
                  console.log("check extra field = " + (this.selectedCurrency.extraField)?"true":"false");
                  if((!!this.selectedPaymentMethod.extraField && this.selectedPaymentMethod.extraField.length > 0 && this.selectedPaymentMethod.paymentmethod_id != 2 )){
                    this.btn_text = 'lan.nextStep';
                    this.extra_info_title = this.selectedPaymentMethod.extraField[0].field_name_chn;
                    this.extra_info_placeHolder = this.selectedPaymentMethod.extraField[0].place_holder_chn;
                    if(this.bankList.length>0){
                      this.getAvbBankList(this.selectedCurrency.submit_id);
                    }
                    this.step = 20;
                  }else if(this.selectedPaymentMethod.paymentmethod_id == 2 && this.haveWallet == true){
                    //this.redirect('reCharge.aspx?lang='+langVar, this.order_id)
                    console.log("in topup");
                    let tmpPMList = generatePaymentMethodJSONWalletVersion(<%response.write(PayMethod)%>,false);
                    console.log("tmpPMList = ", tmpPMList);
                    for(let i = 0; i < tmpPMList.length; i++){
                      if(tmpPMList[i].paymentmethod_id == 3){
                        this.rechargePaymentList = [];
                        this.rechargePaymentList.push(tmpPMList[i]);
                        this.selectRechargePaymentMethod(this.rechargePaymentList[0]);
                        console.log("rechargePaymentList = ", this.rechargePaymentList);
                        //this.currencyList = this.paymentMethodJSON.currency;
                        this.step = 15;
                        break;
                      }
                    }
                    this.step = 15
                  }else{
                    this.alert = true;
                    this.submit_txn();
                  }
                }else if(this.step == 15){
                  this.btn_text = 'lan.nextStep';
                    this.extra_info_title = this.rechargePaymentList[0].extraField[0].field_name_chn;
                    this.extra_info_placeHolder = this.rechargePaymentList[0].extraField[0].place_holder_chn;
                    this.step = 20;
                }else if(this.step == 20){
                  this.alert = true;
                  this.submit_txn();
                }else if(this.step == 40){
                    this.step = 50;
                }

                if(this.alert != true){
                  this.checkDisableNextStep(this.step, 'next step');
                }     
            },
            selectWithWallet:function(isWithWallet){
              this.currencyList = "";
              this.currencyDivStyle="display:none;"
              this.selectedPaymentMethod = 0;
              this.selectedCurrency = 0;
              this.haveWallet = isWithWallet;
              //let tmpStr = (isWithWallet)?:[103];
              this.paymentMethodJSON = generatePaymentMethodJSONWalletVersion(<%response.write(PayMethod)%>,isWithWallet);
              console.log("complete selectWithWallet");
              this.step = 11;
            },
            submit_txn:function(){
              this.isWaitingForRetry=false;
              var payload = { TxID: "", Txtbox:"", Type:"", P1:""};
              payload.TxID = this.order_id;
              payload.Txtbox = this.pname;
              payload.Type = this.selectedCurrency.submit_id;
              payload.P1 = this.selectedBank;
              console.log("input = " + JSON.stringify(payload));
              this.$http.post("/API_Step3Submit.aspx?lang="+langVar,payload)
              .then(function(res){
                res.json();
                var resJson = res.body;
                let actioncode = resJson.actioncode;
                console.log("pong = " + JSON.stringify(resJson));
                  if(actioncode == 0){
                    this.redirect(resJson.ReturnURL+"?lang="+langVar, resJson.Token);
                  }else{
                    //this.waitForRetry(actioncode);
                    this.waitForRetry(10);
                  }
                }, function(res){
                  console.log(res);
                  alert("Fail");
               });
               
            },

            waitForRetry:function(s){
              this.isWaitingForRetry=true;
              this.startCountDown(s);
            },
            redirect:function(url, token){
              var form2 = document.createElement("form");
              form2.setAttribute("method","post");
              form2.setAttribute("action",url);
              var hiddenToken = document.createElement("input");
              hiddenToken.setAttribute("type","hidden");
              hiddenToken.setAttribute("name","Token");
              hiddenToken.setAttribute("value",token);
              var hiddenTxID = document.createElement("input");
              hiddenTxID.setAttribute("type","hidden");
              hiddenTxID.setAttribute("name","TxID");
              hiddenTxID.setAttribute("value",this.order_id);

              form2.appendChild(hiddenToken);
              form2.appendChild(hiddenTxID);
              document.body.appendChild(form2);
              form2.submit();
            },
            copy:function(txt){
              var copyTxt = document.querySelector('#copy_txt');
              copyTxt.setAttribute('type', 'text');
              copyTxt.setAttribute('value', txt);
              copyTxt.select();
              copyTxt.setSelectionRange(0, 99999);

              try{
                var successful = document.execCommand('copy');
              }catch(err){

              }

              copyTxt.setAttribute('type','hidden');
              window.getSelection().removeAllRanges();
            },
            startCountDown: function(s){
              let self = this;
              this.minutes="15";
              this.start = new Date().getTime();
              this.end = this.start + s*1000;
              // Update the count down every 1 second
              this.timerCount(this.start,this.end);
              this.interval = setInterval(function() {
                self.timerCount(self.start,self.end);
              }, 1000);
            },
            timerCount: function(start,end){
                // Get todays date and time
                var now = new Date().getTime();

                // Find the distance between now an the count down date
                var distance = start - now;
                var passTime =  end - now;

                if(distance < 0 && passTime < 0){
                    this.message = this.wordString.expired;
                    this.countDownStatus = "expired";
                    console.log("count down status = " + this.countDownStatus)
                    clearInterval(this.interval);
                    this.submit_txn();
                    return;

                }else if(distance < 0 && passTime > 0){
                    this.calcTime(passTime);
                    //this.message = this.wordString.running;
                    this.countDownStatus = "running";
                    //this.statusText = this.wordString.status.running;

                } else if( distance > 0 && passTime > 0 ){
                    this.calcTime(distance);
                    this.countDownStatus = "upcoming";
                }
            },
            calcTime: function(dist){
              // Time calculations for days, hours, minutes and seconds
                this.days = Math.floor(dist / (1000 * 60 * 60 * 24));
                this.hours = Math.floor((dist % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                this.minutes = Math.floor((dist % (1000 * 60 * 60)) / (1000 * 60));
                this.seconds = Math.floor((dist % (1000 * 60)) / 1000);
            },
            selectPaymentMethod: function(obj){
              console.log("in seletPaymentMethod")
              for(let i=0; i<this.paymentMethodJSON.length; i++){
                if(this.paymentMethodJSON[i].paymentmethod_id == obj.paymentmethod_id){
                  this.paymentMethodJSON[i].style_class = "button1 selected";
                  this.selectedPaymentMethod = obj;
                  console.log("selectPaymentMethod == ", obj);
                  this.selectedCurrency = this.autoSelectCurrency(obj);
                  if(this.selectedCurrency == 0){
                    this.currencyDivStyle = "display: inline-block;"
                  }else{
                    this.currencyDivStyle = "display: none;"
                  }
                  this.currencyList = obj.currency;
                }else{
                  this.paymentMethodJSON[i].style_class = "button1";
                }
              }
              this.step = 12;
              this.checkDisableNextStep(this.step,'selectPaymentMethod');
              
            },
            selectRechargePaymentMethod: function(obj){
              for(let i=0; i<this.rechargePaymentList.length; i++){
                if(this.rechargePaymentList[i].paymentmethod_id == obj.paymentmethod_id){
                  this.rechargePaymentList[i].style_class = "button1 selected";
                  //this.selectedPaymentMethod = obj;

                  //this.selectedRechargeCurrency = this.autoSelectCurrency(obj);
                  if(this.selectedCurrency == 0){
                    this.currencyDivStyle = "display: inline-block;"
                  }else{
                    this.currencyDivStyle = "display: none;"
                  }
                  this.currencyList = obj.currency;
                }else{
                  this.rechargePaymentList[i].style_class = "button1";
                }
                this.rechargeCurrencyList = this.rechargePaymentList[i].currency;
              }
              console.log("rechargeCurrencyList = " , this.rechargeCurrencyList)
              this.step = 12;
              //this.checkDisableNextStep(this.step);
            },
            selectCurrency: function(obj){
              for(let i=0; i<this.currencyList.length; i++){
                if(this.currencyList[i].submit_id == obj.submit_id){
                  this.currencyList[i].style_class = "button1 selected";
                  this.selectedCurrency = obj;
                }else{
                  //console.log("OFF pm_id = " + this.currencyList[i].submit_id);
                  this.currencyList[i].style_class = "button1";
                }
              }
              
              this.checkDisableNextStep(this.step,'selectCurrency');
            },
            selectRechargeCurrency: function(obj){
              for(let i=0; i<this.rechargeCurrencyList.length; i++){
                if(this.rechargeCurrencyList[i].submit_id == obj.submit_id){
                  this.rechargeCurrencyList[i].style_class = "button1 selected";
                  this.selectedRechargeCurrency = obj;
                }else{
                  //console.log("OFF pm_id = " + this.currencyList[i].submit_id);
                  this.rechargeCurrencyList[i].style_class = "button1";
                }
              }
              this.checkDisableNextStep(this.step, 'selectRechargeCurrency');
            },
            autoSelectCurrency:function(obj){
              if(obj.currency.length == 1){
                return obj.currency[0];
              }else{
                return 0;
              }
            },
            checkDisableNextStep: function(step, checkPoint){
              console.log("cdns = ", checkPoint);
              switch(step){
                case 12:
                  console.log("step== ", step);
                  this.disableNextStep = (this.selectedCurrency!=0)?false:true;
                  console.log("disableNextStep == ", this.disableNextStep);
                  if(this.disableNextStep == false){
                    this.next_step();
                  }
                  break;
                case 15:
                  let output = true;
                  output = output && (this.recharge_addr.trim().length>0)?true:false;
                  output = output && !!parseFloat(this.recharge_amt);
                  output = output && !!this.selectedRechargeCurrency;
                  this.disableNextStep = !output;
                  if(this.disableNextStep == false){
                    //this.next_step();
                  }
                  break;
                case 20:
                  let tmp = true;
                  if (this.selectedCurrency.code=="MYR"){
                    if(this.selectedBank == "")
                      tmp = false;
                  }
                  this.disableNextStep = (this.pname.length >0 && tmp)?false:true;
                  break;
                default:
                  this.disableNextStep = false;
                  break;
              }
            },
            goBack:function(){
              window.history.back();
            },
            checkBroswer:function(){
              var ua = window.navigator.userAgent;
              //console.log("ua = ", ua);
              var msie = ua.indexOf("MSIE");

              if (msie > 0) // If Internet Explorer, return version number
              {
                  window.location('/NotSupport.html')
              }
            },
            goURL:function(url){
              window.location.href = url;
            },
            handleWindowResize:function(){
                      var w = window.innerWidth
                        || document.documentElement.clientWidth
                        || document.body.clientWidth;

                      var h = window.innerHeight
                        || document.documentElement.clientHeight
                        || document.body.clientHeight;

                      this.window.width = w;
                      this.window.height = h;
                    }
          },
          mounted:function(){
            //this.checkBroswer();
            this.checkDisableNextStep(this.step, "in mount");
            this.selectWithWallet(true);
            this.selectPaymentMethod(
              {
        "paymentmethod_id":1,
        "paymentmethod_name_chn":"我要轉幣",
        "paymentmethod_name_eng":"Exchange to",
        "code":"transit2",
        "style_class":"button1",
        "isSelectable":false,
        "currency":[
            {
                "sys_id":[3,103],
                "submit_id":3,
                "currency_name_chn":"ERC20",
                "currency_name_eng":"ERC20",
                "code":"USDT",
                "style_class":"button1",
                "isSelectable":true
            },
            {
                "sys_id":[105],
                "submit_id":105,
                "currency_name_chn":"TRC20",
                "currency_name_eng":"TRC20",
                "code":"USDT",
                "style_class":"button1",
                "isSelectable":true
            },
			{
                "sys_id":[999999],
                "submit_id":999999,
                "currency_name_chn":"匯款買幣",
                "currency_name_eng":"Buy USDT",
                "code":"TT",
                "style_class":"button1",
                "isSelectable":true
            },
            
        ],
        "extraField":[]
    }
            );
            //this.paymentMethodJSON = generatePaymentMethodJSON([1,21,101,102,103,104]);
            //console.log("bankList = ", this.bankList);
            //console.log("JSON = " + JSON.stringify(this.paymentMethodJSON));
          },
          created:function(){
            window.addEventListener('resize', this.handleWindowResize);
            this.handleWindowResize();
          },
          destroyed:function(){
            window.removeEventListener('resize', this.handleWindowResize);
          }

        })
      </script>

    </form>

</body>
</html>
