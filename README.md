# Official AFC Merchandise App

This is the official Android app for AFC merchandise. It allows users to browse and purchase official merchandise from AFC.

## Features
- Browse merchandise categories
- View product details
- Add products to the cart
- Checkout and make payments
- Order tracking

## Getting Started for Android App 
1. Clone the repository: `git clone https://github.com/your-username/Official-AFC-Merchandise-App.git`
2. Open the project in Android Studio.
3. Build and run the project on an Android device or emulator.

## Getting Started for Backend 

Step 1: You'll need to install [Node.js >=v10.0+ (Recommended Version)](https://nodejs.org/en/) (NPM comes along with it) and serve (a NPM package)

-   Projects Structure

In the downloaded folder you will found 1 folder called Econix and into it you will find client and src folder

-   *client*

This one is totally React based template

-   *src*

And this one backend is api, and made with Express.

How to start Express API?

Go to `src` root and open the terminal/git bash install all dependencies by `npm install` then `npm start` when project run the url will open automatically on your default browser.

How to setup mongodb atlas

Go to [mongodb atlas](https://account.mongodb.com/account/login) and create a new account. Make a new project and in your project you have to create a cluster. For cluster keep the default settings and click create cluster. After build cluster go to security and set username and password and then under network access you have to add ip address. Go to clusters again and click connect and then Connect your application. copy connection string from here and paste it into `.env` file. we will discuss it below, how to setup .env file.

How to setup Cloudinary

Account Details

cloud name

api key

api secret

`.env`

Env File Setup

Create a `.env `file in the root and add the following\
`DATABASE_NAME = mongodb database name\
DATABASE_USER = mongodb user name\
DATABASE_PASSWORD = mongodb password\
JWT_SECRET = 'abc123'\
CLOUDINARY_NAME= set cloudinary name\
CLOUDINARY_API_KEY= cloudinary api key\
CLOUDINARY_API_SECRET= cloudinary api secret

`

Now continue step 2

Use command line tool i.e. powershell or terminal and navigate to the client root. This is powershell in windows and terminal on mac/linux.

Step 3: Go to the Econix root folder and open the terminal and run `npm install`.

Step 4:

-   Start development server
-   `npm start`
-   React will start a hot-reloading development environment accessible by default at `http://localhost:3000`.
-   Try editing the home page in src/pages/Home/Home.jsx Saved changes will live reload in the browser.

-   Create a production build
-   `npm run build`
-   React will perform an optimized production build for your site, The build artifacts will be stored build/ directory. 
