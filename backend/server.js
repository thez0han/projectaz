const express = require('express');
var cors=require('cors')
const app = express();
app.use(cors());
app.listen(8080, () => { console.log('Server started!');
});
;

app.route('/api/view-groups').get((req, res) => {
    res.send({
        groups: [
            { name: 'Toyota', owner: 'Celica', something: 35000 },
            { name: 'Ford', owner: 'Mondeo', something: 32000 },
            { name: 'Porsche', owner: 'Boxter', something: 72000 }
        ]
    });
});