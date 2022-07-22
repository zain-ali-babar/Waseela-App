import firebase from "firebase";
import "firebase/firestore";

const firebaseConfig = {
    apiKey: "AIzaSyBHVmahTJFc49JTrjiz9bRWAp-CCS6nOsQ",
    authDomain: "pactice-8b262.firebaseapp.com",
    projectId: "pactice-8b262",
    storageBucket: "pactice-8b262.appspot.com",
    messagingSenderId: "801892648386",
    appId: "1:801892648386:web:c6aa1fba386c2ad113c25b"
  };
  
// Initialize Firebase
firebase.initializeApp(firebaseConfig);

export const db=firebase.firestore();

export default firebase;