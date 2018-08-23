Connects to Google Contacts from Ballerina. 

# Package Overview

The Google Contacts API allows client applications to view and update a user's contacts. 
It handles OAuth 2.0 authentication. 

**Operations**

The `marcus/gcontacts3` package contains operations to get Google Contacts user profile details.

## Compatibility
|     Ballerina Language Version |    Google API Version     |  
| :-----------------:|:--------------:|
|0.981.0 | v3 |

## Sample
First, import the `marcus/gcontacts3` package into the Ballerina project.
```ballerina
import marcus/gcontacts3;
```
Instantiate the connector by giving authentication details in the HTTP client config, which has built-in support for 
OAuth 2.0. Google Contacts uses OAuth 2.0 to authenticate and authorize requests. The Google Contacts connector can be 
minimally instantiated in the HTTP client config using the access token or using the client ID, client secret, 
and refresh token.

**Obtaining Tokens to Run the Sample**

1. Visit [Google API Console](https://console.developers.google.com), click **Create Project**, and follow the wizard to create a new project.
2. Go to **Credentials -> OAuth consent screen**, enter a product name to be shown to users, and click **Save**.
3. On the **Credentials** tab, click **Create credentials** and select **OAuth client ID**. 
4. Select an application type, enter a name for the application, and specify a redirect URI (enter https://developers.google.com/oauthplayground if you want to use 
[OAuth 2.0 playground](https://developers.google.com/oauthplayground) to receive the authorization code and obtain the 
access token and refresh token). 
5. Click **Create**. Your client ID and client secret appear. 
6. In a separate browser window or tab, visit [OAuth 2.0 playground](https://developers.google.com/oauthplayground), select the required Gmail API scopes, and then click **Authorize APIs**.
7. When you receive your authorization code, click **Exchange authorization code for tokens** to obtain the refresh token and access token. 

You can now enter the credentials in the HTTP client config. 
```ballerina
endpoint Client gContactsEP {
    clientConfig:{
        auth:{
            accessToken:config:getAsString("ACCESS_TOKEN"),
            clientId:config:getAsString("CLIENT_ID"),
            clientSecret:config:getAsString("CLIENT_SECRET"),
            refreshToken:config:getAsString("REFRESH_TOKEN")
        }
    }
};
```
The `getAllContacts()` lists all the contacts for a given email. As the parameter need to send the relevant 
User Email address.

If successful, user will get a XML response, else an error.
```ballerina
string userEmail = "<YOUR_EMAIL>";

    var response = gContactsEP -> getAllContacts(userEmail);

    match response {
        xml xmlRes => {
            io:println(xmlRes);
        }
        error err => {
            io:println(err);
        }
    }
```

The `getContactById()` lists the contacts for a given email and contact ID. As the parameters, need to send the relevant 
user Email address and user contact ID.

If successful, user will get a XML response, else an error.

```ballerina
    string userEmail = "<YOUR_EMAIL>";
    string contactId = "<YOUR_CONTACT_ID>";

    log:printInfo("testGetContactById()");
    var response = gContactsEP -> getContactById(userEmail, contactId);

    match response {
        xml xmlRes => {
            io:println(xmlRes);
        }
        error err => {
            io:println(err);
        }
    }
```
