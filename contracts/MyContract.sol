pragma solidity 0.4.25;

contract MyContract{
    
    address owner;
    address current;
    bool genesis = true;
    uint256 public count;
    mapping(uint => Professor) public faculty;
    mapping(uint => string[]) public reviews;
    
    struct Professor{
        uint id;
        string firstName;
        string lastName;
        uint difficulity;
    }
    
    /*The school will be the first one to deploy, makes it the sole owner*/
    constructor() public{
        if (genesis){
            owner = msg.sender;
            genesis = false;
        }
        else
        {
            current = msg.sender;
        }
    }
    
    function writeComment (uint _id, uint _difficulity, string memory _review) 
        public payable onlyStudent{
        //update faculty difficulity and actual comment
        faculty[_id].difficulity = _difficulity;
        reviews[_id].push(string(_review));
        //send ether to the school
        owner.transfer(msg.value);
    }
    
    //------------MODIFIER, OWNER ACTIONS
    
    modifier onlyOwner(){
        require (msg.sender == owner);
        _;
    }
    
    modifier onlyStudent(){
        require(msg.sender != owner);
        _;
    }
    
    function addProf(string memory _firstName,string memory _lastName) 
        public onlyOwner{
        incrementCount();
        faculty[count] = Professor(count, _firstName, _lastName, 0);
    }
    
    function incrementCount() internal {
        count ++;
    }
}