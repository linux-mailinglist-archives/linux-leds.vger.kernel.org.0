Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47C4C9101
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 20:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728773AbfJBSl4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 14:41:56 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46252 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfJBSl4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 14:41:56 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92Ifprj046365;
        Wed, 2 Oct 2019 13:41:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570041711;
        bh=+spmMCalRYp1KmZp1TuVW9ikVfMlhtrnfO2BlXZmNic=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sBQB5FHAnbY4HxsNIIJNE8aBVT9EGOv1BA9RHeZGtr2S1TaSeglDO+urtugUajqbX
         aD59zBde8G7x3HY1rjNTeBj3xjUBto/70rsw8/0H/HQcVGgikhi0xGYrIAr+QngKvl
         YqKdhp7uBUJzg7+QBymimWuSB8QD22M1Ip6g85sI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92Ifpp9107814
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 2 Oct 2019 13:41:51 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 13:41:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 13:41:40 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92IfoM3129258;
        Wed, 2 Oct 2019 13:41:50 -0500
Subject: Re: [RFC PATCH] leds: core: Fix LED_COLOR_MAX_ID
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20191002163400.25317-1-dmurphy@ti.com>
 <20191002183603.GC13492@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <fae233c1-7c5b-7468-33c1-5309c036fd66@ti.com>
Date:   Wed, 2 Oct 2019 13:42:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002183603.GC13492@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 10/2/19 1:36 PM, Pavel Machek wrote:
> On Wed 2019-10-02 11:34:00, Dan Murphy wrote:
>> The LED_COLOR_MAX_ID is incorrect.  THe MAX_ID should
>> be the last COLOR_ID in the list.  If an array was allocate
>> with MAX_ID the allocation would be correct but the meaning
>> is wrong.
>>
>> So for array allocation the code should use LED_NUM_COLOR_IDS
>> which will allocate MAX_ID + 1.  Whent the code needs to validate
>> that the color ID is not out of bounds then the code should use
>> LED_COLOR_MAX_ID.
> Renaming original define might have been okay. Having two defines is
> not. I'd say we can keep it as is...

OK.  It was just not logical that MAX_ID will always be 1 more then the 
actual MAX_ID.

So every ID boundary check will need to be ">=" as opposed to ">" which 
means we have to take care in reviews to make sure this is what is intended.

But it was just a RFC so I am not pushing this fix.  It would mean I 
would have to re-touch the MC framework patches.

Dan


>
> 								Pavel
> 								
