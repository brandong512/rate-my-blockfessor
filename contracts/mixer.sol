/*assumes honest impl, can be solved if dishonest party join:
https://github.com/yaronvel/smart_contracts/tree/master/mixer */
contract mixer {
	address[] sources;
	address[] dests;
	function deposit()public payable{
		require(msg.value==1.25 ether,'trans size');
		sources.push(msg.sender);
	}
	function claim()payable{
		dests.push(msg.sender);
		if(dests.length==sources.length){
			distribute();
		}
	}
	function distribute()payable{
		for(uint i=0;i<dests.length;++i){
			dests[i].transfer(1 ether);
		}
		selfdestruct(msg.sender);
	}
	function refund(){
		
	}
}