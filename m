Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B052428B41
	for <lists+linux-leds@lfdr.de>; Thu, 23 May 2019 22:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387471AbfEWUHm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 May 2019 16:07:42 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40788 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387504AbfEWUHl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 May 2019 16:07:41 -0400
Received: by mail-lf1-f65.google.com with SMTP id h13so5318143lfc.7;
        Thu, 23 May 2019 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QfVXXvInpWGRG3+JwX1SknPbAFx966/86u+2yVF/INk=;
        b=oUh0mjqL39Dt/TUrmf1FzzYDzyClG1fvbWrK2baT/1VL+CFDYeZRr+yByDt+y4O5Tl
         rIgZ71AEyLByZIG8mlxDwnDaVVoPFShZPLiBk+Sfv3On8RToKlTG0tvashEDdfgoIsN4
         97Qb52wUVLPlr78MUgOdj9bIGz5vPyCpNrZWL940lRkdzkdgv9qkhxoPNdHqNn4REz5x
         ZdsfxeZ79x9KRFwmVw2z0Cc3BeqY2+SAoWigVLOA+4Td/Gm00GWZ9qyNMyqY/XwXc21r
         MRCbhzmxazA+IfY7EkQMfXJQIqc3quVOZE00PTrcg84/BGlMXRItZIYxQxnoBd94RrRo
         vdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QfVXXvInpWGRG3+JwX1SknPbAFx966/86u+2yVF/INk=;
        b=Wbf3Ac0j2tg5aai90EM0Ym1htsRP8lpEj4BRB5si6a4SJxjGDlvX6Ql3rZ8aYDo3sh
         apsyZM04AnO6G7J/bs4bDHda2E5QjWXwotBdVBExhSCn6ni2p+0z2ZuXvhnYP1jBCvYF
         Gi960PrdOq4E1WXCnnqd9Fka6MtDlP0ioVGc/wzKpZt5WtsJEgH+Ohv1dZ1i9Lr/3OWV
         whiBQrVpHkU8EmOKPHPwkEc/my4l1SUlzIL0SHQo3jjak9lei/W/pVhKXddZdno4CSyw
         UP5rUCZVhzx2pFrWuLfP4q7PZr45fA6SrS5EbYmze1mHe1ochzLR8lAPYFIk3BfFJ7QJ
         O/Zw==
X-Gm-Message-State: APjAAAWo/NSY7Ysh327eLxVLDaqM7ginUSuhf6TQgVEs/NdQsj+OHhN9
        MYyRuvqh2U7/UnIRkTuuJLqnoymY
X-Google-Smtp-Source: APXvYqwnZXCspGjC6DogAdICLKwqG874TZ1aQziH9gjkkNdl9fRNoo0GVig3krgTlTY4KGwj2z4AqQ==
X-Received: by 2002:a19:4f54:: with SMTP id a20mr47675662lfk.136.1558642058924;
        Thu, 23 May 2019 13:07:38 -0700 (PDT)
Received: from [192.168.1.17] (drp59.neoplus.adsl.tpnet.pl. [83.24.201.59])
        by smtp.gmail.com with ESMTPSA id o124sm101855lfe.92.2019.05.23.13.07.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2019 13:07:38 -0700 (PDT)
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell> <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
 <20190523083129.GH4574@dell>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e7f332a3-ce4b-a058-74b3-3dfd8bccfbc8@gmail.com>
Date:   Thu, 23 May 2019 22:07:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523083129.GH4574@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/23/19 10:31 AM, Lee Jones wrote:
> On Wed, 22 May 2019, Jacek Anaszewski wrote:
> 
>> On 5/22/19 7:42 AM, Lee Jones wrote:
>>> On Tue, 21 May 2019, Jacek Anaszewski wrote:
>>>
>>>> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>>>>
>>>>     Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>     git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/ti-lmu-led-drivers
>>>>
>>>> for you to fetch changes up to 13f5750a60b923d8f3f0e23902f2ece46dd733d7:
>>>>
>>>>     leds: lm36274: Introduce the TI LM36274 LED driver (2019-05-21 20:34:19 +0200)
>>>>
>>>> ----------------------------------------------------------------
>>>> TI LMU LED support rework and introduction of two new drivers
>>>> with DT bindings:
>>>>
>>>> - leds-lm3697 (entails additions to lm363x-regulator.c)
>>>> - leds-lm36274
>>>> ----------------------------------------------------------------
>>>> Dan Murphy (12):
>>>
>>>>         dt-bindings: mfd: LMU: Add the ramp up/down property
>>>>         dt-bindings: mfd: LMU: Add ti,brightness-resolution
>>>>         mfd: ti-lmu: Remove support for LM3697
>>>>         mfd: ti-lmu: Add LM36274 support to the ti-lmu
>>>
>>> These patches were Acked "for my own reference", which means I'd
>>> at least expect a discussion on how/where they would be applied.
>>>
>>> It's fine for them to go in via the LED tree in this instance and I do
>>> thank you for sending a PR.  Next time can we at least agree on the
>>> route-in though please?
>>
>> Usually ack from the colliding subsystem maintainer means he
>> acknowledges the patch and gives silent approval for merging
>> it via the other tree.
> 
> Usually the type of Ack you mention takes this form:
> 
>    Acked-by: Lee Jones <lee.jones@linaro.org>
> 
> However, the one I provided looks like this:
> 
>    For my own reference:
>      Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
> Which clearly says "for my own reference" and not to be taken as an
> indication that it's okay for the patch(es) to go in via another
> tree.
> 
>> This is the usual workflow e.g. in case of massive reworks
>> of commonly shared kernel APIs.
>>
>> Your Acked-for-MFD-by tag is not documented anywhere and I've just
>> found out about its exact meaning :-) Note also that it percolated
>> to the mainline git history probably because people mistakenly assumed
>> it was some new convention (despite that checkpatch.pl complains about
>> it). So far there are 12 occurrences thereof in git. I must admit that
>> I once unduly made my contribution to that mess.
> 
> Being MFD maintainer presents an uncommon and awkward scenario.  MFD
> is special in that it means we have to work more cross-subsystem than
> most (any?).  The default for MFD related patch-sets which traverse
> multiple subsystem is for them to go in via MFD with Acks from all the
> other maintainers.  I'm always happy to discuss different merge
> strategies, but using the MFD repo is the norm.
> 
> The Acked-*-by you see above came as a result of a conversation
> between myself and Maintainers I work with the most.  It was seen as
> the most succinct way of saying that the patch has been reviewed,
> whilst providing the least amount of confusion w.r.t. whether it's
> okay to be applied to another tree or not.  The "for my own reference"
> should be clear enough that I provide that tag for my own purposes,
> rather than an okay for others to merge it.
> 
>> Of course, now being taught about the exact meaning of the tag,
>> I will proceed accordingly.
> 
> I'd appreciate that, thank you.
> 
>> Regarding this one - please hold on for a while with pulling
>> the stuff, since we may have some updates from REGULATOR maintainers
>> (hopefully Acked-by).
> 
> I haven't pulled this yet, but please bear in mind ...
> 
> Once an immutable branch is created, it should never, ever change.  I
> think this is the second pull-request I've had from you [0] and the
> second one you've wanted to retract.  That should not happen!

This is life - it is always possible that some problems will be
detected in linux-next later in the cycle, either by bots or by other
people.

Some time ago I referred to Linus' message from 2017 discouraging
maintainers from cross-merging their trees, which you didn't find
applicable to existing MFD workflow.

Recently Linus put stress on that again [0].

At the occasion of the situation we have currently, I'd like to clarify
if cross-merges between MFD and other subsystems deserve special
treatment.

So please, if you find it reasonable to proceed with these immutable
branches workflow, I would first prefer to see Linus' approval for that.

> This is precisely why I usually find it better for patches to go in
> via the MFD tree.
> 
> [0] [GIT PULL] LM3532 backlight support improvements and relocation
> 

[0] https://lkml.org/lkml/2019/5/8/820

-- 
Best regards,
Jacek Anaszewski
