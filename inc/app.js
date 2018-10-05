var app = {};

/////////////////////////////////////////////////////////////////////////////////
//// Time-stamp: <2018-10-05 18:38:37 (melify)>
/////////////////////////////////////////////////////////////////////////////////
app.init = function(options) {
    console.group("app.init:", JSON.stringify(options));
    
    app.name  = options.app;
    app.env   = options.env;
    app.local = options.local;
    app.clock = options.clock;

    console.log(JSON.stringify(app))

    console.groupEnd();
};
