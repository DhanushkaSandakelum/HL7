import wso2healthcare/healthcare.hl7v23;
import wso2healthcare/healthcare.fhir.r4;

// TODO: Need to be properly mapped, currenly just mapped as this
function HL7V2_XCN_to_FHIR_Reference(hl7v23:XCN xcn) returns r4:Reference => {
    reference: xcn.xcn1
};

function HL7V2_XCN_to_FHIR_CodeableConcept(hl7v23:XCN xcn) returns r4:CodeableConcept => {
    id: xcn.xcn1
};

function HL7V2_TS_to_FHIR_dateTime(hl7v23:TS ts) returns r4:dateTime {
    return ts.ts1;
};

function HL7V2_TS_to_FHIR_instant(hl7v23:TS ts) returns r4:instant {
    return ts.ts1;
};

function HL7V2_ID_to_FHIR_Coding(hl7v23:ID id) returns r4:Coding => {
    id: id
};

function HL7V2_CN_to_FHIR_Reference(hl7v23:CN cn) returns r4:Reference => {
    reference: cn.cn1
};

function HL7V2_IS_to_FHIR_Identifier(hl7v23:IS 'is) returns r4:Identifier => {
    id: 'is
};
