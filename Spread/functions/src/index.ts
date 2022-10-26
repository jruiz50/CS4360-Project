// Import project dependencies
require("dotenv").config();
const {
  // doc,
  // setDoc,
  getDocs,
  // deleteDoc,
  collection,
  getFirestore
} = require("firebase/firestore");
const superagent = require("superagent");
const { initializeApp } = require("firebase/app");
import * as functions from "firebase-functions";


// Connect Cloud Functions to Firestore Database
const firebaseConfig = {
    apiKey: process.env.APP_API_KEY,
    authDomain: process.env.APP_AUTH_DOMAIN,
    projectId: process.env.APP_PROJECT_ID,
    storageBucket: process.env.APP_STORAGE_BUCKET,
    messagingSenderId: process.env.APP_MSG_SENDER_ID,
    appId: process.env.APP_ID
};
const app = initializeApp(firebaseConfig);


// References to Database and Collections
const db = getFirestore(app);
const users = collection(db, "users");



// ------------------------------- Cloud Functions -------------------------------


// Database CRUD Operation Functions

/**
 * This functions serves as an example as to how you can read
 * data from a database collection. In this case, a user profile.
 * 
 * @param data - Object containing desired user information
 * @returns - Object containing user stored user information
 */
export const getUserProfile = functions.https.onCall(async (data) => {
  // const userID: string = data.userID;
  // const userID: string = "";

  let user: object = {
    test: "hello"
  };

  await getDocs(users)
    .then((snapshot: any) => {
      snapshot.docs.forEach((document: any) => {
        console.log(document.data());
        console.log(document.data);
        user = { ...user, data: document.data()};
        console.log(user);
      })
    });

  return { user }
});




// App Utility Functions

/**
 * This function receives a search query from the application, and 
 * uses it as a query to a food API for nutrition information.
 * 
 * @param data - Object containing a string of the user's typed search
 * @returns - At the moment, simply returns a success response to app
 */
export const foodQuery = functions.https.onCall((data) => {
  const userQuery: string = data.query;
  let searchQuery: string = userQuery.trim().toLowerCase();
  
  superagent
    .post(process.env.FDA_SERVER_URL)
    .set('X-Api-Key', process.env.FDA_API_KEY)
    .set('Content-Type', 'application/json')
    .send(JSON.stringify({
      query: searchQuery,
      dataType: ["Branded"],
      pageSize: 3,
      pageNumber: 0
    }))
    .then((res: any) => {
      console.log(res.body);
    })
    .catch((err: any) => {
      console.log(err);
    });
  

  return {
    result: "Hello from Firebase!"
  }
});
