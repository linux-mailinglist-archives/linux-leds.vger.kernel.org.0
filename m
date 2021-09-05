Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F16240106E
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 16:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbhIEO6D (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 10:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbhIEO6C (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 5 Sep 2021 10:58:02 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA3FC061575;
        Sun,  5 Sep 2021 07:56:59 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso5382176otv.12;
        Sun, 05 Sep 2021 07:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p1koCNCRqSxKEpGOobMjlE5KAqPncevVPd/7SQsEJxs=;
        b=AvM+tHpoICjy+A621vXSAVOfNjqJvikB6z/ob5s3JozSv6GiFYPhgQDaYp55tq4Ndq
         KbHLiqbozEAA7RNCoj1okVa9pHCYXqjP+kHkplF4s4suDF7cmTn/qpDhwZpBzBULXCHD
         SGQC1ABEO4arkZpmeNQTwST0pP8PZVA3obmrUMGIb51HuWOWdF/AwRsofwCgL2SbSAA6
         RCDSHPhJsTLyLBUAlOKuRGOZj6C3Syf58DXlFnoPZxn+B5dev751aCKyW+SQmfSbgMI1
         GjAtqCZIEhtLzQm9+jFbRLQ1fFaYI6DJhxVZK5Ah4uY7csevFHefuAWhyaBag/uMsnVn
         e63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p1koCNCRqSxKEpGOobMjlE5KAqPncevVPd/7SQsEJxs=;
        b=l7zjD6mJANCB1AhiI7OAq0S0aG4Vjdu+DGstIPEuK6txoWEasHu4ecm/9hk2xrbFk8
         zCPeI1DOF76gztgR6Ay/1L2O3DEULvF1M7VfBH8TrJdlgpH/cjcW5L/qRQST++HWLKMW
         3mMG8mcsB/TKBXJbIinuDKZWBEFdmWmiuAqUKxhdxFF+BXtMpR2KbDo8VbXYj6a6ExRJ
         LBOj2LT+5FOzVkT9pvIbXbGvT5WJrGEeQ4uy0BW8cXul/ihekeATxFLTpeb2h5HbhlQp
         1lLPE4ESHK7GPNLHIXGhh6XXQoXWIwKU5i37bQxgo70ZM8EescjX1oaN3b8jToPyXVu2
         2Ezg==
X-Gm-Message-State: AOAM532f00kY/quacp5DjysIH/xvfMyIkdnGC0a9IZYISEIJlniG8ce2
        ziu1QK5cXVR7KKD8qlIHdNU=
X-Google-Smtp-Source: ABdhPJxdxDTL3InABj22niqvBFhy3V2CswCUI/MILjdGUBchW8aAFJu8Sw0OEDhV7NlcMxkm8nizYQ==
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr7520677otn.5.1630853818896;
        Sun, 05 Sep 2021 07:56:58 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id r25sm998826oic.13.2021.09.05.07.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 07:56:58 -0700 (PDT)
Subject: Re: [PATCH 09/18] ledtrig-blkdev: Periodically check devices for
 activity & blink LEDs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-10-arequipeno@gmail.com> <YTMLxdQ3TFKPN+WH@kroah.com>
 <8b0a2244-d81c-1099-927f-cfe9b04a4285@gmail.com> <YTTZiBWz0Rc7+IGZ@kroah.com>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <cf19e61d-97a6-1463-3072-d3527d8a1e3a@gmail.com>
Date:   Sun, 5 Sep 2021 09:56:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTTZiBWz0Rc7+IGZ@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 9/5/21 9:51 AM, Greg KH wrote:
> On Sun, Sep 05, 2021 at 09:39:57AM -0500, Ian Pilcher wrote:
>> On 9/4/21 1:01 AM, Greg KH wrote:
>>> Please never use WARN_ON() in new code unless the machine is really
>>> broken and you can not do anything else here.
>>
>> Wait what?  I thought that was BUG_ON.
> 
> Not whan panic-on-warn is set, which is getting more and more common
> these days.

Fair enough.  What is the recommend approach to reporting a "this should
never" happen situation these days?

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
