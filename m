Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79EF9C9028
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 19:46:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbfJBRqq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 13:46:46 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51413 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbfJBRqq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 13:46:46 -0400
Received: by mail-wm1-f67.google.com with SMTP id 7so8135393wme.1;
        Wed, 02 Oct 2019 10:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NCYYmYxnabjwGyaGtHZnVqcfcshCaXfZj/xIcoa6s4w=;
        b=SqXRa0IS4c+Trk6/JnH6mNLVraGQ4fRJYu3VufJWlVbe9xCVaqFAqtnNnn4UNGD0YJ
         gfk2I4nen3UBJzLP5NXnrvhP8AUUGtQvP4lwHMH29Z2Lyb+sSXFTk8aLBYknFQk0jIIj
         WwxiZP9Bp4aV1aSCBAHsQFT6ryd8J+x4K8IrX6riJAoxJp09n7/CDMtu0Q/i7vC0SI1T
         5yWQcDEZkDFXu3cvj0qMYeSYtPtXVLLwDutH2Eog0csMahrXKBfq/X+POGUidU7KAEK/
         OXViV3blkwwOQqmfI+w3DYGn/PovFEALWEVc/XXBC9zbkzo4wUv13zVep0d5VxKMKc1s
         tcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NCYYmYxnabjwGyaGtHZnVqcfcshCaXfZj/xIcoa6s4w=;
        b=bUFMaCGo3NfviNiTSIuK6Xo070pCu/uXXP3mh7tj4H3kWirt1XxLzedeJ5EqaqRnNX
         lcl3TlDvH3FWe5bzebyS+OyIhrBUSaTz5Skjh2fsNojR1AujjjxAOW4Rd1Tiae8VRXui
         86Dos4WOoVDV5zbM8PP1rqwjx6YEyNFELoxUa4zW8o2qqFWaC9EpB+WpCKbAAjkoWCu7
         oZSUMHAWvMb0U6sB4D2ohIWYBp9HlrhI4Icc1zvNycjIEJEDOkPVvBFYroiRg7ZECjwW
         LzjqLmcz1NlsbsEuvBvTpoaKKvUZyrwTETeH4Q/PL2HyVvx/R3SClFJEYSOZh0EiuCcR
         OuaQ==
X-Gm-Message-State: APjAAAW2Gytg24Irz86aiAtbRDox+kaK0qN4T7j/6RuLyZw005jlmX7q
        QCtGuSaxSjVo0KEKejUHcJo=
X-Google-Smtp-Source: APXvYqwLeZtlfwdNbb2ZRtCQKqNfLEY8cgGQSzePWT3QcLFhLl7LPnblXXIfCAX6eJGVxAQrYqT/Pg==
X-Received: by 2002:a05:600c:217:: with SMTP id 23mr4079090wmi.76.1570038403632;
        Wed, 02 Oct 2019 10:46:43 -0700 (PDT)
Received: from [192.168.1.19] (ckh198.neoplus.adsl.tpnet.pl. [83.31.83.198])
        by smtp.gmail.com with ESMTPSA id y3sm9533818wmg.2.2019.10.02.10.46.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Oct 2019 10:46:43 -0700 (PDT)
Subject: Re: [PATCH -next 2/2] leds: add /sys/class/leds/<led>/current-trigger
To:     Dan Murphy <dmurphy@ti.com>, Akinobu Mita <akinobu.mita@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
 <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
 <ec4d9d2c-6f8d-97a6-41d7-832a3fc1ca72@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <589ba4d7-31f5-c789-d5ca-c13650cf5b03@gmail.com>
Date:   Wed, 2 Oct 2019 19:46:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ec4d9d2c-6f8d-97a6-41d7-832a3fc1ca72@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/2/19 5:47 PM, Dan Murphy wrote:
> Akinobu
> 
> On 10/2/19 10:13 AM, Akinobu Mita wrote:
>> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
>> However, this violates the "one value per file" rule of sysfs.
>>
>> This provides /sys/class/leds/<led>/current-trigger which is almost
>> identical to /sys/class/leds/<led>/trigger.  The only difference is that
>> 'current-trigger' only shows the current trigger name.
>>
>> This new file follows the "one value per file" rule of sysfs.
>> We can find all available LED triggers by listing the
>> /sys/devices/virtual/led-trigger/ directory.
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Dan Murphy <dmurphy@ti.com>
>> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
>> ---
>>   Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
>>   drivers/leds/led-class.c                  | 10 ++++++++
>>   drivers/leds/led-triggers.c               | 38
>> +++++++++++++++++++++++++++----
>>   drivers/leds/leds.h                       |  5 ++++
>>   4 files changed, 62 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-led
>> b/Documentation/ABI/testing/sysfs-class-led
>> index 5f67f7a..fdfed3f 100644
>> --- a/Documentation/ABI/testing/sysfs-class-led
>> +++ b/Documentation/ABI/testing/sysfs-class-led
>> @@ -61,3 +61,16 @@ Description:
>>           gpio and backlight triggers. In case of the backlight trigger,
>>           it is useful when driving a LED which is intended to indicate
>>           a device in a standby like state.
>> +
>> +What:        /sys/class/leds/<led>/current-trigger
>> +Date:        September 2019
>> +KernelVersion:    5.5
>> +Contact:    linux-leds@vger.kernel.org
>> +Description:
>> +        Set the trigger for this LED. A trigger is a kernel based source
>> +        of LED events.
>> +        Writing the trigger name to this file will change the current
>> +        trigger. Trigger specific parameters can appear in
>> +        /sys/class/leds/<led> once a given trigger is selected. For
>> +        their documentation see sysfs-class-led-trigger-*.
>> +        Reading this file will return the current LED trigger name.
> 
> Why do we need this new file can't we just update the current trigger
> file implementation?

We can't change existing ABI. It doesn't matter if it is documented
or not - it's in place for very long time and you can't guarantee there
are no users relying on triggers file show format.

> I don't see any documentation that states that the read of the trigger
> file will print a list of known triggers.
> 
> And writing to the trigger file still works so I would think the _show
> just needs to be fixed.
> 
> Besides this patch does not fix the issue in the commit message that the
> trigger file still violates the one value per file rule.
> 
> Dan
> 
> 

-- 
Best regards,
Jacek Anaszewski
