const mongoose = require("mongoose");

exports.makeDb = () => {
  mongoose.set("useCreateIndex", true);
  mongoose.connect(
    // Update here mongodb access credential
    'mongodb://afcassignment:Afc123456@ac-9bcfjiu-shard-00-00.gnjkhdu.mongodb.net:27017,ac-9bcfjiu-shard-00-01.gnjkhdu.mongodb.net:27017,ac-9bcfjiu-shard-00-02.gnjkhdu.mongodb.net:27017/?ssl=true&replicaSet=atlas-6cqsq2-shard-0&authSource=admin&retryWrites=true&w=majority&appName=Cluster0',
    {
      useNewUrlParser: true,
      useCreateIndex: true,
      useFindAndModify: false,
      useUnifiedTopology: true
    }
  );
  mongoose.set("useFindAndModify", false);
};