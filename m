Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2185E2CEFD
	for <lists+linux-leds@lfdr.de>; Tue, 28 May 2019 20:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfE1Szg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 May 2019 14:55:36 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34123 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfE1Szg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 May 2019 14:55:36 -0400
Received: by mail-lj1-f193.google.com with SMTP id j24so18754852ljg.1;
        Tue, 28 May 2019 11:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z7OOVvI8Ey+rnG7udPCtpGE+elQQfpsLoYRPaWdaqvo=;
        b=sZnZ12hgMrnbJJiyGJxwjDn8ZGRsO5eLpJZLeiFCbMilukST9exCPSOrckih25w1cZ
         yNR4yCjnJX7bzsLnoe5l+54xRd/uMe43ufc+t4NL5JaLF2DzyTe5XKJhDZodeGi/Qnlr
         /7FDFgGROff3N/3ui3bRFPydof7LMNZd83vdpjbZRCUJIdb36xqyOp0pSefcfQ19yKZ+
         NbruhAdAj0SzwJHz3T61vwqsqas27A2PPAGCL6hzYzf3zg8/xBZoZ6bmO4FJ5I4fxoVD
         nkt65Hto6wJ664T/Sv/820JLn4jVABFqlLAi8UsbhffWPquPzuEjZ0Z+OTfdY0/rcDdN
         Qwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z7OOVvI8Ey+rnG7udPCtpGE+elQQfpsLoYRPaWdaqvo=;
        b=cDDLBLPwzASbpL4U4YiNgjFE8aJq4lMaYrtkSNRFvzHNBuMp9m8+Xq/1u/z7LufFbN
         yuRpKjYvaRZHORcZgLJ/8Jgdp7oJrb3eJqKRxxO63dTGd77DsSbmylkW0iX5eQJWrPng
         gOcjbvATKgDJel3c0OyJjzBL9AHgBad/vF1RFYU0MfKrpiX/H2j4v9B0JzA0zhiuHqDm
         pi0cSxsLoB3NZB+/DNRUjDe+Z04jcYK6+E8a4vBM7WzDvt04r0bNBOhzhyLk4fhrpY5B
         IUvYWFwKqISO8gK/FaxvC5JHZPEDw3uSrRB6MMiT1bTh2RDskdtR3pFSDdRlYq+WNKxu
         xxtQ==
X-Gm-Message-State: APjAAAXr2RfgGz1hLcbQmLpTzUuI4u+9CfqQukmFvxZTeNjw4Vd2W2we
        lCn+2x75ZCQWNAxspZ7O/ia/7sHj
X-Google-Smtp-Source: APXvYqwxeXuHx774Ybt8+VVCDljiDWR6aiH7KirjGQj3/ICiJnH7lMaxFST4KELexMRLZu14zE8Wpw==
X-Received: by 2002:a2e:9742:: with SMTP id f2mr32429404ljj.184.1559069734544;
        Tue, 28 May 2019 11:55:34 -0700 (PDT)
Received: from [192.168.1.17] (cis152.neoplus.adsl.tpnet.pl. [83.31.42.152])
        by smtp.gmail.com with ESMTPSA id x16sm3071055lji.3.2019.05.28.11.55.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 11:55:33 -0700 (PDT)
Subject: cross-merges with MFD tree (was: Re: GFS2: Pull Request)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>
References: <CAHc6FU5Yd9EVju+kY8228n-Ccm7F2ZBRJUbesT-HYsy2YjKc_w@mail.gmail.com>
 <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <61f6987a-5502-f119-6595-fc6badb864fb@gmail.com>
Date:   Tue, 28 May 2019 20:55:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wj_L9d8P0Kmtb5f4wudm=KGZ5z0ijJ-NxTY-CcNcNDP5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

On 5/8/19 7:55 PM, Linus Torvalds wrote:
> On Wed, May 8, 2019 at 4:49 AM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>>
>> There was a conflict with commit 2b070cfe582b ("block: remove the i
>> argument to bio_for_each_segment_all") on Jens's block layer changes
>> which you've already merged. I've resolved that by merging those block
>> layer changes; please let me know if you want this done differently.
> 
> PLEASE.
> 
> I say this to somebody pretty much every single merge window: don't do
> merges for me.
> 
> You are actually just hurting, not helping. I want to know what the
> conflicts are, not by being told after-the-fact, but by just seeing
> them and resolving them.
> 
> Yes, I like being _warned_ ahead of time - partly just as a heads up
> to me, but partly also to show that the maintainers are aware of the
> notifications from linux-next, and that linux-next is working as
> intended, and people aren't just ignoring what it reports.
> 
> But I do *NOT* want to see maintainers cross-merging each others trees.

I would like to clarify if this applies to immutable integration
branches that are usually created for MFD subsystem. That subsystem
is somehow specific since changes made to MFD drivers are often a part
of bigger patch sets that add drivers of MFD cells to the other
subsystems.

Like in my area of interest an addition of a driver for LED cell
of MFD device must be followed by addition of a corresponding entry to
struct mfd_cell array in the related MFD driver.

And sometimes even another subsystem is involved, like e.g. regulator
framework in case of recent extension of ti-lmu driver.

So far you haven't complained about this specific workflow, but I'd like
to make sure how you see it.

-- 
Best regards,
Jacek Anaszewski
