class MailchimpService
      
    def initialize
        @gibbon = Gibbon::Request.new

        @list_id = "b60a9d251e"

        @tag_names = {
            national: "affiliate-national-plan",
            regional: "affiliate-regional-plan",
            local: "affiliate-local-plan"
        }

    end
    
    def add_user_to_list(email)
        @gibbon.lists(@list_id).members.create(body: {email_address: email, status: "subscribed"})
    end 

    def add_tag_to_affiliate(affiliate) 
        affiliate_plan = affiliate.affiliate_plan.nickname
        @gibbon.lists(@list_id).members(Digest::MD5.hexdigest(affiliate.email)).tags.create(body: {tags: [{name:@tag_names[affiliate_plan.to_sym], status:"active"}]})
    end 

    def add_tag_to_free(email)
        @gibbon.lists(@list_id).members(Digest::MD5.hexdigest(email)).tags.create(body: {tags: [{name: "affiliate-free-plan", status:"active"}]})
    end 

    def add_attributes(email, first_name, last_name)
        @gibbon.lists(@list_id).members(Digest::MD5.hexdigest(email)).update(body: { merge_fields: {FNAME: first_name, LNAME: last_name}})
    end 
  end