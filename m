Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C70397A7
	for <lists+linux-leds@lfdr.de>; Fri,  7 Jun 2019 23:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbfFGVX7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 Jun 2019 17:23:59 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35608 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730204AbfFGVX7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 Jun 2019 17:23:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id m3so3486002wrv.2;
        Fri, 07 Jun 2019 14:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=hYc3Rje2uyha19LwMF0WR7g2mksN2evyofsdRY5DsDU=;
        b=Mf6RRtrzSN6CZ0/S2ZOpk6IJ/TOYHF/HlNXGEt4Mzyopt0y8dloJ+A74Q668UjZORt
         vSh0cUN4bnAtqM+6ThoDba4kZofEt+/oRK1HiXHDDM81ysBy2cMOMDRrAw7H6VDSdlXL
         42uwO5KB0l0ReH/+3lvUR7W1dmw4ZGLnfpghrZUbfKSYoyNTMhUE647QppmxbZPBli9+
         UsIWIdRyjSakdWmAg1Wu71bqYTwHLXu0+Uj+w7DmBd8dDAVKdICQ5lXb5C+uiHvx1z5J
         gw1rsk6lA22ATEMYwyKVHahyhaBPfi+IlYq2QVdeOV4Fc7WoL7/R1HbhrEUS8LDTv2YO
         lrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hYc3Rje2uyha19LwMF0WR7g2mksN2evyofsdRY5DsDU=;
        b=eKGDJdspBAJ4Lag3RFZfAsuYULs5UJ3kpF6GzOeocgA+YtWYtBxhVlQHKctxKFuKXv
         LXt0v7KddNQ0xLbJp2qN+HCtCa78b84YgCCUbutQaZaXuyATjjisrcyJUMov+JCVqslr
         +63z7pQzILaB2kGXvZ9gh3Q8ZzQmNG7fKFCj8CarVkf1GvTCXGKvosejAuYf2ou14kn8
         XunrbOuIpdQUabRL79KRzuXDmyYy/mJZKppyl7EOMFSVqcvnPP/RzQvkyTLAZldiuzEB
         TU/sF2Un3qp0dVcirjHFaSw94JSdFYVkv7htQFssVOjuEdrgWN5BtlM06Av5IHH+wksr
         vySg==
X-Gm-Message-State: APjAAAV4afrRLw7AFc3QkmSrxVzqg1xXi1LT1DW0iTf0BJi/gGY908pl
        BGMzEL+2IkYApKvoK23xANJxrcUA
X-Google-Smtp-Source: APXvYqwKEewd+BG6ZP8u24/ASQxYGdE9WoB34pL+/sPP8mY5reVfEpJzpirAsduVOUr/e+aNbglujw==
X-Received: by 2002:adf:e309:: with SMTP id b9mr3057084wrj.135.1559942636941;
        Fri, 07 Jun 2019 14:23:56 -0700 (PDT)
Received: from [192.168.1.17] (cki69.neoplus.adsl.tpnet.pl. [83.31.84.69])
        by smtp.gmail.com with ESMTPSA id 128sm3008402wme.12.2019.06.07.14.23.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Jun 2019 14:23:56 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: Add docs for EL15203000
To:     Oleh Kravchenko <oleg@kaa.org.ua>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org
References: <20190607184022.13793-1-oleg@kaa.org.ua>
 <b1f0eaf6-e91c-2095-5928-179ad8695b33@ti.com>
 <27c0b356-8111-6b36-23cc-8e654147178f@kaa.org.ua>
 <b6a5cc5e-74f1-d328-7a47-995670ba7aa7@ti.com>
 <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <2eba86cb-01be-c002-32d0-80ab2ab14f97@gmail.com>
Date:   Fri, 7 Jun 2019 23:23:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <adf5a755-c534-64c3-6e99-ba39ffea95e2@kaa.org.ua>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Oleh.

On 6/7/19 11:17 PM, Oleh Kravchenko wrote:
> Dan,
> 
> On 08.06.19 00:04, Dan Murphy wrote:
>> Oleh
>> But this is not really max_brightness now this is a feature and now
>> does not make sense in this context
>>>>
>>>> You may need to use something different for this property or expose
>>>> a file in the driver.
>>>>
>>>>
>>> Protocol for this board define 0x32 as brightness level.
>>> This behaviur needed to keep backward compatibity.
>>>
>>>
>> Backwards compatibility to what?
> With old/new boards.

You have in your driver the following:

+ * BRIGHTNESS	Can be 0x30 (OFF), 0x31 (ON).
+ * 		0x32 (Effect) can be used for 0x50 (leaking) and
+ * 		for 0x53 (blinking)

If your max-brightness DT property is to be used for controlling this,
then I don't see how it would be backward compatible with anything.

Clearly, you don't need max-brightness DT property at all.

For blinking you can use blink_set op. To be able to recommend
you anoptimal solution for the effect we would need more
details regarding its nature.

>> This is a new driver there should be no DT that has this compatible or
>> definition.
>>
>> I will let Rob ack or nack this node.
>>
>> Dan
>>
> 
> 

-- 
Best regards,
Jacek Anaszewski
