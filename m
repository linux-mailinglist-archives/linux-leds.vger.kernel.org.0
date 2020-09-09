Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 993BF2637C3
	for <lists+linux-leds@lfdr.de>; Wed,  9 Sep 2020 22:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIIUry (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Sep 2020 16:47:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgIIUrw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Sep 2020 16:47:52 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A5FC061573;
        Wed,  9 Sep 2020 13:47:50 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a12so4035395eds.13;
        Wed, 09 Sep 2020 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=z9HWvpxl+f530kB5Zh2VUTorJ4C9dxFarjvlqPfFRz4=;
        b=C6jIXA8svVoRtfk0GwKhEQ13h7OwSPzeUf2mqlf33y9tl5528pwXhzaBjNX0iAU2N0
         /CkU75aXPQ0l25u9ERZJKIhx/YuyEfjOljHzslPvo54hm2Ewft8H8qKZ08krUZSsmqFH
         iwA5yALNhe/QKqcvLqr9Xllo5CqYuHTzSbve6nrWY27vOhZiRy4B7rXn/f3+BUmQwcZG
         OEuTWu2WsQLVZx+Z2r9cYkzs9bhNtJDf56UG5mrelQYCMEG54BEBjtEp0N6DB+SMaM/s
         X7GZ2gfet2Wysn4iotGb8uDTyUMcGeXbfnoDo9L7GR23SA5DFF2GJEEm+0N1PQAadMl/
         4vGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z9HWvpxl+f530kB5Zh2VUTorJ4C9dxFarjvlqPfFRz4=;
        b=VUR/gJdaWPAU8YuIR8TBfQKRqKfPt2Pu6r25NeIlGlMF1jeVRMlCaDHcW5bTHcfKE9
         kFCJrL2bi2W1gDDvInb5UsGqZuafaXWAr8yulvOXC4LvsUgW3lj3b64TQ2mSF6r/bR/Y
         1QJNl7A4vdzdPwb9eGB5aEqz5PhYYMn1IrJ3CLzCm9bRgXL4Zuv9PYbrS63zBYLCZSjR
         BP5oRydginD/WOz+6FqhiNIpRGES9OrRYxnwF/sFl0tcBLdT4saZ+Wi3jeW+e/JgqKU3
         6iEaRX4yPBZN3gAI9Lt3R7yBj2/8bzt7I6LNOAEA/rFFl2iVkfE2ZdKWeywQpF9uuKki
         eatA==
X-Gm-Message-State: AOAM532af4UlyQVwYKvcUtCxPwBC+2SlLGFBw3Ty5yC/f68xgtGEZKNE
        mZxZUGmVplJgNomq4ORNRos=
X-Google-Smtp-Source: ABdhPJyEY1UgPOtP/a2PRgsl0HpmQFPbkfvzcA/2l9pZII63Fcv7ryqmwLpEJOO2WAdNvkXtryN6Sg==
X-Received: by 2002:a05:6402:22fc:: with SMTP id dn28mr5770505edb.365.1599684469557;
        Wed, 09 Sep 2020 13:47:49 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:dd82:1be8:aced:e7a7? ([2a01:110f:b59:fd00:dd82:1be8:aced:e7a7])
        by smtp.gmail.com with ESMTPSA id n15sm3766242eja.26.2020.09.09.13.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 13:47:49 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: pwm: Allow automatic labels for DT based
 devices
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Alexander Dahl <ada@thorsis.com>
References: <20200907043459.2961-1-post@lespocky.de>
 <20200907043459.2961-2-post@lespocky.de> <20200909090736.GE10891@amd>
 <20200909202907.3z425uujvu532qxs@falbala.internal.home.lespocky.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <9e78d793-d0d5-737c-163e-30736c1c7bdf@gmail.com>
Date:   Wed, 9 Sep 2020 22:47:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200909202907.3z425uujvu532qxs@falbala.internal.home.lespocky.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On 9/9/20 10:29 PM, Alexander Dahl wrote:
> Hei hei,
> 
> On Wed, Sep 09, 2020 at 11:07:36AM +0200, Pavel Machek wrote:
>> Hi!
>>
>>>   	pwm_init_state(led_data->pwm, &led_data->pwmstate);
>>>   
>>> -	ret = devm_led_classdev_register(dev, &led_data->cdev);
>>> +	if (fwnode) {
>>> +		init_data.fwnode = fwnode;
>>> +		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
>>> +						     &init_data);
>>> +	} else {
>>> +		ret = devm_led_classdev_register(dev, &led_data->cdev);
>>> +	}
>>
>> Can you always use _ext version, even with null fwnode?
> 
> I did not try on real hardware, but from reading the code I would say
> the following would happen: led_classdev_register_ext() calls
> led_compose_name(parent, init_data, composed_name) which itself calls
> led_parse_fwnode_props(dev, fwnode, &props); that returns early due to
> fwnode==NULL without changing props, thus this stays as initialized
> with {}, so led_compose_name() would return -EINVAL which would let
> led_classdev_register_ext() fail, too.
> 
>> If not, can you fix the core to accept that? Having that conditional
>> in driver is ugly.
> 
> It is ugly, although the approach is inspired by the leds-gpio driver.
> I'll see if I can come up with a change to led-core, but I'm also open
> for suggestions. ;-)

devm_led_classdev_register() calls devm_led_classdev_register_ext()
with NULL passed in place of init_data, so you could do something like
below to achieve the same without touching LED core:

struct led_init_data init_data_impl = { .fwnode = fwnode };
struct led_init_data *init_data = NULL;

if (fwnode)
	init_data = &init_data_impl;

devm_led_classdev_register_ext(dev, &led_data->cdev, init_data);

> fyi: Peter Ujfalusi answered and would give his Ack to the changed
> dual license for the yaml file.  You can expect that for v4.
> 
> Stay tuned
> Alex
> 

-- 
Best regards,
Jacek Anaszewski
