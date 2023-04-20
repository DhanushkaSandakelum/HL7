import wso2healthcare/healthcare.hl7v23;
import wso2healthcare/healthcare.fhir.r4;

// --------------------------------------------------------------------------------------------#
// Source HL7 Version 2 to FHIR - Datatype Maps
// URL: https://build.fhir.org/ig/HL7/v2-to-fhir/branches/master/datatype_maps.html
// --------------------------------------------------------------------------------------------#

// function HL7V2_CM_to_FHIR_Specimen(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_CNE_to_FHIR_CodeableConcept(hl7v23:CNE cne) returns r4:CodeableConcept {
    r4:Coding[] coding = [
        {
            code: cne.cne1,
            display: cne.cne2,
            system: cne.cne3,
            'version: cne.cne7
        },
        {
            code: cne.cne4,
            display: cne.cne5,
            system: cne.cne6,
            'version: cne.cne8
        }
    ];

    r4:CodeableConcept codeableConcept = {
        text: cne.cne9,
        coding: coding
    };

    return codeableConcept;
};

// function HL7V2_CNN_to_FHIR_Practitioner(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_CQ_to_FHIR_Quantity(hl7v23:CQ cq) returns r4:Quantity => {
    value: <decimal>cq.cq1,
    unit: cq.cq2
};

function HL7V2_CE_to_FHIR_Annotation(hl7v23:CE ce) returns r4:Annotation => {
    text: ce.ce1
};

function HL7V2_CE_to_FHIR_CodeableConcept(hl7v23:CE ce) returns r4:CodeableConcept => {
    coding: HL7V2_GetCodings(ce)
};

function HL7V2_CE_to_FHIR_Coding(hl7v23:CE ce) returns r4:Coding => {
    code: ce.ce1,
    display: ce.ce2,
    system: ce.ce3
};

function HL7V2_CWE_to_FHIR_Duration(hl7v23:CE ce) returns r4:Duration => {
    code: ce.ce1
};

function HL7V2_CE_to_FHIR_Organization(hl7v23:CE ce) returns r4:Organization {
    r4:Identifier[] identifier = [
        {
            value: ce.ce1,
            system: ce.ce3
        }
    ];

    r4:Organization organization = {
        name: ce.ce2,
        identifier: identifier
    };

    return organization;
};

function HL7V2_CE_to_FHIR_Quantity(hl7v23:CE ce) returns r4:Quantity => {
    code: ce.ce1,
    unit: ce.ce2,
    system: ce.ce3
};

function HL7V2_CE_to_FHIR_code(hl7v23:CE ce) returns r4:code {
    r4:code code = ce.ce1;

    return code;
};

function HL7V2_CE_to_FHIR_string(hl7v23:CE ce) returns string {
    return ce.ce1;
};

function HL7V2_CE_to_FHIR_uri(hl7v23:CE ce) returns r4:uri {
    return ce.ce1;
};

function HL7V2_CX_to_FHIR_Identifier(hl7v23:CX cx) returns r4:Identifier {
    r4:Extension[] extension = [
        {
            url: cx.cx2,
            valueString: cx.cx3
        },
        {
            url: cx.cx3,
            valueCode: cx.cx3
        }
    ];

    r4:Identifier identifier = {
        extension: extension,
        value: cx.cx1,
        system: cx.cx4.hd1
    };

    return identifier;
};

function HL7V2_DLN_to_FHIR_Identifier(hl7v23:DLN dln) returns r4:Identifier => {
    value: dln.dln1,
    system: dln.dln2,
    period: {
        end: dln.dln3
    }
};

function HL7V2_DR_to_FHIR_DateTime(hl7v23:DR dr) returns r4:dateTime {
    return dr.dr1.ts1;
};

function HL7V2_DR_to_FHIR_Period(hl7v23:DR dr) returns r4:Period => {
    'start: dr.dr1.ts1,
    end: dr.dr2.ts1
};

function HL7V2_ED_to_FHIR_Attachment(hl7v23:ED ed) returns r4:Attachment {
    r4:Extension[] extension = [
        {
            url: ed.ed2,
            valueCodeableConcept: HL7V2_ID_to_FHIR_CodeableConcept(ed.ed2)
        }
    ];

    r4:Attachment attachment = {
        data: ed.ed5,
        contentType: ed.ed3,
        extension: extension
    };

    return attachment;
};

function HL7V2_EI_to_FHIR_Coding(hl7v23:EI ei) returns r4:Coding => {
    code: ei.ei1,
    system: ei.ei2
};

// function HL7V2_EIP_to_FHIR_Identifier(hl7v23:XCN xcn) returns r4:Practitioner => {};
// function HL7V2_EIP_to_FHIR_Device(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_EI_to_FHIR_Procedure(hl7v23:EI ei) returns r4:Procedure => {
    subject: {
        identifier: {
            value: ei.ei1
        }
    },
    status: "unknown"
};

function HL7V2_EI_to_FHIR_Identifier(hl7v23:EI ei) returns r4:Identifier => {
    value: ei.ei1
};

function HL7V2_EI_to_FHIR_Device(hl7v23:EI ei) returns r4:Device {
    r4:DeviceUdiCarrier[] deviceUdiCarrier = [
        {
            deviceIdentifier: ei.ei1
        }
    ];

    r4:Device device = {
        udiCarrier: deviceUdiCarrier
    };

    return device;
};

function HL7V2_FN_to_FHIR_HumanName(hl7v23:FN fn) returns r4:HumanName => {
    family: fn.fn1
};

function HL7V2_HD_to_FHIR_Location(hl7v23:HD hd) returns r4:Location {
    r4:Identifier[] identifier = [
        {
            value: hd.hd2
        }
    ];

    r4:Coding[] coding = [
        {
            code: hd.hd2,
            system: hd.hd2
        }
    ];

    r4:Location location = {
        name: hd.hd1,
        identifier: identifier,
        physicalType: {
            coding: coding
        }
    };

    return location;
};

function HL7V2_HD_to_FHIR_Organization(hl7v23:HD hd) returns r4:Organization {
    r4:Element element = {
        id: hd.hd3
    };

    r4:Identifier[] identifier = [
        {
            value: hd.hd1 + hd.hd2,
            'type: element,
            system: hd.hd3
        }
    ];

    r4:Organization organization = {
        identifier: identifier
    };

    return organization;
};

// function HL7V2_HD_to_FHIR_extension(hl7v23:HD hd) returns r4:Extension => {};

function HL7V2_HD_to_FHIR_MessageHeader_destination(hl7v23:HD hd) returns r4:MessageHeaderDestination => {
    name: hd.hd1,
    endpoint: hd.hd2,
    extension: V2ToFHIR_GetStringExtension([hd.hd3])

};

function HL7V2_HD_to_FHIR_MessageHeader_source(hl7v23:HD hd) returns r4:MessageHeaderSource => {
    name: hd.hd1,
    endpoint: hd.hd2,
    extension: V2ToFHIR_GetStringExtension([hd.hd3])
};

function HL7V2_HD_to_FHIR_url(hl7v23:HD hd) returns r4:url {
    return <r4:url>hd.hd1;
};

function HL7V2_ID_to_FHIR_CodeableConcept(hl7v23:ID id) returns r4:CodeableConcept {
    r4:Coding[] coding = [
        {
            code: id
        }
    ];

    r4:CodeableConcept codeableConcept = {
        coding: coding
    };

    return codeableConcept;
};

function HL7V2_IS_to_FHIR_CodeableConcept(hl7v23:IS 'is) returns r4:CodeableConcept {
    r4:Coding[] coding = [{code: 'is}];

    r4:CodeableConcept codeableConcept = {
        coding: coding
    };

    return codeableConcept;
};

function HL7V2_MSG_to_FHIR_Coding(hl7v23:CM_MSG msg) returns r4:Coding => {
    code: msg.cm_msg1,
    system: msg.cm_msg2
};

function HL7V2_MSG_to_FHIR_MessageHeader(hl7v23:CM_MSG msg) returns r4:MessageHeader => {
    eventCoding: {
        system: msg.cm_msg2
    },
    eventUri: "",
    'source: {endpoint: ""}
};

// function HL7V2_NA_to_FHIR_NumericArray(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_NDL_to_FHIR_PractitionerRole(hl7v23:CM_NDL ndl) returns r4:PractitionerRole => {
    practitioner: HL7V2_CN_to_FHIR_Reference(ndl.cm_ndl1),
    period: {
        'start: HL7V2_TS_to_FHIR_dateTime(ndl.cm_ndl2),
        end: HL7V2_TS_to_FHIR_dateTime(ndl.cm_ndl3)
    },
    identifier: [HL7V2_IS_to_FHIR_Identifier(ndl.cm_ndl4)]
};

// function HL7V2_NR_to_FHIR_Ranger(hl7v23:XCN xcn) returns r4:Practitioner => {};

// TODO: Complex mapping
// function HL7V2_PL_to_FHIR_Location(hl7v23:PL pl) returns r4:Location => {};

// function HL7V2_PLN_to_FHIR_Identifier(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_PT_to_FHIR_Meta(hl7v23:PT pt) returns r4:Meta {
    r4:Coding[] coding = [
        {
            code: pt.pt1,
            system: pt.pt2
        }
    ];

    r4:Meta meta = {
        tag: coding
    };

    return meta;
};

function HL7V2_RI_to_FHIR_Timing(hl7v23:RI ri) returns r4:Timing => {
    code: V2ToFHIR_GetRepeatCode(ri.ri1),
    repeat: {
        timeOfDay: [ri.ri2]
    }
};

function HL7V2_RP_to_FHIR_Attachment(hl7v23:RP xcn) returns r4:Attachment => {
    url: xcn.rp1,
    contentType: xcn.rp3
};

// function HL7V2_SAD_to_FHIR_Address(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_SN_to_FHIR_Quantity(hl7v23:SN sn) returns r4:Quantity => {
    comparator: V2ToFHIR_GetQuantityComparatorCode(sn.sn1),
    value: <decimal>sn.sn2
};

function HL7V2_SN_to_FHIR_Range(hl7v23:SN sn) returns r4:Range => {
    low: {
        value: <decimal>sn.sn2
    },
    high: {
        value: <decimal>sn.sn4
    }
};

function HL7V2_SN_to_FHIR_Ratio(hl7v23:SN sn) returns r4:Ratio => {
    numerator: {
        value: <decimal>sn.sn2
    },
    denominator: {
        value: <decimal>sn.sn4
    }
};

function HL7V2_ST_to_FHIR_Identifier(hl7v23:ST st) returns r4:Identifier => {
    value: st
};

// TODO: Complex mapping
// function HL7V2_TQ_to_FHIR_MedicationRequest(hl7v23:TQ tq) returns r4:MedicationRequest => {};

// TODO: Complex mapping
// function HL7V2_TQ_to_FHIR_ServiceRequest(hl7v23:XCN xcn) returns r4:Practitioner => {};

// TODO: Complex mapping
// function HL7V2_TQ_to_FHIR_Task(hl7v23:XCN xcn) returns r4:Practitioner => {};

function HL7V2_XAD_to_FHIR_Address(hl7v23:XAD xad) returns r4:Address => {
    line: [xad.xad1, xad.xad2],
    city: xad.xad3,
    state: xad.xad4,
    postalCode: xad.xad5,
    country: xad.xad6,
    'type: CheckComputableANTLR([{identifier: xad.xad7, comparisonOperator: "IN", valueList: ["M", "SH"]}]) ? V2ToFHIR_GetAddressType(xad.xad7) : (),
    use: CheckComputableANTLR([{identifier: xad.xad7, comparisonOperator: "IN", valueList: ["BA", "BI", "C", "B", "H", "O"]}]) ? V2ToFHIR_GetAddressUse(xad.xad7) : (),
    extension: V2ToFHIR_GetStringExtension([xad.xad7, xad.xad10]),
    district: xad.xad9
};

// function HL7V2_XCN_to_FHIR_Practitioner(hl7v23:XCN xcn) returns r4:Practitioner => {};
// function HL7V2_XCN_to_FHIR_PractitionerRole(hl7v23:XCN xcn) returns r4:PractitionerRole => {};
// function HL7V2_XCN_to_FHIR_RelatedPerson(hl7v23:XCN xcn) returns r4:RelatedPerson => {};
// function HL7V2_XON_to_FHIR_Location(hl7v23:XON xon) returns r4:Location => {};

function HL7V2_XON_to_FHIR_Organization(hl7v23:XON xon) returns r4:Organization {
    r4:Coding coding = {
        code: xon.xon7,
        system: xon.xon7
    };

    r4:CodeableConcept codeableConcept = {
        coding: [
            coding
        ]
    };

    r4:Identifier identifier = {
        value: xon.xon3.toString(),
        'type: codeableConcept
    };

    r4:Organization organization = {
        name: xon.xon1,
        identifier: [identifier]
    };

    return organization;
};

// function HL7V2_XON_to_FHIR_string(hl7v23:XON xon) returns string => {};

function HL7V2_XPN_to_FHIR_HumanName(hl7v23:XPN xpn) returns r4:HumanName => {
    family: xpn.xpn1,
    given: [xpn.xpn2, xpn.xpn3],
    suffix: [xpn.xpn4, xpn.xpn6],
    prefix: [xpn.xpn5],
    use: V2ToFHIR_GetHumanNameUse(xpn.xpn7)
};

function HL7V2_XTN_to_FHIR_ContactPoint(hl7v23:XTN xtn) returns r4:ContactPoint => {
    value: CheckComputableANTLR([
            {identifier: xtn.xtn3, comparisonOperator: "NIN", valueList: ["Internet", "X.400"]},
            {identifier: xtn.xtn7.toString(), comparisonOperator: "IN", valueList: []}
            //, {identifier: xtn.xtn12, comparisonOperator: "IN", valueList: []}                    //TODO: xtn12 is not defined yet
        ]) ? xtn.xtn1 :
            (CheckComputableANTLR([{identifier: xtn.xtn3, comparisonOperator: "NIN", valueList: ["Internet", "X.400"]}])) ? (xtn.xtn4) : (),
    use: V2ToFHIR_GetContactPointUse(xtn.xtn2),
    system: V2ToFHIR_GetContactPointSystem(xtn.xtn3),
    extension: V2ToFHIR_GetIntegerExtension([<int>xtn.xtn5, <int>xtn.xtn6, <int>xtn.xtn7, <int>xtn.xtn8])
};

