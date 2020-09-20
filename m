Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42AD271646
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 19:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgITRWB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 20 Sep 2020 13:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgITRWB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 20 Sep 2020 13:22:01 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC35C061755
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 10:22:01 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id p9so14592470ejf.6
        for <linux-leds@vger.kernel.org>; Sun, 20 Sep 2020 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qpOVDDFzMyPYXqz/3yyq49fLQDQZyv4ldTHuRGmcWFU=;
        b=Pk8vuQi/kpzRPqt+v65DMukhEdJUfOoc9nj6VSbHv6KRiVqziQ/w9vWE/ZWGqHzcZj
         yXHiByRIMsxkMQ4vDju0kVMcB/phPKW8PYbyace2Ry5tdjOIxJsONvQRbsyeyxL3fJHw
         wMiRqiBHQt+b9mxJxMqXzAsexorN/4h1ACdN27FNNI10zPUFvY2eUOEAK0e4sBTxoNDr
         q0rc5YCd/LKhBoO5tcvXjmTEnGc4MqjpLV1W4u0NCbWENpUzqGwK1gi9npDpCBjE7Bc/
         0vNkOH+BY6FKKeMmf15m46p/4kzBWEe+M1bABnom3dgOvw08n+lfXA+VYKieLadTFbDV
         3CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qpOVDDFzMyPYXqz/3yyq49fLQDQZyv4ldTHuRGmcWFU=;
        b=Rwz5HbN5mFkGJ4Vr5sH6dz5N0mJYI4AD2Zgy9VdFK4XuAst+VUJpuLzELfC0siZNWW
         GLoDpdGfpn+3HNe+75wV6RA9rBqsleYmg7xX0LuNqJDPlrssOjJzWN12VuVgC7tygpsd
         J+eRskUNo7OosK/HlYfdt7+8mZoRIxxAEqpQ1TsLPQ4n9rIToH4z+/a24S96fOPq9Cq8
         dFX6efGzl/MjJH3r9s8XrvxF7GOu3sBoAtSXQZ6bcLseIzhwc03NrYqfn5wWA4PEo6zC
         bRRmgV2rhq57gXQZmxNjtgZJTn+CJiEgQQZYtkfDUou8Dqt2N6biM4bNvGx1WuN4ssKP
         wd+w==
X-Gm-Message-State: AOAM532fKmhizsOtj0xI4zCwr9iwf3Asu2W3rO2Z5KiX3NWhiIl7uUhC
        XIrNKT6uWR8rW7b0auCSAcU=
X-Google-Smtp-Source: ABdhPJyDhl9zMPYlR6MFSsbzpM+GR5mkhxNcmA7WZz/jCK1RScrb4hk2xHpscLi8QHLJWhFdU1LrZA==
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr46297380eji.334.1600622519555;
        Sun, 20 Sep 2020 10:21:59 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:1879:e534:7e37:5e55? ([2a01:110f:b59:fd00:1879:e534:7e37:5e55])
        by smtp.gmail.com with ESMTPSA id j14sm6798799edr.91.2020.09.20.10.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 10:21:59 -0700 (PDT)
Subject: Re: [PATCH] leds: Document standard LED functions
To:     Marek Behun <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, pavel@ucw.cz, dmurphy@ti.com
References: <20200920162625.14754-1-jacek.anaszewski@gmail.com>
 <20200920184422.60c04194@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <91bfdd36-34bc-2be4-1f96-10c33c6a1393@gmail.com>
Date:   Sun, 20 Sep 2020 19:21:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200920184422.60c04194@nic.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/20/20 6:44 PM, Marek Behun wrote:
> On Sun, 20 Sep 2020 18:26:25 +0200
> Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> 
>> Add a documentation for standard LED functions with regard
>> to differences in meaning between cases when devicename section
>> of an LED name is present or not.
>>
>> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> ---
>>   Documentation/leds/led-functions.rst | 226 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 226 insertions(+)
>>   create mode 100644 Documentation/leds/led-functions.rst
>>
>> diff --git a/Documentation/leds/led-functions.rst b/Documentation/leds/led-functions.rst
>> new file mode 100644
>> index 000000000000..42621dd81235
>> --- /dev/null
>> +++ b/Documentation/leds/led-functions.rst
>> @@ -0,0 +1,226 @@
>> +============================================
>> +Standardized LED functions and their meaning
>> +============================================
>> +
>> +Each LED function is described using below template:
>> +
>> +LED function name
>> +-----------------
>> +
>> +    NDEV : <function meaning when LED devicename section is absent>
>> +    DEV  : <function meaning when LED devicename section is present>
>> +    DEVICENAME : <expected LED devicename for DEV case>
>> +    TRIGGER: <matching LED trigger>
>> +
>> +LED functions with corresponding LED trigger support
>> +----------------------------------------------------
>> +
>> +- activity
>> +    NDEV : system activity
>> +    DEV  : n/a
>> +    TRIGGER : "activity"
>> +
> 
> Hi Jacek,
> as I wrote in another discussion, but maybe we should discuss this here.
> Are your opinions on this matter final or are you open for discussion?
I am certainly open for discussion, especially that now this is not me
who is in charge here :-)

> For activity: the thing is that activity is sometimes interpreted as
> the union of rx and tx, or read and write. I think the pair (device,function)
> could be used better to infer the actual trigger and its settings, than
> just (function,). For example:
> 	device	function		trigger
>          ------  --------                -------
> 	system	activity		cpu activity
> 	(empty)	activity		cpu activity
> 	eth0	activity		netdev rx/tx
> 	sda	activity		disk read/write on sda
> 	wlan0	activity		phy rx/tx

As you may have seen Rob proposed that LED functions immediately
implied default trigger. That was in discussion over a year ago while
my LED naming patch set was floating around. Thus this proposal looks
how it looks.

If we are not going to infer default LED trigger from LED name,
then other options are open. But if we compare your above proposals
with contents of this patch, we will see that for eth0 activity we will
have lan, for sda activity  we will have "disk-read"/"disk-write" and 
for wlan activity we will have wlan, and more precise function can
be inferred referring to particular phyN-function trigger.

>> +- backlight
>> +    NDEV : when there is a single one on the platform
>> +    DEV  : backlight of a frame buffer device
>> +    DEVICENAME : associated frame buffer device, e.g. fb0
>> +    TRIGGER: "backlight"
>> +
>> +- disk
>> +    NDEV : rw activity on any disk in the system
>> +    DEV  : rw activity on specified disk
>> +    DEVICENAME : associated disk, e.g.: hda, sdb
>> +    TRIGGER : "disk-activity", applies only to NDEV case
>> +
>> +- disk-read / disk-write
>> +    NDEV : read / write activity on any disk in the system
>> +    DEV  : read / write  activity on specified disk
>> +    DEVICENAME : associted disk, e.g.: hda, sdb
>> +    TRIGGER : "disk-read" / "disk-write" , applies only to NDEV case
>> +
> 
> Currently the disk trigger blinks on events for any device, user cannot
> specify just one. If we implemented this, I think the trigger name

This is already implemented, see drivers/leds/trigger/ledtrig-disk.c.

And for blinking on specific device there was block device trigger
proposal, probably someone already works (or soon will start working)
on it.

> should be just "disk", and whether it is read/write/both should be
> decided by sysfs files "read" and "write" as is in netdev trigger files
> "rx" and "tx".
> 
> Moreover I think it would make more sense (but other people can of
> course disagree) if the LED function for LED associated with a disk
> could be "activity", "read" or "write",
> 
> 	device	function		trigger
>          ------  --------                -------
> 	sda	activity		disk read/write on sda
> 	sda	read			disk read on sda
> 	sda	write			disk write on sda

We have currently more meaningful functions:

#define LED_FUNCTION_DISK_ACTIVITY "disk-activity"
#define LED_FUNCTION_DISK_ERR "disk-err"
#define LED_FUNCTION_DISK_READ "disk-read"
#define LED_FUNCTION_DISK_WRITE "disk-write"

-- 
Best regards,
Jacek Anaszewski
