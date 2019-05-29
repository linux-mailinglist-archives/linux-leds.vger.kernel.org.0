Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87392E65D
	for <lists+linux-leds@lfdr.de>; Wed, 29 May 2019 22:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfE2UoH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 29 May 2019 16:44:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43704 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfE2UoG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 29 May 2019 16:44:06 -0400
Received: by mail-lf1-f68.google.com with SMTP id u27so3186661lfg.10;
        Wed, 29 May 2019 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XCwhuB4PQS6mTFsAoZhvJoDj+aOulw1jh2sHpi+VND8=;
        b=XJETKWcr1r5R6k2R3sMYZjPDslhzyyclI5F2iXx9+8Ap831nwUu/9TUfScoB6s1SYG
         Bqq+i1um+U4JmssIRLQ51RMtwvubCMePCnqj4rbFoUwS9KIojgIB0wjwJLGTkdMJ9Bv+
         /PPODPY2fpsuO6jcFgcNBJx/2kDC8xHhQtwfQ5fDpCZC8iFyZFon4SP6Ptc+6hPWqcyh
         IPPa2g3ndnEnl3+gU3zQ874EaaSkBL/6NaJZ9DTjcUDN054w9+FO6XjoVKapf2EfadAT
         VBo/QgE4L6NxnQaLEGCyGFVki9HtK5Qa2uJrdwELAIHwhzx+R4Y/aCqsdvh1lSqOVWqi
         uVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XCwhuB4PQS6mTFsAoZhvJoDj+aOulw1jh2sHpi+VND8=;
        b=C/H5WvH/GSPvYYpBRTrOT6R3YLpgdoJkEcyDZZ9O1dYcEWZ1hN2CRaT0qm0yHw+JVk
         iRVKYYF6RR9XWv7MbEZnsBb63K1Okc4etpddbqDbE5nhs611iUhNcvh5lRD4mK8205Ne
         1bQ2Z3EmKNnADGvK8IVQrUgGuaf5X+uIWaV1fb/fsWWVEIrGpq5sZYmIvBLluSWpW3Sv
         IZUrxEE55YKtkCkG04XgkwnVetJLrEr3UTa6bAcqj8IKL6XIw2dd4UdpxZwHBGm3Blh6
         8EmZtugwrwzKWrgZa3ud7i9+Nyxi4Pu1fx+N6bYTCS4NqJ7I7RdBP6cGvaFcGPvyo2tc
         N8kg==
X-Gm-Message-State: APjAAAXb4FOnzAnM1h7nHTAEB5lfgmgrndWW7hADBkO1H4TDySFPjVJO
        +IVZhbGkHrx1jaM9+NBPpS0=
X-Google-Smtp-Source: APXvYqy9DOplhsgA8vFtKyC/Hthz0tbjMABhG0P/YLyfcpfcZSf78VoQX1uq87aRucIBSc78g7OVUA==
X-Received: by 2002:ac2:4857:: with SMTP id 23mr15698494lfy.158.1559162644478;
        Wed, 29 May 2019 13:44:04 -0700 (PDT)
Received: from [192.168.1.17] (cjl105.neoplus.adsl.tpnet.pl. [83.31.61.105])
        by smtp.gmail.com with ESMTPSA id z11sm70326ljb.68.2019.05.29.13.44.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 13:44:03 -0700 (PDT)
Subject: Re: [GIT PULL] Immutable branch between LEDs, MFD and REGULATOR
To:     Mark Brown <broonie@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, lgirdwood@gmail.com
References: <20190521203038.31946-1-jacek.anaszewski@gmail.com>
 <20190522054256.GA4574@dell> <3492171a-bcdc-bee2-684c-e1029653a811@gmail.com>
 <20190523083129.GH4574@dell> <e7f332a3-ce4b-a058-74b3-3dfd8bccfbc8@gmail.com>
 <20190524115659.GC2456@sirena.org.uk>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d9fa3435-a942-b6e4-c510-e70c59deae61@gmail.com>
Date:   Wed, 29 May 2019 22:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524115659.GC2456@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I've just noticed gmail redirected this message to the Spam folder.
I will have to improve my filters to secure myself against that.

Sorry for late reply and maybe unnecessary escalation of the issue.

On 5/24/19 1:56 PM, Mark Brown wrote:
> On Thu, May 23, 2019 at 10:07:35PM +0200, Jacek Anaszewski wrote:
>> On 5/23/19 10:31 AM, Lee Jones wrote:
> 
>>> Once an immutable branch is created, it should never, ever change.  I
>>> think this is the second pull-request I've had from you [0] and the
>>> second one you've wanted to retract.  That should not happen!
> 
>> This is life - it is always possible that some problems will be
>> detected in linux-next later in the cycle, either by bots or by other
>> people.
> 
> If you've created an immutable branch that other people might have
> merged you should be doing incremental fixes on top of it and not
> changing it unless you've confirmed that nobody else merged it, that's
> the whole immutable thing.  If you rebase the commits are still going to
> be in other people's trees and will still end up getting merged which
> makes a mess.

That's obvious. I checked that the branch wasn't pulled to any of
the affected subsystems. Also double-checked it wasn't present
in linux-next at the time I was dropping the signed tag,
and updating the branch.

>> Some time ago I referred to Linus' message from 2017 discouraging
>> maintainers from cross-merging their trees, which you didn't find
>> applicable to existing MFD workflow.
> 
>> Recently Linus put stress on that again [0].
> 
> There's a difference between just grabbing someone's whole tree and
> pulling in a targetted topic branch with only specific overlapping
> stuff.  There's also no requirement on people to immediately merge
> such a topic branch, they can always just keep it on file until it
> does become important for dependencies.  A lot of the MFD cross tree
> merges are happening because constants introduced in the MFD tree
> become build dependencies for other trees.
> 
> Historically there were maintainers who just randomly merged people's
> entire trees which does cause lots of problems, this isn't that.
> 
>> So please, if you find it reasonable to proceed with these immutable
>> branches workflow, I would first prefer to see Linus' approval for that.
> 
> This is nothing new.

I just wanted to make sure. We will see if Linus will have something
to add.

-- 
Best regards,
Jacek Anaszewski
