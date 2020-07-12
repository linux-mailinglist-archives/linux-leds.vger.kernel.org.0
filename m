Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013FD21CA00
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 17:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728862AbgGLPb3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 11:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728859AbgGLPb2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 11:31:28 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D8FC061794;
        Sun, 12 Jul 2020 08:31:28 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id a1so3198609edt.10;
        Sun, 12 Jul 2020 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OC8AObzew9aqd3OWFgWAH1kVdGnLQeAxyBxr457j2LY=;
        b=W9J4LfgeIK144Btt0OSLh+fJulag+sR0kLYVE2lDrPCcBOy+ajXJWVer78aAUIWXJm
         oofzVCY/g/c/gg9L7RL8YWB5vwjwBb6JHnectBiFiftnAtRBVaH0Z2VRpRDjtEuHUTdh
         vK8n5T2Cx+UsODr9SKNHypR6Xr0c0Ag0Wj2AAHJqYUDysbMnQcj0Ov6Uk3ByOj0ap40Z
         +/WKwmJ26niqbmuQBFaEV5L+mDLruaLzYtKOTSc5Oo4+RYd730nm4/A8No/ibttfXSuy
         lYlcVXOnO1HsfuW7Fq9RkLTJanXT8XLxf7Nci3GZ9OyHBEAhiwGkFn5BQaN9Lj1j2YLg
         X2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OC8AObzew9aqd3OWFgWAH1kVdGnLQeAxyBxr457j2LY=;
        b=MjBPRbpwBrFmYsrw18Q73U4na5SLwUo+PM8rGTuUCPhcLgmYYFDvQ9Nq0ldAEyYvKs
         vGyZ+BCTG2xpvdqOxBRFqOR1z9DJD5QueCxEHhazbsJtC8ud391KDlbQF9MRu1/ZbS2W
         AjmLnyTvjLt70NIgKZneJI3gtLWowywrXQ7D8O2WQL5kxq4WOH92DOy5Qw48SEqLEHsm
         izdRh0OqksIPRTbQlXe74vZdF3TF28ZuuMGcXekQlRsLLMQ9doRqY1eqmnT8ab/e8XsV
         AOAG+eP9Czi7eZduTm05Bhrs9f0v0vJWGGtmtgiEsfO7izQxvq2jNAqJ/GUvGendVQ+o
         G0og==
X-Gm-Message-State: AOAM531ONvxDq2UI1W/oM9oQRe3Mev1nriU3FDubFtPXrAZ7kQMDcx8p
        k+jWk3gx/krz41awuHUOjBA=
X-Google-Smtp-Source: ABdhPJwJm7304izUL0IgGkG7yBGMirci+PY/YyegBIwPgXeaCR/OkgnpmwgdXrXRFn3RWKIOrW3fJw==
X-Received: by 2002:a50:f058:: with SMTP id u24mr87330213edl.351.1594567886745;
        Sun, 12 Jul 2020 08:31:26 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:cdeb:44e7:80ea:5ee2? ([2a01:110f:b59:fd00:cdeb:44e7:80ea:5ee2])
        by smtp.gmail.com with ESMTPSA id d5sm9570554eds.40.2020.07.12.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2020 08:31:26 -0700 (PDT)
Subject: Re: [PATCH v29 13/16] leds: lp5523: Update the lp5523 code to add
 multicolor brightness function
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, robh@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-14-dmurphy@ti.com> <20200711155749.GB22715@amd>
 <c9e20136-7226-2feb-b017-0a0742867f93@gmail.com>
 <20200711202419.GA18347@duo.ucw.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <e2a2fe12-b5e8-6a62-3dc3-f45019ade330@gmail.com>
Date:   Sun, 12 Jul 2020 17:31:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200711202419.GA18347@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 7/11/20 10:24 PM, Pavel Machek wrote:
> On Sat 2020-07-11 19:19:22, Jacek Anaszewski wrote:
>> On 7/11/20 5:57 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> Add the multicolor brightness call back to support the multicolor
>>>> framework.  This call back allows setting  brightness on grouped channels
>>>
>>> Extra space before "brightness".
>>
>> And before "This".
> 
> That one is intentional, I believe.
> 
> https://www.independent.co.uk/life-style/gadgets-and-tech/news/one-space-or-two-spaces-after-a-full-stop-scientists-have-finally-found-the-answer-a8337646.html
> 
> We are using fixed width fonts, so typewriter rules still apply here.

But see the article [0].
Also, in [1], in the section "Computer era" you can find opposite
examples in the modern systems.

And grep returns following numbers for kernel Documentation folder:

$ rgrep "[A-Za-z0-9]\.  " Documentation/ | wc -l
18449
$ rgrep "[A-Za-z0-9]\. " Documentation/ | wc -l
63067

I prefer single space but will not fight for that too hard.
Nonetheless, it would be good to use one style consistently,
since most files I've looked at had problem with that.

Both DT and LED documentation in this set is not consistent
in this regard as well.

[0] 
https://www.instructionalsolutions.com/blog/one-space-vs-two-after-period
[1] https://en.wikipedia.org/wiki/Sentence_spacing

-- 
Best regards,
Jacek Anaszewski
