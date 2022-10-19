require("dotenv").config();
import * as functions from "firebase-functions";
const superagent = require("superagent");


// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript

export const foodQuery = functions.https.onCall(async (data, context) => {
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
