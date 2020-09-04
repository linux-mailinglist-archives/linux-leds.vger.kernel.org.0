Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1978525E33E
	for <lists+linux-leds@lfdr.de>; Fri,  4 Sep 2020 23:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgIDVT7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Sep 2020 17:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbgIDVT5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Sep 2020 17:19:57 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A55C061244;
        Fri,  4 Sep 2020 14:19:56 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b12so7351401edz.11;
        Fri, 04 Sep 2020 14:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PmCaRLCTAG/kmWdD9xhmm1twB/GyQXRnE8I2Xt9164E=;
        b=rrD9KItVcJ9AekdtlqoWZ2hZqNXLPRZaWiQ225yVwNhEqIyDjOWbWynt90RPNzyv5W
         Fqd1SBLTp/Amd1lXCTTvnazqtSgTyppzQ93gG5X5rLI3v0cWOIVipZvrAlNwd2ntQGxX
         WMs7ouVjb5qdL+Qlgp/c8QkydNdOrYaxvMRb/QBSdwXPgKDBJyj5+ZCzxZjEGVZvEQ5U
         G42i0z+0EjTkr7kntkUKHRI540HzLiDPIBtfpsW4STgsqp5bhM6jIrwYwJ9+wrgQyA//
         NFn1MvyVmvMo4UdMkQHLYXIje4R4UfDwnTdfHxg4gnCrPwNH+h16Fbcoh4WufeiWkL4e
         oM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PmCaRLCTAG/kmWdD9xhmm1twB/GyQXRnE8I2Xt9164E=;
        b=cmMDx2PqKb0dC+dM6+y8s68n6tJG1rew81zrBi9svVthBpFVS4ahOu85PXkaKYnJyN
         cGYojbiITm/jgiLbD2KVuZgoY9VatPMbAjn5wvf714CsVhjsWZJcjOv+lDAdzj2b3iLa
         MR/lgt7tju+eFleqdEKKT6UhNFuf3QD0vnR6/Fv1BBvYqYc3LG8jRapZ+gyotaSQzoJZ
         4ghfsxG8Hrxbktt9RJ8OFtt0F669BnmKFgpJAqPzcFZ+i3385iVQzJAYCEfV371oShu2
         cTy6D0iah6M2/YXwSJzgyLabr93J5IjMwqu/MlH960wnwCWDld+o6Z7ZKeKW/AaJ11Sg
         qb6g==
X-Gm-Message-State: AOAM533JOGrLu1ROFhiOenlbZpQHp+hFxcqnh0osWga+a4diWTlwwjM4
        58Me88hjuslaprUGv/nHtJ2D7xdoRIM=
X-Google-Smtp-Source: ABdhPJw5J8mAeiucryvbiqHYLVez9Ru6Wea2Je6AD9XAo/09RuSwWCEsRk10VbvkXSmf4Dcn+GgRgg==
X-Received: by 2002:a50:8f44:: with SMTP id 62mr10764084edy.351.1599254393614;
        Fri, 04 Sep 2020 14:19:53 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:2cc7:8a97:41d3:d848? ([2a01:110f:b59:fd00:2cc7:8a97:41d3:d848])
        by smtp.gmail.com with ESMTPSA id v13sm7144750ejq.59.2020.09.04.14.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 14:19:53 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] leds: pwm: Make automatic labels work
To:     Alexander Dahl <ada@thorsis.com>, linux-leds@vger.kernel.org
Cc:     Alexander Dahl <post@lespocky.de>, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20200831210232.28052-1-post@lespocky.de>
 <a8f9068b-d78d-3ba5-6747-f79ed8e641bd@gmail.com> <2019500.FJf2EgCAKA@ada>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <107cc1b1-501c-4946-facf-a437c1dfbf7a@gmail.com>
Date:   Fri, 4 Sep 2020 23:19:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2019500.FJf2EgCAKA@ada>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alexander,

On 9/4/20 9:53 AM, Alexander Dahl wrote:
> Hi Jacek,
> 
> Am Dienstag, 1. September 2020, 23:08:09 CEST schrieb Jacek Anaszewski:
>> Hi Alexander,
>>
>> Thanks for the v2.
>>
>> On 8/31/20 11:02 PM, Alexander Dahl wrote:
>>> Hei hei,
>>>
>>> for leds-gpio you can use the properties 'function' and 'color' in the
>>> devicetree node and omit 'label', the label is constructed
>>> automatically.  This is a common feature supposed to be working for all
>>> LED drivers.  However it did not yet work for the 'leds-pwm' driver.
>>> This series fixes the driver and takes the opportunity to update the
>>> dt-bindings accordingly.
>>>
>>> v1: based on v5.9-rc2, backport on v5.4.59 tested and working
>>>
>>> v2: based on v5.9-rc3, added the dt-bindings update patch
>>>
>>> Greets
>>> Alex
>>>
>>> Alexander Dahl (2):
>>>     leds: pwm: Allow automatic labels for DT based devices
>>>     dt-bindings: leds: Convert pwm to yaml
>>>    
>>>    .../devicetree/bindings/leds/leds-pwm.txt     | 50 -----------
>>>    .../devicetree/bindings/leds/leds-pwm.yaml    | 85 +++++++++++++++++++
>>>    drivers/leds/leds-pwm.c                       |  9 +-
>>>    3 files changed, 93 insertions(+), 51 deletions(-)
>>>    delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
>>
>> For both patches:
>>
>> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> 
> I'd like to make a v3 and change the license of the .yaml file to "(GPL-2.0-
> only OR BSD-2-Clause)" as suggested by checkpatch and [1].  Can I keep your
> Acked-by for that?

Go ahead.

> Besides: those suggestions are obviously valid for new bindings.  What about
> old bindings (.txt), which had no explicit SPDX tag or license note before?
> What license would apply there?  Is the .yaml file technically new, when it
> was mostly just converted from .txt?

I don't know what was the rationale behind adding license to
DT bindings, probably Rob will be able to share some details.

Possibly the fact that DT examples can be now compile-tested
makes some difference here.

-- 
Best regards,
Jacek Anaszewski
