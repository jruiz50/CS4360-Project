require("dotenv").config();
import * as functions from "firebase-functions";

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript

export const testFunction = functions.https.onCall((data, context) => {
  console.log(data)
  functions.logger.info("Hello logs!", {structuredData: true});
  return {
    response: "Hello from Firebase!"
  }
});
