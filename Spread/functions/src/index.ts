// Import project dependencies
require("dotenv").config();
const {
  doc,
  query,
  where,
  setDoc,
  getDoc,
  getDocs,
  deleteDoc,
  updateDoc,
  collection,
  getFirestore
} = require("firebase/firestore");
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
const usersCollection = collection(db, "users");
const foodItemsCollection = collection(db, "foodItems");



// ------------------------------- Cloud Functions -------------------------------


// Database CRUD Operation Functions

interface User {
  userID?: string,
  firstName?: string,
  lastName?: string,
  menus?: Array<string>,
  favorites?: Array<any>
  allergens?: Array<string>
  error?: string
}

interface FoodItem {
  foodItemID?: string,
  itemName?: string,
  categoryOfFood?: Array<string>,
  rating?: number,
  ratings?: Array<number>,
  ingredients?: Array<string>,
  allergens?: Array<string>,
  restaurantName?: string,
  restaurantID?: string,
  imageURL?: string,
  tags?: Array<any>,
  error?: string
}

/**
 * This function grabs a user's stored profile information
 * data from the "users" collection given a unique ID.
 * 
 * @param data - Object containing desired user information
 * @returns - Object containing user stored user information
 */
export const getUserProfile = functions.https.onCall(async (data) => {
  const userID: string = data.userID;

  let user: User = {};

  const docSnap = await getDoc(doc(usersCollection, userID));

  if (docSnap.exists()) {
    const docData = JSON.parse(JSON.stringify(docSnap.data()));

    user = {
      userID: userID,
      firstName: docData.firstName,
      lastName: docData.lastName,
      menus: docData.menus,
      allergens: docData.allergens,
      favorites: docData.favorites
    }
  } else {
    user = {
      error: `User { ${userID} } was not found.`
    }
  }


  return user;
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

  const newUser: User = {
    userID,
    firstName,
    lastName,
    menus: [],
    allergens: [],
    favorites: []
  };

  await setDoc(doc(usersCollection, userID), newUser)
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
  const allergens: Array<string> = data.allergens ? data.allergens : null;
  const favorites: Array<string> = data.favorites ? data.favorites : null;

  let updatedUser: User = {};

  if (menus) {
    updatedUser = {
      ...updatedUser,
      menus
    };
  };
  if (allergens) {
    updatedUser = {
      ...updatedUser,
      allergens
    };
  };
  if (favorites) {
    updatedUser = {
      ...updatedUser,
      favorites
    };
  };

  let isSuccessful: boolean = false;

  await updateDoc(doc(usersCollection, userID), updatedUser)
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

  await deleteDoc(doc(usersCollection, userID))
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

export const getFoodItem = functions.https.onCall(async (data) => {

  const foodItemID: string = data.foodItemID;

  let foodItem: FoodItem = {};

  const docSnap = await getDoc(doc(foodItemsCollection, foodItemID));

  if (docSnap.exists()) {
    const docData = JSON.parse(JSON.stringify(docSnap.data()));

    foodItem = {
      foodItemID: docData.foodItemID,
      itemName: docData.itemName,
      categoryOfFood: docData.categoryOfFood,
      rating: docData.rating,
      ingredients: docData.ingredients,
      allergens: docData.allergens,
      restaurantName: docData.restaurantName,
      restaurantID: docData.restaurantID,
      imageURL: docData.imageURL,
      tags: docData.tags
    }
  } else {
    foodItem = {
      error: `Food { ${foodItemID} } was not found.`
    }
  }

  return foodItem;
});




// App Utility Functions

/**
 * This function receives a search query from the application, and 
 * uses it as a query to a food API for nutrition information.
 * 
 * @param data - Object containing a string of the user's typed search
 * @returns - Object containing an array of matched food items
 */
export const foodQuery = functions.https.onCall(async (data) => {
  const userQuery: string = data.query;
  // const searchQuery: string = userQuery.trim().toLowerCase();
  const searchQuery: string = userQuery.trim();

  let results: Array<FoodItem> = [];

  const q = query(foodItemsCollection, where("itemName", "==", searchQuery));

  const querySnapshot = await getDocs(q);
  querySnapshot.forEach((doc: any) => {
    console.log(doc.id, " => ", doc.data());
    results.push(doc.data());
  });

  return {
    results: results
  };
});


interface Marker {
  itemName?: string,
  restaurantName?: string,
  latitude?: string,
  longitude?: string
};

/**
 * This function receives a user's coordinates and returns 
 * an array with information of nearby, high-rated food items.
 * 
 * @param data - Object containing a string of the user's coordinates
 * @returns - Object containing a single array with all food item markers
 */
export const getFoodMarkers = functions.https.onCall(async (data) => {
  // const userCoordinates: any = data.coordinates;
  // console.log(userCoordinates);

  let marker: Marker = {};
  let markersArray: Array<Marker> = [];

  await getDocs(foodItemsCollection).then((snapshot: any) => {
    snapshot.docs.forEach((document: any) => {

      if (document.id.substring(0, 4) === "DEMO") {
        const docData = JSON.parse(JSON.stringify(document.data()));

        marker = {
          itemName: docData.itemName,
          restaurantName: docData.restaurantName,
          latitude: docData.latitude,
          longitude: docData.longitude
        }

        markersArray.push(marker);

      }
    });
  });

  return {
    markers: markersArray
  };

});


interface Menu {
  restaurantName?: string,
  itemName?: string,
  categoryOfFood?: string,
  description?: string,
  rating?: number,
  tags?: Array<string>,
  imageURL?: string
};

/**
 * This function receives menu information scanned by a user,
 * then updates the database with this information.
 *
 * @param data - Object containing scanned menu information
 * @returns - Object indicating whether the operation was successful
 */
export const uploadMenuScan = functions.https.onCall(async (data) => {
  const userID: string = data.userID;
  let menu: Menu = {
    restaurantName: data.restaurantName,
    description: data.description,
    rating: data.rating,
    tags: data.tags
  };

  if (data.itemName) {
    menu = {
      ...menu,
      itemName: data.itemName
    }
  }

  if (data.categoryOfFood) {
    menu = {
      ...menu,
      categoryOfFood: data.categoryOfFood
    }
  };

  if (data.imageURL) {
    menu = {
      ...menu,
      imageURL: data.imageURL
    }
  };

  let success: boolean = false;

  const docSnap = await getDoc(doc(usersCollection, userID));

  if (docSnap.exists()) {
    const docData = JSON.parse(JSON.stringify(docSnap.data()));
    let userMenus: Array<Menu> = docData.menus;

    console.log(userMenus);

    userMenus.push(menu);

    console.log(userMenus);

    await updateDoc(doc(usersCollection, userID), { menus: userMenus })
      .then(() => {
        success = true;
      }).catch((e: any) => {
        success = false;
      });
  }

  return {
    success: success
  };
});

/**
* This function receives a user's rating for a food item,
* then updates it's overall rating in the database.
*
* @param data - Object containing user rating and food item ID
* @returns - Object indicating whether the operation was successful
*/
export const updateFoodRating = functions.https.onCall(async (data) => {
  const userRating: number = data.rating;
  const foodItemID: string = data.foodItemID;

  let success: boolean = false;

  const docSnap = await getDoc(doc(foodItemsCollection, foodItemID));

  if (docSnap.exists()) {
    const docData = JSON.parse(JSON.stringify(docSnap.data()));
    let ratings: Array<number> = docData.ratings;
    ratings.push(userRating);

    let avgRating = 0;
    ratings.forEach((rate: number) => {
      avgRating += rate;
    });

    avgRating = avgRating / ratings.length;

    await updateDoc(doc(foodItemsCollection, foodItemID), { 
      rating: avgRating,
      ratings: ratings
    }).then(() => {
      success = true;
    }).catch((e: any) => {
      success = false
    });
  };
  
  return {
    success: success
  };

});