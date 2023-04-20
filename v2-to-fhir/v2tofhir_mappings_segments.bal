import wso2healthcare/healthcare.hl7v23;
import wso2healthcare/healthcare.fhir.r4;

// --------------------------------------------------------------------------------------------#
// Source HL7 Version 2 to FHIR - Segment Maps
// URL: https://build.fhir.org/ig/HL7/v2-to-fhir/branches/master/segment_maps.html
// --------------------------------------------------------------------------------------------#

// --- Control ---
// function HL7V2_MSA_to_FHIR_MessageHeader(hl7v23:MSA msa) returns r4:MessageHeader => {};
// function HL7V2_MSH_to_FHIR_Bundle(hl7v23:MSH msh) returns r4:Bundle => {};

function HL7V2_MSH_to_FHIR_MessageHeader(hl7v23:MSH msh) returns r4:MessageHeader => {
    'source: HL7V2_HD_to_FHIR_MessageHeader_source(msh.msh3),
    destination: [HL7V2_HD_to_FHIR_MessageHeader_destination(msh.msh5)],
    eventCoding: HL7V2_MSG_to_FHIR_Coding(msh.msh9),
    meta: <r4:BaseMessageHeaderMeta>HL7V2_PT_to_FHIR_Meta(msh.msh11),
    language: HL7V2_CE_to_FHIR_code(msh.msh19),
    eventUri: ""
};

// function HL7V2_MSH_to_FHIR_Provenance(hl7v23:MSH msh) returns r4:Provenance => {};

// TODO: No NTE in spec
// function HL7V2_NTE_to_FHIR_Observation(hl7v23:NTE pid) returns r4:Observation => {};

// function HL7V2_NTE_to_FHIR_ServiceRequest(hl7v23:PID pid) returns r4:ServiceRequest => {};

// function HL7V2_SFT_to_FHIR_MessageHeader(hl7v23:PID pid) returns r4:MessageHeader => {};

// --- Patient Administation
function HL7V2_AL1_to_FHIR_AllerygyIntolerance(hl7v23:AL1 al1) returns r4:AllergyIntolerance {
    r4:Coding[] coding = [
        {
            code: al1.al11.toString(),
            system: al1.al11.toString()
        }
    ];

    r4:AllergyIntoleranceReaction[] allergyIntoleranceReaction = [
        {
            manifestation: [
                {
                    text: al1.al15
                }
            ],
            onset: al1.al16
        }
    ];

    r4:AllergyIntolerance allergyIntolerance = {
        clinicalStatus: {
            coding: coding
        },
        category: [V2ToFHIR_GetAllergyIntoleranceCategory(al1.al12)],
        'type: V2ToFHIR_GetAllergyIntoleranceType(al1.al12),
        code: HL7V2_CE_to_FHIR_CodeableConcept(al1.al13),
        criticality: V2ToFHIR_GetAllergyIntoleranceCriticality(al1.al14),
        reaction: allergyIntoleranceReaction,
        patient: {}
    };

    return allergyIntolerance;
};

// TODO: Ballerina FHIR EVN and HL7 EVN is different for some fields
function HL7V2_EVN_to_FHIR_Provenance(hl7v23:EVN evn) returns r4:Provenance {
    r4:Coding[] coding = [
        {
            display: evn.name
        }
    ];

    r4:Extension[] extension = [
        {
            url: evn.evn4
            // ,
            // valueCodeableConcept: evn.evn4
        }
    ];

    r4:CodeableConcept[] reason = [
        {
            extension: extension
        }
    ];

    r4:ProvenanceAgent[] agent = [
        {
            who: HL7V2_XCN_to_FHIR_Reference(evn.evn5)
        }
    ];

    r4:Provenance provenance = {
        activity: {
            coding: coding
        },
        recorded: evn.evn2.ts1,
        reason: reason,
        meta: {
            extension: extension
        },
        agent: agent,
        occurredDateTime: evn.evn6.ts1,
        target: []
    };

    return provenance;
};

// function HL7V2_IAM_to_FHIR_AllergyIntolerance(hl7v23:PID pid) returns r4:AllergyIntolerance => {};

function HL7V2_NK1_to_FHIR_Patient(hl7v23:NK1 nk1) returns r4:Patient => {
    contact: GetHL7v23_NK1_Contact(nk1.nk12, nk1.nk14, nk1.nk15, nk1.nk16, nk1.nk17, nk1.nk18, nk1.nk19, nk1.nk113, nk1.nk115, nk1.nk130, nk1.nk131, nk1.nk132)
};

// function HL7V2_NK1_to_FHIR_RelatedPerson(hl7v23:NK1 nk1) returns r4:RelatedPerson => {};

function HL7V2_PD1_to_FHIR_Patient(hl7v23:PD1 pd1) returns r4:Patient => {
    generalPractitioner: GetHL7v23_PD1_GeneralPractitioner(pd1.pd13, pd1.pd14),
    extension: GetHL7v23_PD1_Extension(pd1.pd16)
};

// function HL7V2_PID_to_FHIR_Account(hl7v23:PID pid) returns r4:Account => {};

function HL7V2_PID_to_FHIR_Patient(hl7v23:PID pid) returns r4:Patient => {
    name: GetHL7v23_PID_PatientName(pid.pid5, pid.pid9),
    birthDate: pid.pid7.ts1,
    gender: GetHL7v23_PID_AdministrativeSex(pid.pid8),
    address: GetHL7v23_PID_Address(pid.pid12, pid.pid11),
    telecom: GetHL7v23_PID_PhoneNumber(pid.pid13, pid.pid14),
    communication: GetHL7v23_PID_PrimaryLanguage(pid.pid15),
    maritalStatus: {
        coding: GetHL7v23_PID_MaritalStatus(pid.pid16)
    },
    identifier: GetHL7v23_PID_SSNNumberPatient(pid.pid19),
    extension: GetHL7v23_PID_BirthPlace(pid.pid23),
    multipleBirthBoolean: GetHL7v23_PID_MultipleBirthIndicator(pid.pid24),
    multipleBirthInteger: GetHL7v23_PID_BirthOrder(pid.pid25),
    deceasedDateTime: pid.pid29.ts1,
    deceasedBoolean: GetHL7v23_PID_PatientDeathIndicator(pid.pid30)
};

// function HL7V2_PID_to_FHIR_Observation(hl7v23:PID pid) returns r4:Observation => {};
// function HL7V2_PID_to_FHIR_RelatedPerson(hl7v23:PID pid) returns r4:RelatedPerson => {};
// function HL7V2_PID_to_FHIR_Observation(hl7v23:PID pid) returns r4:Observation => {};
// function HL7V2_PV1_to_FHIR_Encounter(hl7v23:PV1 pv1) returns r4:Encounter => {};

function HL7V2_PV1_to_FHIR_Patient(hl7v23:PV1 pv1) returns r4:Patient => {
    extension: GetHL7v23_PV1_Extension(pv1.pv116)
};

function HL7V2_PV2_to_FHIR_Encounter(hl7v23:PV2 pv2) returns r4:Encounter {
    r4:EncounterLocation[] location = [
        {
            location: {
                display: pv2.pv21.pl1 // TODO: location need to mapped correctly
            }
        }
    ];

    r4:Coding[] coding = [HL7V2_ID_to_FHIR_Coding(pv2.pv222)];

    r4:EncounterParticipant[] participant = [{id: pv2.pv213.xcn1}]; // TODO: participant need to mapped correctly

    r4:Encounter encounter = {
        location: location,
        reasonCode: HL7V2_GetCodeableConcepts(pv2.pv23),
        length: {
            value: <decimal>pv2.pv211
        },
        text: {
            div: pv2.pv212,
            status: "empty"
        },
        priority: {
            text: pv2.pv225
        },
        meta: {
            security: coding
        },
        participant: participant,
        'class: {},
        status: "in-progress"
    };

    return encounter;
};

// --- Order Entry ---
function HL7V2_OBR_to_FHIR_DiagnosticReport(hl7v23:OBR obr) returns r4:DiagnosticReport {
    r4:DiagnosticReport diagnosticReport = {
        subject: {
            identifier: HL7V2_EI_to_FHIR_Identifier(obr.obr2[0])
        },
        code: HL7V2_CE_to_FHIR_CodeableConcept(obr.obr4),
        effectiveDateTime: HL7V2_TS_to_FHIR_dateTime(obr.obr7),
        effectivePeriod: {
            'start: HL7V2_TS_to_FHIR_dateTime(obr.obr7),
            end: HL7V2_TS_to_FHIR_dateTime(obr.obr8)
        },
        issued: HL7V2_TS_to_FHIR_instant(obr.obr22),
        category: HL7V2_GetCodeableConceptsGivenID(obr.obr24),
        status: V2ToFHIR_GetDiagnosticReportStatus(obr.obr25)
        // resultsInterpreter: HL7V2_NDL_to_FHIR_PractitionerRole(obr.obr32),
        // performer: obr.obr34 + obr.obr35
    };

    return diagnosticReport;
};

function HL7V2_OBR_to_FHIR_ServiceRequest(hl7v23:OBR obr) returns r4:ServiceRequest => {
    intent: V2ToFHIR_GetServiceRequestIntent(obr.name),
    identifier: [HL7V2_EI_to_FHIR_Identifier(obr.obr3), HL7V2_EI_to_FHIR_Identifier(obr.obr2[0])],
    code: HL7V2_CE_to_FHIR_CodeableConcept(obr.obr4),
    priority: V2ToFHIR_GetServiceRequestPriority(obr.obr5),
    occurrenceDateTime: HL7V2_TS_to_FHIR_dateTime(obr.obr6),
    requester: HL7V2_XCN_to_FHIR_Reference(obr.obr16[0]),
    // basedOn: obr.obr29,
    reasonCode: [HL7V2_CE_to_FHIR_CodeableConcept(obr.obr31[0])],
    status: "unknown",
    subject: {}
};

function HL7V2_ORC_to_FHIR_DiagnosticReport(hl7v23:ORC orc) returns r4:DiagnosticReport {
    // Identifier
    r4:Identifier[] identifierList = [];

    foreach var item in orc.orc2 {
        r4:CodeableConcept tempCC = {coding: [HL7V2_EI_to_FHIR_Coding(item)]};

        identifierList.push({
            'type: tempCC
        });
    }

    r4:CodeableConcept cc1 = {coding: [HL7V2_EI_to_FHIR_Coding(orc.orc2[0])]};

    r4:Identifier id1 = {
        'type: cc1
    };

    r4:CodeableConcept cc2 = {coding: [HL7V2_EI_to_FHIR_Coding(orc.orc3)]};

    r4:Identifier id2 = {
        'type: cc2
    };

    r4:CodeableConcept cc3 = {coding: [HL7V2_EI_to_FHIR_Coding(orc.orc4)]};

    r4:Identifier id3 = {
        'type: cc3
    };

    // Extensions
    r4:Extension[] ext = [
        {
            url: HL7V2_CE_to_FHIR_uri(orc.orc16),
            valueCodeableConcept: HL7V2_CE_to_FHIR_CodeableConcept(orc.orc16)
        }
    ];

    r4:DiagnosticReport diagnosticReport = {
        identifier: [...identifierList, id1, HL7V2_EI_to_FHIR_Identifier(orc.orc3), id2, HL7V2_EI_to_FHIR_Identifier(orc.orc3), id3],
        extension: ext,
        code: {},
        status: "partial"
    };

    return diagnosticReport;
};

function HL7V2_ORC_to_FHIR_Immunization(hl7v23:ORC orc) returns r4:Immunization {
    // Identifier
    r4:Identifier[] identifierList = [];

    foreach var item in orc.orc2 {
        r4:CodeableConcept tempCC = {coding: [HL7V2_EI_to_FHIR_Coding(item)]};

        identifierList.push({
            'type: tempCC
        });
    }

    r4:CodeableConcept cc1 = {coding: [HL7V2_EI_to_FHIR_Coding(orc.orc2[0])]};

    r4:Identifier id1 = {
        'type: cc1
    };

    r4:CodeableConcept cc2 = {coding: [HL7V2_EI_to_FHIR_Coding(orc.orc3)]};

    r4:Identifier id2 = {
        'type: cc2
    };

    // performer
    r4:ImmunizationPerformer[] immunizationPerformer = [{
        actor: HL7V2_XCN_to_FHIR_Reference(orc.orc12[0]),
        'function: HL7V2_XCN_to_FHIR_CodeableConcept(orc.orc12[0])
    }];

    r4:Immunization immunization = {
        identifier: [...identifierList, id1, HL7V2_EI_to_FHIR_Identifier(orc.orc3), id2],
        recorded: HL7V2_TS_to_FHIR_dateTime(orc.orc9),
        performer: immunizationPerformer,
        occurrenceDateTime: "",
        occurrenceString: "",
        patient: {},
        status: "not-done",
        vaccineCode: {}
    };

    return immunization;
};

// function HL7V2_ORC_to_FHIR_Provenance(hl7v23:PID pid) returns r4:Provenance => {};
// function HL7V2_ORC_to_FHIR_ServiceRequest(hl7v23:PID pid) returns r4:ServiceRequest => {};

// --- Order Entry: Pharmacy/Treatment, Vaccincation ---
// function HL7V2_RXA_to_FHIR_Patient(hl7v23:PID pid) returns r4:Immunization => {};
// function HL7V2_RXR_to_FHIR_Patient(hl7v23:PID pid) returns r4:Immunization => {};

// --- Financial Management ---
function HL7V2_DG1_to_FHIR_Condition(hl7v23:DG1 dg1) returns r4:Condition => {
    code: HL7V2_CE_to_FHIR_CodeableConcept(dg1.dg13),
    onsetDateTime: dg1.dg15.ts1,
    recordedDate: dg1.dg119.ts1,
    subject: {}
    // asserter: dg1.dg116
};

// TODO: Condition record has issues in FHIR
// function HL7V2_DG1_to_FHIR_Encounter(hl7v23:DG1 dg1) returns r4:Encounter {
//     r4:EncounterDiagnosis[] encounterDiagnosis = [{
//         condition:  HL7V2_CE_to_FHIR_CodeableConcept(dg1.dg13)
//     }]

//     r4:Encounter encounter = {
//         diagnosis: dg1.dg13,
//     'class: {},
//     status: "in-progress"
//     };

//     return encounter;
// };

// function HL7V2_DG1_to_FHIR_EpisodeOfCare(hl7v23:DG1 dg1) returns r4:EpisodeOfCare => {};

// function HL7V2_PR1_to_FHIR_Procedure(hl7v23:PR1 pr1) returns r4:Procedure => {};

// --- Observation Reporting ---
function HL7V2_OBX_to_FHIR_Observation(hl7v23:OBX obx) returns r4:Observation => {
    code: HL7V2_CE_to_FHIR_CodeableConcept(obx.obx3),
    valueQuantity: {
        value: <decimal>obx.obx5[0]
    },
    valueString: <string>obx.obx5[0],
    valueCodeableConcept: <r4:CodeableConcept>obx.obx5[0],
    valuePeriod: <r4:Period>obx.obx5[0],
    valueDateTime: <r4:dateTime>obx.obx5[0],
    valueRange: <r4:Range>obx.obx5[0],
    valueTime: <r4:time>obx.obx5[0],
    valueRatio: <r4:Ratio>obx.obx5[0],
    valueSampledData: {origin: {}, period: 0, dimensions: 0},
    dataAbsentReason: HL7V2_ID_to_FHIR_CodeableConcept(obx.obx11),
    effectiveDateTime: HL7V2_TS_to_FHIR_dateTime(obx.obx14),
    // performer: [HL7V2_CE_to_FHIR_Organization(obx.obx15)],
    method: HL7V2_CE_to_FHIR_CodeableConcept(obx.obx17[0]),
    status: "preliminary"
};

// function HL7V2_OBX_to_FHIR_Observation(hl7v23:OBX obx) returns r4:Observation => {};
// function HL7V2_PRT_to_FHIR_Device(hl7v23:PID pid) returns r4:Device => {};
// function HL7V2_PRT_to_FHIR_PractitionerRole(hl7v23:PID pid) returns r4:PractitionerRole => {};
// function HL7V2_PRT_to_FHIR_RelatedPerson(hl7v23:PID pid) returns r4:RelatedPerson => {};
// function HL7V2_PRT_to_FHIR_Observation(hl7v23:PID pid) returns r4:Observation => {};
// function HL7V2_SPM_to_FHIR_Specimen(hl7v23:PID pid) returns r4:Specimen => {};

// --- Personnel Management ---
// function HL7V2_ROL_to_FHIR_RelatedPerson(hl7v23:ROL rol) returns r4:RelatedPerson => {};
// function HL7V2_ROL_to_FHIR_Patient(hl7v23:ROL rol) returns r4:Patient => {};
// function HL7V2_ROL_to_FHIR_Encounter(hl7v23:ROL rol) returns r4:Encounter => {};

