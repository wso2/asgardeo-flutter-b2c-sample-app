
class Util{

  Map generateUpdateRequestBody(firstName, lastName, country){
    Map data = {
      "schemas": [
        "urn:ietf:params:scim:api:messages:2.0:PatchOp"
      ],
      "Operations": [
        {
          "op": "replace",
          "value": {
            "name":{
              "givenName": "$firstName",
              "familyName": "$lastName"
            },
            "urn:scim:wso2:schema":{
              "country":"$country"
            }
          }
        }
      ]
    };
    return data ;
  }

}
