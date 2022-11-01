// Import project dependencies
require("dotenv").config();
const {
  doc,
  setDoc,
  getDocs,
  deleteDoc,
  updateDoc,
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
const foodItems = collection(db, "foodItems");



// ------------------------------- Cloud Functions -------------------------------


// Database CRUD Operation Functions

/**
 * This function grabs a user's stored profile information
 * data from the "users" collection given a unique ID.
 * 
 * @param data - Object containing desired user information
 * @returns - Object containing user stored user information
 */
export const getUserProfile = functions.https.onCall(async (data) => {
  const userID: string = data.userID;

  let usersList: Array<any> = [];

  const querySnapshot = await getDocs(users);
  querySnapshot.forEach((doc: any) => {
    if (doc.id === userID) {
      const docData = JSON.parse(JSON.stringify(doc.data()));

      usersList.push({
        docID: doc.id,
        firstName: docData.firstName,
        lastName: docData.lastName,
        menus: docData.menus,
        allergens: docData.allergens,
        favorites: docData.favorites
      });

    }
  });

  return usersList;
});

/**
 * This function will take data from the application and
 * create a new user in Firebase Auth. Afterwards, it uploads
 * this new user information to the Firestore Database.
 * 
 * @param data - Object containing new user information
 * @returns - Object indicating whether the operation was successful
 */
export const createUserProfile = functions.https.onCall(async (data) => {
  const firstName: string = data.firstName;
  const lastName: string = data.lastName;
  const userID: string = data.userID;

  let isSuccessful: boolean = false;

  await setDoc(doc(users, userID), {
    firstName,
    lastName,
    menus: [],
    allergens: [],
    favorites: [],
  })
  .then(() => {
    isSuccessful = true;
  })
  .catch((error: any) => {
    console.log(error);
    isSuccessful = false;
  });

  return {
    isSuccessful
  };
});

/**
 * This function will update a user's profile information
 * based on the data provided by the application.
 * 
 * @param data - Object containing user's unique ID and object with
 *               fields of the desired update information
 * @returns - Object indicating whether the operation was successful
 */
 export const updateUserProfile = functions.https.onCall(async (data) => {
  const userID: string = data.userID;

  const menus: Array<string> = data.menus ? data.menus : null;
  const allergens: string = data.allergens ? data.allergens : null;
  const favorites: string = data.favorites ? data.favorites : null;

  let updatedData: any = {};

  if (menus) {
    updatedData = {
      ...updatedData,
      menus
    };
  };
  if (allergens) {
    updatedData = {
      ...updatedData,
      allergens
    };
  };
  if (favorites) {
    updatedData = {
      ...updatedData,
      favorites
    };
  };

  let isSuccessful: boolean = false;

  await updateDoc(doc(users, userID), updatedData)
  .then(() => {
    isSuccessful = true;
  })
  .catch((error: any) => {
    console.log(error);
    isSuccessful = false;
  })

  return {
    isSuccessful
  };
 });

/**
 * This function will  delete a user's profile along with
 * any of their stored information in the Firestore database.
 * 
 * @param data - Object containing user's unique ID
 * @returns - Object indicating whether the operation was successful
 */
 export const deleteUserProfile = functions.https.onCall(async (data) => {
  const userID: string = data.userID;

  let isSuccessful: boolean = false;

  await deleteDoc(doc(users, userID))
  .then(() => {
    isSuccessful = true;
  })
  .catch((error: any) => {
    console.log(error);
    isSuccessful = false;
  })

  return {
    isSuccessful
  };
 });


export const getFoodItems = functions.https.onCall(async (data) => {

  let foodArray: Array<any> = [];

  const querySnapshot = await getDocs(foodItems);
  querySnapshot.forEach((doc: any) => {
    foodArray.push({
      docID: doc.id,
      docData: JSON.parse(JSON.stringify(doc.data()))
    });
  });

  return foodArray;
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
