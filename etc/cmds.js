var accounts=web3.eth.getAccounts();
accounts=Promise.resolve(accounts);
accounts.then(function(result){accounts=result;});
md=Promise.resolve(mixer.deployed());
md.then(function(instance) { app = instance });
ethw=1000000000000000000;

university=accounts[0];
const total_accounts=20;
for(i=1;i<total_accounts;++i)web3.eth.sendTransaction({to:university, from:accounts[i], value:(99.85)*ethw,data: web3.utils.fromAscii("init")});

for(i=2;i<10;++i)web3.eth.sendTransaction({to:accounts[i], from:university, value:1.3*ethw,data: web3.utils.fromAscii("enroll")});

function shuffleArray(a){for(var b=a.length-1;0<b;b--){var c=Math.floor(Math.random()*(b+1)),d=a[b];a[b]=a[c];a[c]=d}};
a=[];
for(i=2;i<10;++i)a.push(i);
shuffleArray(a);
for(v in a)app.deposit.sendTransaction({from:accounts[a[v]], value: 1.25 *ethw})

a=[];
for(i=12;i<20;++i)a.push(i);
shuffleArray(a);
for(v in a)app.claim.sendTransaction({from:accounts[a[v]]});

mc=Promise.resolve(MyContract.deployed());
mc.then(function(instance) { mc = instance });
mc.addProf('first','last');
//for(v in a)mc.writeComment.sendTransaction(1,Math.floor(Math.random()*10),'comment',{from:accounts[a[v]],value:ethw});

for(v in a)web3.eth.sendTransaction({to:accounts[1], from:accounts[a[v]], value:ethw,data: web3.utils.fromAscii('{"id":1,"difficuity":1,comment":"comment here"}')});

b=Promise.resolve(web3.eth.getBlock(57));
b.then(function(result){b=result;});

if(b!=null){t=web3.eth.getTransaction(b['transactions'][0]);t=Promise.resolve(t);t.then(function(result){t=result;});}
web3.utils.toAscii(t['input']);
