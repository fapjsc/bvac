/*************************
* java script for BVAC
**************************/

var paymentMethodObjList = [
    {
        "paymentmethod_id":1,
        "paymentmethod_name_chn":"TT pay",
        "paymentmethod_name_eng":"TT pay",
        "isSelectable":false,
        "curreny":[
            {
                "sys_id":1,
                "curreny_name_chn":"Bitcoin",
                "curreny_name_eng":"Bitcoin",
                "isSelectable":false
            }
        ]
    },
    {
        "paymentmethod_id":2,
        "paymentmethod_name_chn":"網銀",
        "paymentmethod_name_eng":"網銀",
        "isSelectable":false,
        "curreny":[
            {
                "sys_id":2,
                "curreny_name_chn":"人民幣",
                "curreny_name_eng":"RMB",
                "isSelectable":false
            },
            {
                "sys_id":3,
                "curreny_name_chn":"美元",
                "curreny_name_eng":"USD",
                "isSelectable":false
            }
        ],
        "extraField":[
            {
                "field_name_chn":"name",
                "field_name_end":"name",
                "field_value":""
            },
            {
                "field_name_chn":"Account Number",
                "field_name_end":"Account Number",
                "field_value":""
            },
        ]
    },
    {
        "paymentmethod_id":3,
        "paymentmethod_name_chn":"Cryto",
        "paymentmethod_name_eng":"Cryto",
        "isSelectable":false,
        "curreny":[
            {
                "sys_id":4,
                "curreny_name_chn":"ETH",
                "curreny_name_eng":"ETH",
                "isSelectable":false
            },
            {
                "sys_id":5,
                "curreny_name_chn":"USPT(ERC20)",
                "curreny_name_eng":"USPT(ERC20)",
                "isSelectable":false
            }
        ],
    },
];

function generatePaymentMethodJSON(availableList){
    let output = paymentMethodObjList;
    for(let i=0; i<availableList.length; i++){
        for(let j=0; j<output.length; j++){
            for(let k=0; k<output[j].curreny.length; k++){
                if(availableList[i] == output[j].curreny[k].sys_id){
                    output[j].isSelectable = true;
                    output[j].curreny[k].isSelectable = true;
                }
            }
        }
    }
    return output;
};

function waitForServerRespond(s){
    setTimeout(function () {
        window.location.href = 'TX_Order.aspx';
    }, s);
};
