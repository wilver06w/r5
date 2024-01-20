export.changeTitle = functions.firestore.document("user/{userid}/task/{taskid}").onCreate((snap, context)=>{
  console.log(snap);

  const userId = context.params.userid;
  const taskId = context.params.taskid;

  const firestore = admin.firestore();

  return firestore.doc(`user/${userId}/task/${taskId}`).set(
    {
      ttitle: 'Traducido titulo',
      tdescription: 'Traducido descripcion',
    },
    {merge: true}
  );
});

export.changeTitle = functions.firestore.document("user/{userid}/task/{taskid}").onUpdate((change, context)=>{

  const newValue = change.after.data();
  console.log(snap);

  const userId = context.params.userid;
  const taskId = context.params.taskid;

  if(newValue.ttile == '' && newValue.ttdescription == ''){
    const firestore = admin.firestore();

    return change.after.ref.update({
      ttitle: 'Traducido titulo UpdateE',
      tdescription: 'Traducido descripcion UpdateE',
    });
  }

    return new Promise((resolve, reject) => {
      resolve(true);
    });
});