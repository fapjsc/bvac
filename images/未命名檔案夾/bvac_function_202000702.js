/*************************
* java script for BVAC
**************************/

var paymentMethodObjList = [
    {
        "paymentmethod_id":1,
        "paymentmethod_name_chn":"lan.onlineBank",
        "paymentmethod_name_eng":"網銀",
        "code":"UP",
        "isSelectable":false,
        "style_class":"button1",
        "currency":[
            {
                "sys_id":[1,101,1001],
                "submit_id":1,
                "currency_name_chn":"lan.rmb",
                "currency_name_eng":"RMB",
                "code":"RMB",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[4,104],
                "submit_id":4,
                "currency_name_chn":"lan.usd",
                "currency_name_eng":"USD",
                "code":"USD",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[5,105],
                "submit_id":5,
                "currency_name_chn":"lan.jpy",
                "currency_name_eng":"YEN",
                "code":"YEN",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[21,121],
                "submit_id":6,
                "currency_name_chn":"lan.myr",
                "currency_name_eng":"MYR",
                "code":"MYR",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[7,107],
                "submit_id":7,
                "currency_name_chn":"lan.eur",
                "currency_name_eng":"EUR",
                "code":"EUR",
                "style_class":"button1",
                "isSelectable":false
            }
        ],
        "extraField":[
            {
                "field_name_chn":"lan.enterBankAccHolderName",
                "field_name_eng":"name",
                "place_holder_chn":"lan.enterBankAccHolderRealName",
                "place_holder_eng":"",
                "field_value":""
            },
        ]
    },
    {
        "paymentmethod_id":2,
        "paymentmethod_name_chn":"lan.visaMaster",
        "paymentmethod_name_eng":"VISA / MASTER",
        "code":"VISA",
        "style_class":"button1",
        "isSelectable":false,
        "currency":[
            {
                "sys_id":[8,108],
                "submit_id":8,
                "currency_name_chn":"lan.rmb",
                "currency_name_eng":"RMB",
                "code":"RMB",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[9,109],
                "submit_id":9,
                "currency_name_chn":"lan.usd",
                "currency_name_eng":"USD",
                "code":"USD",
                "style_class":"button1",
                "isSelectable":false
            }
        ],
        "extraField":[]
    },
    {
        "paymentmethod_id":3,
        "paymentmethod_name_chn":"lan.alipay",
        "paymentmethod_name_eng":"Ali Pay",
        "code":"ALI",
        "style_class":"button1",
        "isSelectable":false,
        "currency":[
            {
                "sys_id":[2,102],
                "submit_id":2,
                "currency_name_chn":"lan.alipay",
                "currency_name_eng":"Ali Pay",
                "code":"ALI",
                "style_class":"button1",
                "isSelectable":false
            }
        ],
        "extraField":[
            {
                "field_name_chn":"輸入支付寶持有人姓名的",
                "field_name_eng":"name",
                "place_holder_chn":"輸入支付寶持有人的真實姓名",
                "place_holder_eng":"",
                "field_value":""
            },
        ]
    },
    {
        "paymentmethod_id":4,
        "paymentmethod_name_chn":"TT pay",
        "paymentmethod_name_eng":"TT Pay",
        "code":"TT",
        "style_class":"button1",
        "isSelectable":false,
        "currency":[
            {
                "sys_id":[10,110],
                "submit_id":10,
                "currency_name_chn":"TT pay",
                "currency_name_eng":"TT pay",
                "code":"TT",
                "style_class":"button1",
                "isSelectable":false
            }
        ],
        "extraField":[]
    },
    {
        "paymentmethod_id":5,
        "paymentmethod_name_chn":"Crypto",
        "paymentmethod_name_eng":"Crypto",
        "code":"CRY",
        "style_class":"button1",
        "isSelectable":false,
        "currency":[
            {
                "sys_id":[11,111],
                "submit_id":11,
                "currency_name_chn":"Bitcoin",
                "currency_name_eng":"Bitcoin",
                "code":"BITCOIN",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[12,112],
                "submit_id":12,
                "currency_name_chn":"ETH",
                "currency_name_eng":"ETH",
                "code":"ETH",
                "style_class":"button1",
                "isSelectable":false
            },
            {
                "sys_id":[3,103],
                "submit_id":3,
                "currency_name_chn":"USDT",
                "currency_name_eng":"USDT",
                "code":"USDT",
                "style_class":"button1",
                "isSelectable":false
            },
        ],
        "extraField":[]
    },
];

/*
function generatePaymentMethodJSON(availableList){
    let output = paymentMethodObjList;
    for(let i=0; i<availableList.length; i++){
        for(let j=0; j<output.length; j++){
            for(let k=0; k<output[j].currency.length; k++){
                if(availableList[i] == output[j].currency[k].sys_id){
                    output[j].isSelectable = true;
                    output[j].currency[k].isSelectable = true;
                }
            }
        }
    }
    return output;
};
*/
function generatePaymentMethodJSON(availableList){
    let output = paymentMethodObjList;
    for(let i=0; i<availableList.length; i++){
        for(let j=0; j<output.length; j++){
            for(let k=0; k<output[j].currency.length; k++){
                for(let m=0; m<output[j].currency[k].sys_id.length; m++){
                    if(availableList[i] == output[j].currency[k].sys_id[m]){
                        output[j].isSelectable = true;
                        output[j].currency[k].isSelectable = true;
                        output[j].currency[k].submit_id = output[j].currency[k].sys_id[m];
                    }
                }
            }
        }
    }
    return output;
};


function generatePaymentChoice(){
    let src = paymentMethodObjList;
    let output = [];
    for(let i=0; i<src.length; i++){
        let tmp = {"id":src[i].paymentmethod_id, style:"btn_normal_style"}
        output.push(tmp);
    }
    return output;
};

function generatecurrencyChoice(){
    let src = paymentMethodObjList;
    let output = [];
    for(let i=0; i<src.length; i++){
        for(let j=0; j<src[i].currency.length; j++){
            let tmp = {"id":src[i].currency[j].sys_id, style:"btn_normal_style"}
            output.push(tmp);
        }
    }
    return output;
};

function waitForServerRespond(s, lang){
    setTimeout(function () {
        window.location.href = 'TX_Order.aspx?'+lang;
    }, s);
};
