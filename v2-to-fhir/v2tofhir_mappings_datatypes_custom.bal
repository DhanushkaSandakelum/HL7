import wso2healthcare/healthcare.hl7v23;
import wso2healthcare/healthcare.fhir.r4;

function HL7V2_XCN_to_FHIR_Reference(hl7v23:XCN xcn) returns r4:Reference => {
    reference: xcn.xcn1
};

function HL7V2_TS_to_FHIR_dateTime(hl7v23:TS ts) returns r4:dateTime {
    return ts.ts1;
};

function HL7V2_ID_to_FHIR_Coding(hl7v23:ID id) returns r4:Coding => {
    id: id
};
