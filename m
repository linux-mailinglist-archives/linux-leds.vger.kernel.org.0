Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F4D170B51
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 23:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgBZWPl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 17:15:41 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:59308 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727715AbgBZWPl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 17:15:41 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01QMFYvx010050;
        Wed, 26 Feb 2020 16:15:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582755334;
        bh=31IwkFACdr77CIUf9TrZXycOQvg7ZjmTVme5kI0Me2k=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=GyCX7V4MYgq93RTraRpbtKUydot3q9l5OF8RLtt9O0VpJg8yOcmzjRqbW2RJVzNAp
         n9SuFhFyBsWrY0dRqwOT4KfZ6e+xTMrpTcgODpd5ruTwNcKOEXjzVQBClijteMMiLs
         9a4Vba06dCQEBv4iVMEetzj/GUcvCMV2vvRcT7vs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01QMFYBQ050487
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 26 Feb 2020 16:15:34 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 16:15:33 -0600
Received: from localhost.localdomain (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 16:15:33 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 01QMFXB8072817;
        Wed, 26 Feb 2020 16:15:33 -0600
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com> <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <2f349232-327c-eb3a-4f3a-c22cdbe98c24@ti.com>
Date:   Wed, 26 Feb 2020 16:10:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 2/26/20 2:45 PM, Jacek Anaszewski wrote:
> Hi Greg,
>
> We have here long lasting discussion related to LED multicolor class
> sysfs interface design. We went through several iterations and worked
> out the solution with individual file per each color sub-LED in the
> color directory as shown below:
>
> /sys/class/leds/<led>/colors/<color>_intensity
>
> This is in line with one-value-per-file sysfs rule, that is being
> frequently highlighted, and we even had not so long ago a patch
> for led cpu trigger solving the problem caused by this rule not
> being adhered to.
>
> Now we have the voice below bringing to attention another caveat
> from sysfs documentation:
>
> "it is socially acceptable to express an array of values of the same
> type"
>
> and proposing the interface in the form of two files:
>
> channel_intensity (file containing array of u32's)
> channel_names (usually containing "red green blue")
>
> In order to have this clarified once and for all, could you please
> provide us with guidance on whether the fragment from
> Documentation/filesystems/sysfs.txt is still in force and we
> can benefit from it for LED multicolor framework, or not and then
> it should be removed from the doc then?

I spent some time trying to find the conversation on the array 
implementation for the multi color framework.

It is buried here

https://lore.kernel.org/patchwork/patch/1026515/

The response from GKH on array's was sited in the above here:

https://www.spinics.net/lists/devicetree/msg69730.html

Repeating my objections to using arrays.

Would this array of colors be fixed?  Well the answer is it would be 
fixed per DT entries.  So if a user populates 10 LEDs for color then we 
will have 10 entries in the array.  Another DT entry may only have 3.  
So the array size is variable but bounded for now assuming no additional 
colors are added.

Another issue with this implementation is we expect channel_names and 
channel_intensity arrays to be aligned.  Two different arrays need to 
line up so that each element value in channel_intensity matches the 
color in the channel_name.   This can be very easily mixed up in the 
HLOS if the proper array tracking is not done. Can we guarantee that the 
values we are getting are for the LED they are targeted for?

Would this array be bounded?  Bounded yes by the number of supported 
color IDs we have defined in the LED file.  But the size of the array is 
completely variable from device to device

Specific LEDs cannot be updated without re-sending the whole array.  If 
the user would like to change just 1 color and it is the nth position 
(possibly 10th from above) then all color intensities need to be 
passed.  There would be no way to say I want "red" at the 10th position 
to be 128 without passing in all the other color values as well.  So the 
caller needs to keep a cache of the current values or call the framework 
to get the current values just to pass them back in. This seems more 
expensive then writing 2 sysfs files as writing to the color/<color> 
intensity file does not perform any I/O it merely caches the values.  
With the array the framework would need to process all the elements in 
the array every time the array is passed.  And then still call the 
brightness file to update the color outputs.  So we still have at 
minimum two sysfs accesses.

Neither implementation is perfect.

Maybe we need to ask GKH to host this in the staging directory and 
actually get some feedback from users as opposed to imposing our will on 
people.

Not sure if the ABI's can change in staging.

Dan

