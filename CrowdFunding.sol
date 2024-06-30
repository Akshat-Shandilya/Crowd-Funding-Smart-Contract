// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {

    struct initiative {
        string cause ;
        uint target_amount ;
        address payable reciever ;
        mapping (address=>bool) vote ;
        uint number_of_votes ;
        bool donated ;
    }

    mapping(uint=>initiative) public Initiatives ;
    mapping(address=>uint) public Contributers ;

    uint public number_of_initiatives ;
    uint public number_of_contributers ;
    uint public amount_raised ;

    address public organizer ;

    constructor () {
        organizer = msg.sender ;
    }

    function TakeInitiative ( string calldata _cause ,uint _target_amount ,address payable _reciever ) public {
        require(msg.sender==organizer, "Only the organizer can take initiatives") ;
        initiative storage new_initiative = Initiatives[number_of_initiatives] ;
        number_of_initiatives += 1 ;
        new_initiative.cause = _cause ;
        new_initiative.target_amount = _target_amount ;
        new_initiative.reciever = _reciever ;
        new_initiative.donated = false ;
    }

    function MakeContribution() public payable {
        if (Contributers[msg.sender] == 0) {
            Contributers[msg.sender] = msg.value ;
            number_of_contributers += 1 ;
        }
        else {
            Contributers[msg.sender] += msg.value ;
        }
        amount_raised += msg.value ;
    }

    function VoteForInitiative (uint initiative_index) public {
        require(Contributers[msg.sender] > 0 , "You need to make a contribution to vote for an initiative") ;
        initiative storage new_initiative = Initiatives[initiative_index] ;
        require(new_initiative.vote[msg.sender]==false, "You can't vote more than once") ;
        new_initiative.vote[msg.sender] = true ;
        new_initiative.number_of_votes += 1 ;
    }

    function Donate(uint initiative_index) public payable {
        require(msg.sender==organizer, "Only the organizer can make the donation") ;
        initiative storage new_initiative = Initiatives[initiative_index] ;
        require(new_initiative.target_amount <= amount_raised, "Sufficient funds are not avilable") ;
        require(new_initiative.number_of_votes > number_of_contributers/2, "Consensus denies this donation") ;
        new_initiative.reciever.transfer( new_initiative.target_amount ) ;
        new_initiative.donated = true ;
    }

}