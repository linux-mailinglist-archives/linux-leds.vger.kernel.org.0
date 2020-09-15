Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DFC26B037
	for <lists+linux-leds@lfdr.de>; Wed, 16 Sep 2020 00:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgIOVQR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 17:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbgIOVOp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 17:14:45 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3E9C06174A;
        Tue, 15 Sep 2020 14:14:23 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t16so4460924edw.7;
        Tue, 15 Sep 2020 14:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bXCLaAyb2F4FgpTkCB8XAXNaNNHqEwKMeuuEpS+U00I=;
        b=sowOTAKQTjrzAY1FT4fWXE0+Dg3ziORq4Dzoz2G5Qso1np5xio/xXh2jm+qnMVEz3j
         nCdpZz7zGsK46/J38x9QGgvBoKJE5fnxKZGIhjOHcSD+uGiwevfZJpE0XB4/sTqU8Xuu
         axUQeUXTGBzYYdyKzhMJ2dxsWMlykGsP1JOiTi6J/fx2gPdz8SBDY4/+xkK+adnTgo5h
         olUM0bTMnr5qlWwAG+g03L53IMxPXAYc10cK4p2Q34YaHKem53j2F5S7Jj5E/vkg8cha
         0CQQ3hkxgLX5hWR4dErv0ebBu4w6aU6l7RrJhtwb11jvngYwkm1XV0l6329cOZrFpsQp
         rK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bXCLaAyb2F4FgpTkCB8XAXNaNNHqEwKMeuuEpS+U00I=;
        b=VkkUWqqUZ+2klzrfBe+n4piclEYj1E8+hceEWA3VlgIZzEvRPkKHqa3bTpR5J42i5Y
         Z/zmJpEK3tEU9OLbRmruU1zHYYfkqRjVu2LZD4E5jJ7EpI3lc1nhUW2Lkfc3eH2l/O1K
         8Qf6l4n9gtZFZM7SVd4VKrTxAffxYb0tszicUbqkDoBcdYQuHsa9pbROwUNv8G8vr/Vv
         vvOMAjPu1AGdi/VYIPz8dOI1EOOxBQDprtcq6hJr0qaTpZ83BHjBUlmXN3pGKczxMesy
         4ER8aDt8VJJr2go4sOm4hUg2/G8MKsXeiimR4KnDsQszZ7fRvkHYq9JN4DJI/7GCorpn
         Tftw==
X-Gm-Message-State: AOAM532F5gIn7yt44k4J7PoIFeKHPLHiwwR6wYvugjPYf0TvLkSPffrD
        R/C+K3TjcJ8zlMWgPKeLN9Y=
X-Google-Smtp-Source: ABdhPJwb9qTNMtobI0azri3g5YC41lX9bVEopuEw+SW9nyf5ZBHkEdbrWKCF3g1tDAtoYj6JdNJYXA==
X-Received: by 2002:a50:8d57:: with SMTP id t23mr24769565edt.308.1600204461767;
        Tue, 15 Sep 2020 14:14:21 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:dd41:db23:e250:edba? ([2a01:110f:b59:fd00:dd41:db23:e250:edba])
        by smtp.gmail.com with ESMTPSA id s22sm12720040eds.21.2020.09.15.14.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 14:14:21 -0700 (PDT)
Subject: Re: [PATCH v4 1/3] leds: Require valid fwnode pointer for composing
 name
To:     Alexander Dahl <ada@thorsis.com>
Cc:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
References: <20200911154004.28354-1-post@lespocky.de>
 <20200911154004.28354-2-post@lespocky.de>
 <6652b897-5044-713b-6f06-83d07be0dba7@gmail.com> <2642665.8NmDdnWKvZ@ada>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <c8ce8db0-c829-faf1-a29c-0fde25179c3c@gmail.com>
Date:   Tue, 15 Sep 2020 23:14:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2642665.8NmDdnWKvZ@ada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On 9/15/20 11:14 AM, Alexander Dahl wrote:
> Hello Jacek,
> 
> thanks for your feedback. See below.
> 
> Am Freitag, 11. September 2020, 23:26:43 CEST schrieb Jacek Anaszewski:
>> On 9/11/20 5:40 PM, Alexander Dahl wrote:
>>> The function 'led_compose_name()' is called in
>>> 'led_classdev_register_ext(()' only and in its implementation it always
>>> parses the fwnode passed with the init_data struct.  If there's no
>>> fwnode, EINVAL is returned and 'led_classdev_register_ext()' returns
>>> early.
>>>
>>> If this is detected early the same fallback mechanism can be used , as
>>> if init_data itself is NULL.  This will allow drivers to pass fully
>>> populated 'init_data' or sparse initialized 'init_data' with a NULL
>>> fwnode in a more elegant way with only one function call.
>>>
>>> Fixes: bb4e9af0348d ("leds: core: Add support for composing LED class
>>> device names") Suggested-by: Pavel Machek <pavel@ucw.cz>
>>> Signed-off-by: Alexander Dahl <post@lespocky.de>
>>> ---
>>>
>>> Notes:
>>>       v4:
>>>         * added this patch to series (Suggested-by: Pavel Machek)
>>>    
>>>    drivers/leds/led-class.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
>>> index cc3929f858b6..3da50c7ecfe7 100644
>>> --- a/drivers/leds/led-class.c
>>> +++ b/drivers/leds/led-class.c
>>> @@ -346,7 +346,7 @@ int led_classdev_register_ext(struct device *parent,
>>>
>>>    	const char *proposed_name = composed_name;
>>>    	int ret;
>>>
>>> -	if (init_data) {
>>> +	if (init_data && init_data->fwnode) {
>>
>> This does not cover the case when we don't have fwnode but we
>> have init_data->default_label that led_compose_name() can make use of.
>>
>>>    		if (init_data->devname_mandatory && !init_data->devicename) {
>>>    		
>>>    			dev_err(parent, "Mandatory device name is missing");
>>>    			return -EINVAL;
> 
> You're right, I missed that part in that if/else if construct in
> led_compose_name() … I looked at the code for some more time now and could not
> come up with an elegant change to the led-core or led-class. :-/
> 
> However I also had another look at leds-pwm and for me it seems that it is
> used by fwnode (DT, ACPI, ??) based devices only.  I could not find a single
> user of leds-pwm as a platform driver, which is probably why 141f15c66d94
> ("leds: pwm: remove header") was possible?

In fact it looks like that patch was pointless, since it precluded the
use of struct led_pwm_platform_data anywhere besides the leds-pwm
driver.

> I had a look at the history of the leds-pwm driver and when introduced in 2009
> platform based board files where a thing, no dt, of, or fwnode yet, at least
> for arm, right?  Device tree support for leds-pwm was added in 2012 by Peter
> Ujfalusi.
> 
> So if those code paths in leds-pwm are not used anymore, what about dropping
> that platform support in leds-pwm driver?  That would mean we always have
> fwnode non-null and would not require a change in led-class at all?

git grep led_pwm_platform_data in fact shows only references in
leds-pwm.c, so yes, I think the platform support seems to be redundant.

-- 
Best regards,
Jacek Anaszewski
