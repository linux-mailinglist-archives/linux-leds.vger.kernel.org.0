Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90EA22E661
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 22:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfE2Uoq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 16:44:46 -0400
Received: from mail-lf1-f45.google.com ([209.85.167.45]:39589 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2Uop (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 16:44:45 -0400
Received: by mail-lf1-f45.google.com with SMTP id f1so3195711lfl.6;
        Wed, 29 May 2019 13:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UtEQugnVA8WtRWp7G7Y45aQVnDBb1kJS56ouDNRrh18=;
        b=q68ON5flGUjwdqu0F8r+qQMqmf038cqqfksP/N5sHNqPExIALVbQNkpQljV0pOvj+P
         PbsYh3RkgIU6LhRpmq6KVTKqnBXuN+H9caVvJJqiHGOoN7SiOD99z4UOdK7noXhynS11
         cQdZ5A7FbyRnsGRRyHuJx/GPJFzlZbI741NhDyEiOuCeEZZQ0a7l3LcqCPVDAeIKNyX8
         yaTYEsNocpvbsOCz33zZjSmDckyfjTyvHDuJEk9i9YBg1e4mDMSdGejwYBf3RmO8+CCj
         k3pMU4PNkFVQaMxgggaVOm7WuRo/VTWM0p0D/Br4To725r+W6ymLstIu3On1DTQKUPBl
         E0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UtEQugnVA8WtRWp7G7Y45aQVnDBb1kJS56ouDNRrh18=;
        b=aaF136lIPdItn6e1C5G0NsgxAJSxuD6udgmR01E6/OFkSq89Xhc4Esx/sKuqGRRZNJ
         vLHTsAhzyJpDbQwYfxoaGFSGcBWG1RXhcGHu3jhWrcQisE9ijMTjO+A6rVrQy6bBquVt
         vJowJo9aXe7lpmBdo5YcyF8jveRk/04592vF3ZKnHkGZ6znxNHQX3a3DkuPJqV3lNT26
         WZLsiHdftmGC7zgDtLK1lylsiNoaRH1Ue8mqlk4bnOBqWB1g/vdjj81epGhSiAuHggwe
         ecK2KGRVGQL1aLoRSx1Q7PjOrAvuCQ5LefhvLEC79f9PiETWwsLcQ97CpbJG6i3Obe7F
         EHbg==
X-Gm-Message-State: APjAAAWtjNAlrtTbeY94JcB2Dqc3DsBn6czY/vKYZZ5/a3Z+kMfadBMI
        0Rub0E8APjojUKaWEsbm6/jf+LWU
X-Google-Smtp-Source: APXvYqwvvzLIvZZEdeOl/8+MNYp3TSxul95xS02f3pliLRcSOlBqgL4imye69ReCebWH9sRbN2fmMg==
X-Received: by 2002:ac2:4313:: with SMTP id l19mr20557763lfh.124.1559162681699;
        Wed, 29 May 2019 13:44:41 -0700 (PDT)
Received: from [192.168.1.17] (cjl105.neoplus.adsl.tpnet.pl. [83.31.61.105])
        by smtp.gmail.com with ESMTPSA id y19sm113495lfl.40.2019.05.29.13.44.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 13:44:41 -0700 (PDT)
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        lee.jones@linaro.org, lgirdwood@gmail.com
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190521211504.GD1580@sirena.org.uk>
 <0340dce2-87fb-938d-615e-376e29f37b54@gmail.com>
 <20190522190225.GH8582@sirena.org.uk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5589b6b4-2bbc-a0ef-9c9f-a3ec161b773b@gmail.com>
Date:   Wed, 29 May 2019 22:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190522190225.GH8582@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/22/19 9:02 PM, Mark Brown wrote:
> On Wed, May 22, 2019 at 08:27:32PM +0200, Jacek Anaszewski wrote:
>> On 5/21/19 11:15 PM, Mark Brown wrote:
>>> On Tue, May 21, 2019 at 10:30:38PM +0200, Jacek Anaszewski wrote:
> 
>>>>         regulator: lm363x: Make the gpio register enable flexible
>>>>         regulator: lm363x: Add support for LM36274
> 
>>> Why have these been applied, I haven't reviewed them?  As far as I can
>>> tell they were sent before the merge window so I'd expect a resend at
>>> this point...
> 
>> The patch set have been floating around for some time and besides
> 
> Most of that time as far as I can tell they weren't being posted to
> subsystem maintainers, you can't expect people to be aware of patches
> that they are not being sent and single postings get missed or dropped
> for all sorts of reasons.
> 
>> the v2 you were cc'ed by Dan, I also poked you a week ago for v4 [1].
> 
> That post from a week ago was you copying me into a thread I wasn't CCed
> on saying I should have been sent the patches.  My expectation would
> therefore be that someone would send me the patches, I'm obviously going
> to prioritize patches that actually get sent to me over ones where I
> have to go searching to try to turn up copies.

I admit I should have CC'ed you the exact patches and not only
the cover letter.

>> Don't be surprised that I assumed you simply don't care.
> 
> You have unreasonable expectations here.  At the very least I would have
> expected something along the lines of "hey, you don't seem to have
> looked at these" before you just applied things, and ideally ensuring
> that the patches had actually been sent to everyone with a reasonable
> lead time so there was a good chance that review could happen.

In fact you were notified only of v2 of the patch set AFAICS.
There is indeed a chance it might have gone unnoticed through
your mailbox (or classified otherwise).

I need to be more wary in such cases in the future.

>> Still, we're awaiting your comments
> 
> If someone sends me the patches...
> 
>> [0] https://lkml.org/lkml/2019/4/10/547
>> [1] https://lkml.org/lkml/2019/5/14/717

-- 
Best regards,
Jacek Anaszewski
