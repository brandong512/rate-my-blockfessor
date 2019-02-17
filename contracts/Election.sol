pragma solidity 0.4.25;

contract Election {
    // Model a Candidate
    // struct Candidate {
    //     uint id;
    //     string name;
    //     uint voteCount;
    // }

    // Alpha Code
    struct Teacher{
        uint id;
        string fullName;
        uint difficultyRating;
    }
    uint public teacherCount;
    mapping(uint => Teacher) public teachers;

    function addTeacher (string fullName) private {
        teacherCount ++;
        teachers[teacherCount] = Teacher(teacherCount, fullName, 0);
    }

    constructor () public {
        addTeacher("John Ash");
        addTeacher("Jack Stone");
        addTeacher("John Appleseed");
        addTeacher("Jenny Lee");
        addTeacher("Jerry Smith");
        addTeacher("Jeff Berkeley");

    }
    
    // Alpha Code

    // Store accounts that have voted
    // mapping(address => bool) public voters;
    // // Store Candidates
    // // Fetch Candidate
    // mapping(uint => Candidate) public candidates;
    // // Store Candidates Count
    // uint public candidatesCount;

    // voted event
    // event votedEvent (
    //     uint indexed _candidateId
    // );

    address owner;
    bool genesis = true;
    uint256 public count;
    mapping(uint => Professor) public faculty;
    mapping(uint => Comment) public reviews;
    
    struct Professor{
        uint id;
        string firstName;
        string lastName;
        uint difficulity;
    }
    
    struct Comment{
        uint id;
        string[] comments;
    }
    
function writeComment (uint _id, uint _difficulity, string memory _review) 
        public payable onlyStudent{
            require(msg.value==1 ether);
        //update faculty difficulity and actual comment
        faculty[_id].difficulity = _difficulity;
        reviews[_id].comments.push(string(_review));
        //send ether to the school
        owner.transfer(msg.value);
    }

//////////MODIFIERS BELOW///////////////
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

    // function addCandidate (string _name) private {
    //     candidatesCount ++;
    //     candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    // }

    // function vote (uint _candidateId) public {
    //     // require that they haven't voted before
    //     require(!voters[msg.sender]);

    //     // require a valid candidate
    //     require(_candidateId > 0 && _candidateId <= candidatesCount);

    //     // record that voter has voted
    //     voters[msg.sender] = true;

    //     // update candidate vote Count
    //     candidates[_candidateId].voteCount ++;

    //     // trigger voted event
    //     emit votedEvent(_candidateId);
    // }
}
