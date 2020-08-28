Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD5C25622B
	for <lists+linux-leds@lfdr.de>; Fri, 28 Aug 2020 22:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgH1UnN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Aug 2020 16:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgH1UnH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 Aug 2020 16:43:07 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96FAC061264;
        Fri, 28 Aug 2020 13:43:06 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id q4so278842eds.3;
        Fri, 28 Aug 2020 13:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=28bk4YcTBqEPYcp2WU1z35XfYDmUQokqTfLxs/F8nV4=;
        b=FSs1tlg2X1VdNxRt4vyRcZ5Zu8/59rfGq9kLL2SYC7BOJRRPR6sqbGL08R3B7VPK50
         jB1Js3Gc5fMXYiDyc7sLrqXmG3v/rqc+AhjyDUAc/x6Oapd/4q3L5Vej6m1xIASvm//Y
         M4Ad7s7zUNXvNoHxttvVPSrrApjgSy13mYpcuoVTqhJLWChjlKKYIDRiAcmwmyM5/lsw
         H/yq7ee0mfChXs/gKwi62Ol9noIRxMqenic97HLP83JpIZ8zdk7Um4ps1PF6ceabh/vI
         i/QBUsk6LldDc3ThKb+uVvL/IscfDkz7GPnwsAt+puaFaQWL3KX4MBKsmcbOHvl+FgHJ
         HmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=28bk4YcTBqEPYcp2WU1z35XfYDmUQokqTfLxs/F8nV4=;
        b=tWkmTQBrFyvbkXeg2Hfo34HTHoMHCwPHqZC26kaYz6N0JftRhSR0pBvBqOxc25XASI
         ratim0u+pC40zaf89KPkrD+6mxLaSZFO8Im6jrCs9QXig6o5WVH44Fl7I0wf+LukJ7bA
         HRj9nUPi5Ob707BI4GTxF87uZsnVG4s/FQMfFAttMjlZPsSC9NM8oDnsRpNSl+vMbZyl
         VA9qqiRtpO1AMcUk/5Klf74qVYt0QWrNSa1c3sOJJ4XtQVPPZR22xU9DWuLJXFsqGd3w
         LNsRytlaOWXUiBJ0JGambzlrfH/DkbpS/kBBgth6bgmcyEACSYK30JEQRPUcx5yFn+cJ
         gqwA==
X-Gm-Message-State: AOAM530+FgLxC58rHgyCcN0TJu0eOLxz5yrCd5rDgnAVG3bKnlMlpIWB
        HcemOpoBuKH9epX7wcp7kmY=
X-Google-Smtp-Source: ABdhPJwYxN3AMoqkldp/4T1VeLmUWtkcuJaVp65u1IVVk2kOGdHhsiaklT1I/lz06LOE7dfmYEZWrg==
X-Received: by 2002:a50:fd0b:: with SMTP id i11mr575308eds.298.1598647385569;
        Fri, 28 Aug 2020 13:43:05 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:2c11:d1e6:276c:6a7f? ([2a01:110f:b59:fd00:2c11:d1e6:276c:6a7f])
        by smtp.gmail.com with ESMTPSA id d20sm263356ejj.10.2020.08.28.13.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2020 13:43:05 -0700 (PDT)
Subject: Re: [PATCH] leds: pwm: Allow automatic labels for DT based devices
To:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>
References: <20200826093737.29008-1-ada@thorsis.com>
 <d6f69d4a-3e46-cad4-5756-4d15e5ef95ba@gmail.com> <7920560.iacgkFlgr8@ada>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <eff509d5-a5f7-0d5d-b39c-aac364e53aca@gmail.com>
Date:   Fri, 28 Aug 2020 22:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7920560.iacgkFlgr8@ada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On 8/28/20 9:00 AM, Alexander Dahl wrote:
> Hello Jacek,
> 
> Am Donnerstag, 27. August 2020, 23:28:45 CEST schrieb Jacek Anaszewski:
>> On 8/26/20 11:37 AM, Alexander Dahl wrote:
>>> From: Alexander Dahl <post@lespocky.de>
>>>
>>> If LEDs are configured through device tree and the property 'label' is
>>> omitted, the label is supposed to be generated from the properties
>>> 'function' and 'color' if present.  While this works fine for e.g. the
>>> 'leds-gpio' driver, it did not for 'leds-pwm'.
>>>
>>> The reason is, you get this label naming magic only if you add a LED
>>> device through 'devm_led_classdev_register_ext()' and pass a pointer to
>>> the current device tree node.  The approach to fix this was adopted from
>>> the 'leds-gpio' driver.
>>>
>>> For the following node from dts the LED appeared as 'led5' in sysfs
>>> before and as 'red:debug' after this change.
>>>
>>>           pwm_leds {
>>>           
>>>                   compatible = "pwm-leds";
>>>                   
>>>                   led5 {
>>>                   
>>>                           function = LED_FUNCTION_DEBUG;
>>>                           color = <LED_COLOR_ID_RED>;
>>>                           pwms = <&pwm0 2 10000000 0>;
>>>                           max-brightness = <127>;
>>>                           
>>>                           linux,default-trigger = "heartbeat";
>>>                           panic-indicator;
>>>                   
>>>                   };
>>>           
>>>           };
>>>
>>> Signed-off-by: Alexander Dahl <post@lespocky.de>
>>> ---
>>>
>>> Notes:
>>>       v1: based on v5.9-rc2, backport on v5.4.59 also works
>>>    
>>>    drivers/leds/leds-pwm.c | 9 ++++++++-
>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
>>> index ef7b91bd2064..a27a1d75a3e9 100644
>>> --- a/drivers/leds/leds-pwm.c
>>> +++ b/drivers/leds/leds-pwm.c
>>> @@ -65,6 +65,7 @@ static int led_pwm_add(struct device *dev, struct
>>> led_pwm_priv *priv,>
>>>    		       struct led_pwm *led, struct fwnode_handle *fwnode)
>>>    
>>>    {
>>>    
>>>    	struct led_pwm_data *led_data = &priv->leds[priv->num_leds];
>>>
>>> +	struct led_init_data init_data = {};
>>>
>>>    	int ret;
>>>    	
>>>    	led_data->active_low = led->active_low;
>>>
>>> @@ -90,7 +91,13 @@ static int led_pwm_add(struct device *dev, struct
>>> led_pwm_priv *priv,>
>>>    	pwm_init_state(led_data->pwm, &led_data->pwmstate);
>>>
>>> -	ret = devm_led_classdev_register(dev, &led_data->cdev);
>>> +	if (fwnode) {
>>> +		init_data.fwnode = fwnode;
>>> +		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
>>> +						     &init_data);
>>> +	} else {
>>> +		ret = devm_led_classdev_register(dev, &led_data->cdev);
>>> +	}
>>>
>>>    	if (ret) {
>>>    	
>>>    		dev_err(dev, "failed to register PWM led for %s: %d\n",
>>>    		
>>>    			led->name, ret);
>>
>> This part looks good, but corresponding update of
>> Documentation/devicetree/bindings/leds/leds-pwm.txt is needed as well.
> 
> I'm not sure, what needs updating. The properties 'function' and 'color' are
> already documented in Documentation/devicetree/bindings/leds/common.yaml … the
> only thing I can think of here is updating the examples? That would be nice,
> as would be updating to yaml, but I don't see the strong relation, yet.

It is necessary to tell the user that given driver is capable of
utilizing a property. I thought of something like in commit [0].

>> It would be good to switch to yaml by this occassion.
> 
> Is there some guidance on that in general?

I am not aware of, but surely sooner or later all bindings will
need to be unified. Touching the file is always a good opportunity
to address that. It's up to you, though.

[0] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/leds/leds-lm3692x.txt?id=4dcbc8f8c59f4b618d651f5ba884ee5bf562c8de

-- 
Best regards,
Jacek Anaszewski
