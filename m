Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6121F3E501F
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 01:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhHIXvH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 19:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbhHIXvH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Aug 2021 19:51:07 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE66CC0613D3;
        Mon,  9 Aug 2021 16:50:45 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id bi32so2328936oib.2;
        Mon, 09 Aug 2021 16:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CwKNOnnzAd5qosOD7HgKOb5hYzfIZY7Sz4p7lyYQkDQ=;
        b=Aw1PwLw9e6HEVLxXhk3SYCBTevOdoaIoFpu5z454kaPWRiGrPfArMajweYsgcLKbzk
         Imp4itmpEiA+3FGketSR7PifxV6klN1X7wdOV8tp5BICwZtSPUnkFUYUnhH/puiFckkW
         1owHYvHPyAoPARvslIafJjcn/4RIdhVJ0Bc32zc71tDqTV5oykqqsJOgtUfcqJitBWVL
         RghRsH8xnfUNvK2oQlex1pdgJooRD0CQeGSABCvcUkkILPupJIlrkitKO/7TGNzA/ZGH
         I6qV0Qvj260FojJGnK5wmkBtJSht0PHFoI81D06mAQCrIiQVUGxwBN0BD7p3xBiDmVeK
         z5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CwKNOnnzAd5qosOD7HgKOb5hYzfIZY7Sz4p7lyYQkDQ=;
        b=SY0FCAMT5ZBUDy+qJVPEXfoUlk91UISAgZ/A6gjFLXlAO5jCzJzQK+BuQ1H19Q/+wz
         7nuY0EEI02k87pBiKU3+WK+rdw6jbumbTo4GscoWzIodmOgUsY6YIDNngo5iIzO5ApG9
         HQWAIGf8HqbolfjFmIluKOVD8i1/EtKjvhzRNxzSYKI4wbd0oqMP9P6skI0yhlvUg67C
         JVwXO0LyH/VyIHNlbLvhdrIfR9BN/Drhp5geXSjkGina8EpwhTytcz2N6QdtBezKeRDn
         V6X3WrLg8n2m+s+JjSyrfWIcJZ50XtypAPIKa1MfvgciPshAmwbInVW43eudCXDHc3kn
         Xl4g==
X-Gm-Message-State: AOAM5320w90JMwN74L4oCO5Hlv3gG4ZVOB4qjMKUXHY0U6dix8yqs6PT
        DKDm7GzEPXRpkYbGekPzfbY=
X-Google-Smtp-Source: ABdhPJwKE8xFAwn77y6/BcbWHJp78SYbrn5U/bAujlBDwg0xzY5VcU7KrFg7wdPYJagRGaxULtF8Kw==
X-Received: by 2002:a05:6808:601:: with SMTP id y1mr16033359oih.27.1628553045406;
        Mon, 09 Aug 2021 16:50:45 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id u8sm496600oiw.52.2021.08.09.16.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 16:50:44 -0700 (PDT)
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, hch@lst.de
Cc:     pali@kernel.org, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, axboe@kernel.dk, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
 <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
 <20210810004331.0f0094a5@thinkpad>
From:   Ian Pilcher <arequipeno@gmail.com>
Message-ID: <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
Date:   Mon, 9 Aug 2021 18:50:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810004331.0f0094a5@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 8/9/21 5:43 PM, Marek Behún wrote:
> I confess that I am not very familiar with internal blkdev API.

It's mainly a matter of symbol visibility.  See this thread from a few
months ago:

   https://www.spinics.net/lists/linux-leds/msg18244.html

Now ... my code currently lives in block/, so there isn't actually
anything technically preventing it from iterating through the block
devices.

The reactions to Enzo's patch (which you can see in that thread) make me
think that anything that iterates through all block devices is likely to
be rejected, but maybe I'm reading too much into it.


Greg / Christoph -

(As you were the people who expressed disapproval of Enzo's patch to
export block_class and disk_type ...)

Can you weigh in on the acceptability of iterating through the block
devices (searching by name) from LED trigger code within the block
subsystem (i.e. no new symbols would need to be exported)?

This would allow the trigger to implement the sysfs API that Marek and
Pavel want.

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================
