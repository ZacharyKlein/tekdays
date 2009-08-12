class BootStrap {
//START:addTekUser
    def init = { servletContext ->
/*        //START:NewUsers
        new TekUser(fullName: 'John Doe', 
                    userName: 'jdoe',
                    password: 't0ps3cr3t',
                    email: 'jdoe@johnsgroovyshop.com',
                    website: 'blog.johnsgroovyshop.com',
  //END:addTekUser
                    bio: '''John has been programming for over 40 years.  He has worked 
                            with every programming language known to man and has settled 
                            on Groovy.  In his spare time, John dabbles in astro physics 
                            and plays shuffleboard.''').save()
//START:addTekUser        
        new TekUser(fullName: 'John Deere', 
                    userName: 'tractorman',
                    password: 't0ps3cr3t',
                    email: 'john.deere@porkproducers.org',
                    website: 'www.perl.porkproducers.org',
//END:addTekUser
                    bio: '''John is a top notch Perl programmer and a pretty good 
                            hand around the farm.  If he can't program it he can 
                            plow it!''').save()
                            
        //END:NewUsers
//START:addTekUser        
        new TekEvent(name: 'Gateway Code Camp',
                     city: 'Saint Louis, MO',
                     organizer: TekUser.findByFullName('John Doe'),
                     venue: 'TBD',
                     startDate: new Date('9/19/2009'),
                     endDate: new Date('9/19/2009'),
//END:addTekUser
                     description: '''This conference will bring coders from 
                                     across platforms, languages, and industries
                                     together for an exciting day of tips, tricks,
                                     and tech!  Stay sharp! Stay at the top of your
                                     game!  But, don't stay home!  Come an join us
                                     this fall for the first annual Gateway Code
                                     Camp.''').save()
//START:addTekUser                                     
        new TekEvent(name: 'Perl Before Swine',
                     city: 'Austin, MN',
                     organizer: TekUser.findByFullName('John Deere'),
                     venue: 'SPAM Museum',
                     startDate: new Date('9/1/2009'),
                     endDate: new Date('9/1/2009'),
//END:addTekUser
                     description: '''Join the Perl programmers of the Pork 
                                     Producers of America as we hone our skills
                                     and ham it up a bit.  You can show off  
                                     your programming chops while trying to win a 
                                     year's supply of pork chops in our programming 
                                     challenge.

                                     Come and join us in historic (and aromatic),
                                     Austin, Minnesota.  You'll know when you're 
                                     there!''').save()
//START:addVolunteers
        def g1 = TekEvent.findByName('Gateway Code Camp')
        g1.addToVolunteers(new TekUser(fullName: 'Sarah Martin',
                                       userName: 'sarah',
                                       password: '54321',
                                       email: 'sarah@martinworld.com',
                                       website: 'www.martinworld.com',  
                                       bio: 'Web designer and Grails officianado.'))
//START:addRespondents
        g1.addToVolunteers(new TekUser(fullName: 'Bill Smith',
                                       userName: 'Mr_Bill',
                                       password: '12345',
                                       email: 'mrbill@email.com',
                                       website: 'www.mrbillswebsite.com',
                                       bio: 'Software developer and claymation artist.'))
        
        
        g1.addToRespondents('ben@grailsmail.com')
        g1.addToRespondents('zachary@linuxgurus.org')
        g1.addToRespondents('solomon@bootstrapwelding.com')
        
        g1.save(flush:true)
//END:addRespondents
//END:addVolunteers        
//START:addTekUser    

//START:addSponsorships
        def s1 = new Sponsor(name:'Contegix',
                             website:'contegix.com',
                             description:'Beyond Managed Hosting for your Enterprise'
                               ).save()
        def s2 = new Sponsor(name:'Object Computing Incorporated',
                             website:'ociweb.com',
                             description:'An OO Software Engineering Company'
                             ).save()
        def sp1 = new Sponsorship(event:g1, 
                                  sponsor:s1,
                                  contributionType:'Other',
                                  description:'Cool T-Shirts')
        def sp2 = new Sponsorship(event:g1,
                                  sponsor:s2,
                                  contributionType:'Venue',
                                  description:'They will be paying for the Moscone')
        s1.addToSponsorships(sp1)
        s1.save()
        s2.addToSponsorships(sp2)
        s2.save()
        g1.addToSponsorships(sp1)
        g1.addToSponsorships(sp2)
        g1.save()    
//END:addSponsorships    
//START:addMessages
        def user = TekUser.findByFullName('John Doe')
        def user2 = g1.volunteers.find{it.fullName == 'Sarah Martin'}
        def user3 = g1.volunteers.find{it.fullName == 'Bill Smith'}
        def m1 = new Message(subject:'Welcome to the Gateway Code Camp Forum', 
                             content:'Welcome to the Gateway Code Camp Forum', author:user, event:g1).save()
        def m2 = new Message(subject:'I think I can get James Gosling to do a keynote', 
                             content:'I know a guy who knows a guy who works with a guy ...', 
                             author:user2, event:g1).save()
        def m2a = new Message(subject:'RE: I think I can get James Gosling to do a keynote', 
                              content:'message 2a content', author:user, event:g1, parent:m2).save()
        def m2b = new Message(subject:'RE: I think I can get James Gosling to do a keynote', 
                              content:'That sounds great Sarah!  Do you think we could also get him to do a dunk tank?  It would be a great fundraiser.  I\'m just sayin... ', 
                              author:user3, event:g1, parent:m2).save()
        def m2b1 = new Message(subject:'RE: I think I can get James Gosling to do a keynote', 
                               content:'message 2b1 content', author:user2, event:g1, parent:m2b).save()
        def m3 = new Message(subject:'Can anyone recommend a good screen printer?', 
                             content:'I need to get a quote on t-shirts, but I do not want cheesy ones.', 
                             author:user, event:g1).save()
//END:startMessages        
//START:addTasks
        g1.addToTasks new Task(title:'Identify potential venues', completed:true)
        g1.addToTasks new Task(title:'Get price / availability of venues', completed:true)
        g1.addToTasks new Task(title:'Compile potential sponsor list', completed:true)
        g1.addToTasks new Task(title:'Design promotional materials',  
                               dueDate: new Date() + 45,
                               assignedTo: user2,
                               completed:false)
        g1.addToTasks new Task(title:'Compile potential advertising avenues', 
                               dueDate: new Date() + 30,
                               assignedTo: user3,
                               completed:false)
        g1.addToTasks new Task(title:'Locate swag provider (preferably local)', 
                               dueDate: new Date() + 30,
                               assignedTo:user,
                               completed:false)
        g1.save()*/
//END:addTasks                                  
    }
//END:addTekUser
    
    def destroy = {
    }
} 
