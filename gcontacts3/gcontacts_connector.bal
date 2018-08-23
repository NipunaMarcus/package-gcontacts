import ballerina/http;
import ballerina/log;
import ballerina/mime;
import ballerina/io;

documentation{
    Represents the Google Contacts Client Connector.

    F{{client}} HTTP Client used in Google Contacts connector
}
public type GContactsConnector object {
    
    public http:Client client;

    documentation{
        List all the contacts for a given email.

        P{{userEmail}} The user's email address.
        R{{}} If successful, returns response xml. Else returns error.
    }
    public function getAllContacts(string userEmail) returns xml | error;

    documentation{
            get contact for a given email and contact ID

            P{{userEmail}} The user's email address.
            P{{contactId}} The user's contact ID.
            R{{}} If successful, returns response xml. Else returns error.
        }
    public function getContactById(string userEmail, string contactId) returns xml | error;

    documentation {
    	Delete the contact for a given email and contact ID.
        
	    P{{userEmail}} The user's email address.
	    P{{contactId}} The user's contact ID.
    }
    public function deleteContactById(string userEmail, string contactId) returns xml | error;

    documentation {
    	Insert the contact in to a given email.

	    P{{userEmail}} The user's email address.
	    P{{contact}}   The contact details as a xml.
    }
    public function addContact(string userEmail, xml contact) returns xml | error;

    documentation {
    	Update already available contact in to a given email using client ID.

	    P{{userEmail}} The user's email address.
	    P{{contactId}} The contact ID.
	    P{{contact}}   The contact details as a xml.
    }
    public function updateContactById (string userEmail, string contactId, xml contact) returns xml | error;

    documentation{
        List all the groups for a given email.

        P{{userEmail}} The user's email address.
        R{{}} If successful, returns response xml. Else returns error.
    }
    public function getAllGroups(string userEmail) returns xml | error;

    documentation{
            get group for a given email and group ID

            P{{userEmail}} The user's email address.
            P{{groupId}} The user's group ID.
            R{{}} If successful, returns response xml. Else returns error.
        }
    public function getGroupById(string userEmail, string groupId) returns xml | error;

    documentation {
    	Delete the group for a given email and group ID.
        
	    P{{userEmail}} The user's email address.
	    P{{groupId}} The user's group ID.
    }
    public function deleteGroupById(string userEmail, string groupId) returns xml | error;

    documentation {
    	Insert the group in to a given email.

	    P{{userEmail}} The user's email address.
	    P{{groupDetails}}   The group details as a xml.
    }
    public function addGroup(string userEmail, xml groupDetails) returns xml | error;

    documentation {
    	Update already available group in to a given email using group ID.

	    P{{userEmail}} The user's email address.
	    P{{groupId}} The group ID.
	    P{{groupDetails}}   The group details as a xml.
    }
    public function updateGroupById (string userEmail, string groupId, xml groupDetails) returns xml | error;
};

function GContactsConnector::getAllContacts(string userEmail) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = CONTACTS_API_BASE_PATH + userEmail + FULL_SUFFIX + QUERY_PARAM_SUFFIX + API_VERSION;
    var httpResponse = httpClient->get(path);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::getContactById(string userEmail, string contactId) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = CONTACTS_API_BASE_PATH + userEmail + FULL_SUFFIX + FORWARD_SLASH + contactId + QUERY_PARAM_SUFFIX + API_VERSION;
    var httpResponse = httpClient->get(path);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::deleteContactById (string userEmail, string contactId) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = CONTACTS_API_BASE_PATH + userEmail + FULL_SUFFIX + FORWARD_SLASH + contactId + QUERY_PARAM_SUFFIX + API_VERSION;
    http:Request req = new;
    req.setHeader("If-Match", "\"*\"");
    var httpResponseDelete = httpClient->delete(path, req);
    return checkAndSetErrors(httpResponseDelete);
}

function GContactsConnector::addContact(string userEmail, xml contact) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = CONTACTS_API_BASE_PATH + userEmail + FULL_SUFFIX + QUERY_PARAM_SUFFIX + API_VERSION;
    http:Request req = new;
    req.setPayload(contact);
    req.setContentType("application/atom+xml");
    var httpResponse = httpClient->post(path, req);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::updateContactById (string userEmail, string contactId, xml contact) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = CONTACTS_API_BASE_PATH + userEmail + FULL_SUFFIX + FORWARD_SLASH + contactId + QUERY_PARAM_SUFFIX + API_VERSION;
    http:Request req = new;
    req.setPayload(contact);
    req.setContentType("application/atom+xml");
    var httpResponse = httpClient->put(path, req);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::getAllGroups (string userEmail) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = GROUPS_API_BASE_PATH + userEmail + FULL_SUFFIX + QUERY_PARAM_SUFFIX + API_VERSION;
    var httpResponse = httpClient->get(path);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::getGroupById(string userEmail, string groupId) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = GROUPS_API_BASE_PATH + userEmail + FULL_SUFFIX + FORWARD_SLASH + groupId + QUERY_PARAM_SUFFIX + API_VERSION;
    var httpResponse = httpClient->get(path);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::deleteGroupById(string userEmail, string groupId) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = GROUPS_API_BASE_PATH + userEmail + FULL_SUFFIX + FORWARD_SLASH + groupId + QUERY_PARAM_SUFFIX + API_VERSION;
    http:Request req = new;
    req.setHeader("If-Match", "\"*\"");
    var httpResponse = httpClient->delete(path, req);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::addGroup(string userEmail, xml groupDetails) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = GROUPS_API_BASE_PATH + userEmail + FULL_SUFFIX + QUERY_PARAM_SUFFIX + API_VERSION;
    http:Request req = new;
    req.setPayload(groupDetails);
    req.setContentType("application/atom+xml");
    var httpResponse = httpClient->post(path, req);
    return checkAndSetErrors(httpResponse);
}

function GContactsConnector::updateGroupById (string userEmail, string groupId, xml groupDetails) returns xml | error {
    endpoint http:Client httpClient = self.client;
    string path = GROUPS_API_BASE_PATH + userEmail + FULL_SUFFIX + FORWARD_SLASH + groupId + QUERY_PARAM_SUFFIX + API_VERSION;
    http:Request req = new;
    req.setPayload(groupDetails);
    req.setContentType("application/atom+xml");
    var httpResponse = httpClient->put(path, req);
    return checkAndSetErrors(httpResponse);
}
