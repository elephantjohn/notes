cluster index

​              hi everyone today I'm going to talk            

​              about the differences in similarities            

​              between clustered indexes and            

​              non-clustered indexes this is one of the            

​              most important things to understand when            

​              you're performance tuning for a given            

​              workload 



in this video ,though I'm only  going to talk about the structures   because the performance tuning aspects  can cover a whole other video, just like the names of these objects are similar,  so two are the internal implementations  ,but don't be fooled by that subtlety ,the  end results can have very different            

 behavior and even place restrictions on   what you can do to the table .



let's start            

​              by taking a look at what these            

​              structures are made of internally for my            

​              very simple example here we'll use a            

​              table that models some of the data found            

​              in a phone book each row has a person's            

​              first name last name and phone number if            

​              the table has no indexes at all this is            

​              called a heap and when new values are            

​              inserted they're added wherever there's            

​              free space and in no particular order            

​              using this structure if we were looking            

​              for a specific person's phone number we            

​              would have to check through every single            

​              row in the table not only because            

​              there's no order to the data but also            

​              because even if we found a match we            

​              wouldn't know if there were more matches            

​              later on this type of searching is            

​              called a scan and as you can see it's            

​              very inefficient particularly in this            

​              case when we know there's a much better            

​              way table scans aren't always a bad            

​              thing it's just that if you don't need            

​              to touch all the rows in a table there's            

​              usually a better way to go about it in            

​              the phone book the entries are sorted by            

​              last name from A to Z and if there are            

​              any duplicates of last name they're            

​              further sorted by first name also from A            

​              to Z in database terminology this is the            

​              index key and it's an ordered list of            

​              columns and their associated sort            

​              directions going back to the example            

​              there are a couple different ways to            

​              structure the data to make it more            

​              efficient to find a person's phone            

​              number just like the real phonebook we            

​              can take the data in the table and            

​              physically arrange it into lastname            

​              firstname order but this is not enough            

​              by itself to solve the performance            

​              problem it would end up doing a similar            

​              type of table scan as we saw before but            

​              this time it would know when to stop            

​              because the table data is ordered this            

​              is where the index part of things comes            

​              to play after the table data is put into            

​              physical order sequel server builds up a            

​              set of index pages that allows queries            

​              to navigate directly to the data they're            

​              interested in this entire structure            

​              including the base table data is called            

​              a clustered index when a query navigates            

​              through the clustered index tree to the            

​              base table data this is called a            

​              clustered index seek this is very close            

​              to the same process you would use to            

​              find a person's phone number from a            

​              physical phonebook it doesn't only have            

​              the last name first name phone number            

​              entries but it also has some duplicated            

​              information that tells you about the            

​              range of last names on each page the            

​              index pages I mentioned work in a very            

​              similar way since a clustered index            

​              contains the base table data itself this            

​              is why you can only create one clustered            

​              index it's impossible to physically            

​              arrange the same data in two different            

​              ways without having a separate structure            

​              to store that information and this is            

​              where non-clustered indexes come in            

​              let's start again with the heap            

​              structure the second way to give order            

​              to the data is to create a separate            

​              physical structure that has the same            

​              index tree like the clustered index this            

​              time though instead of having the base            

​              data at the bottom or leaf level of the            

​              tree instead we have a set of pointers            

​              or references back to the base data with            

​              this type of structure we can use any            

​              index key order we want because the            

​              order is independent of the base table            

​              data order this entire structure is            

​              called a non-clustered index in this            

​              example the base data is a heap and the            

​              references back to it are rids or row            

​              identifiers these are the physical            

​              locations of the rows in the table since            

​              a non-clustered index is separate from            

​              the base data the base data could exist            

​              instead as a clustered index in that            

​              case the references back to it aren't            

​              rids but instead are the clustered index            

​              key values just like a clustered index            

​              can and seek non-clustered indexes can            

​              also have those same operations            

​              performed on them but the data directly            

​              available may be limited because usually            

​              non-clustered indexes only include a            

​              subset of columns from the table if            

​              values from columns not            

​              the index are requested the query may            

​              navigate back to the base data using the            

​              reference as I mentioned earlier if the            

​              query optimizer decides that doing that            

​              is too expensive it may fall back on            

​              scanning the base data instead of using            

​              the index this behavior has very obvious            

​              performance implications non-clustered            

​              indexes being separate from the base            

​              data brings about a couple of important            

​              features filtered indexes only contain            

​              rows that meet a user-defined predicate            

​              and to create these you add a where            

​              clause to the index definition a            

​              clustered index can't be filtered            

​              because it has to contain all the data            

​              in the table include columns add copies            

​              of non-key column values to the leaf            

​              level of the index tree this means that            

​              queries using the non-clustered index            

​              won't have to incur the expense of            

​              navigating back to the base data to get            

​              those non-key column values a clustered            

​              index on the other hand doesn't need            

​              include columns because all the columns            

​              are available at the leaf level of the            

​              index those two features only scratch            

​              the surface of the options there are            

​              when creating or maintaining an index so            

​              I've put some links below for further            

​              reading some of the features and            

​              restrictions are version and even            

​              edition specific so you'll want to go            

​              through that material in quite a bit of            

​              detail the takeaway as far as clustered            

​              versus non clustered goes is that the            

​              clustered index is a way of representing            

​              the base data as a whole a non-clustered            

​              index is a physically separate structure            

​              that references the base data and it can            

​              have a different sort order as of making            

​              this video the only other type of index            

​              in sequel server that has a different            

​              physical structure is a columnstore            

​              index this type of index was introduced            

​              as a non-clustered index in sequel            

​              Server 2012 and if the pre-release            

​              documentation holds up it will also be            

​              available as a clustered index in sequel            

​              server 2014 well this isn't directly            

​              related to the discussion about            

​              clustered vs. non-clustered indexes I            

​              want to take a short detour to talk            

​              about the two types of index back            

​              constraints primary key constraints and            

​              unique key constraints I've already            

​              written a full post about this on my            

​              blog so I'll include a link below and            

​              this will be brief            

​              constraints in general are logical            

​              database objects the two types of            

​              constraints I mentioned create indexes            

​              behind the scenes although sequel server            

​              in theory is free to implement them            

​              anyway likes by default a primary key            

​              constraint creates a clustered index            

​              while a unique key constraint creates a            

​              non-clustered index they are that way            

​              partly for safety in case the table            

​              designer doesn't realize that the            

​              defaults can be changed and partly            

​              because that's usually a pretty good            

​              starting point the main things to            

​              remember are that these constraints and            

​              the indexes that back them are different            

​              constructs and also that the type of            

​              index is being created behind the scenes            

​              can be changed for obvious reasons this            

​              is definitely something you need to be            

​              aware of when performance tuning again            

​              if you want to go a bit more in depth            

​              you can check out the post on my blog so            

​              I hope this clears up a lot of the            

​              confusion about clustered verses            

​              non-clustered indexes understanding the            

​              structures and how they work should give            

​              you a much better insight into how to            

​              improve the performance of your systems            

​              workload if you found this video helpful            

​              please let me know by clicking the like            

​              button and subscribe to the channel to            

​              see more videos in the future thanks for            

​              watching            

​              you            

​        

​      