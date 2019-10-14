Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B87CD62BC
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 14:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730805AbfJNMiz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 08:38:55 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35646 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfJNMiz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 08:38:55 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so19558103wrt.2
        for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2019 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n+yPkcAtfV0uGXnqQ5l9CgswhmsyO7bUGevjjjP7SsU=;
        b=A79ceiqRSzseaHRlZZLlXa96+PS5g04Icp7X8OBGCpMjSWZMKo6YOwikpLf6/jQBMq
         fy340S/jR7Y1jWTQSQRys1d9vDsClxwWH30JJz5a9caRijoVmFpl1tPG3AosuzVtp7rP
         fMzukJ6d4v08D6FyVMdnpj+QAw3XCZlpVVmVGKRK61gmLAKVd4ti+q8CWQQXv7obywCj
         06lRcOwuzTFo8oItdzoN8RpKOz2b8YkAtKrGvYtuBvBpWJx0wBnQCms/+f11dE23FDii
         VPYn6SrRQnKWrpVDmWTvuELG0ZI1jNBoKVhECHEeBhpUiP6PoKwYvoexLbVczKj1NYzt
         92NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n+yPkcAtfV0uGXnqQ5l9CgswhmsyO7bUGevjjjP7SsU=;
        b=fM/RyrGTxJm977Wjw2I5hED5rwdEa3kCvzvWkysbKTE/+/o8yMbvtXegf5daBfkk4n
         SpkAuCzCSTnoETO1lferU0Twn41tQ6Mdd15ztEV6q3zGLIz0zd51zrFsHmy4mKVvH+pg
         5b4xwmhpZ5qe/OLCJMn2loLBDSKnymIkagBoP59OgwQaWjhIIloj5lDvjZCnWkaTRNHu
         J0CkvetEv3zWTrBihFhVIeVJ0/96PDVeCSyq6/+Zx2cN4YugWKxRjj2G7VFoMf2nUD4s
         8iOCYJ7ZGyuKNQw0oVFk6I5emrnavd5n/MUaunpzkEv86SC1aqObFfr4c8ua7i48r/TI
         Ymbw==
X-Gm-Message-State: APjAAAWIKs13cXTfJLq7ymjNLLMuSN7ewNksDYpt7lkp1S7MXkNJcPYp
        7LFxFvdAzMAtbC6t9nsyEFfUyw==
X-Google-Smtp-Source: APXvYqwqbStCqYu3QLpfrXd2t39WhPUqXMhg7Pi5oJ3FT3qN/ojPYFC4TcXi10rFByzDts+Dg0rFdQ==
X-Received: by 2002:adf:ff87:: with SMTP id j7mr25395021wrr.360.1571056732536;
        Mon, 14 Oct 2019 05:38:52 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id c17sm21653738wrc.60.2019.10.14.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 05:38:51 -0700 (PDT)
Date:   Mon, 14 Oct 2019 13:38:49 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmurphy@ti.com, tomi.valkeinen@ti.com
Subject: Re: [PATCH v5 3/3] leds: Add control of the voltage/current
 regulator to the LED core
Message-ID: <20191014123849.fhvmqn7dyu6bminc@holly.lan>
References: <20190923102059.17818-1-jjhiblot@ti.com>
 <20190923102059.17818-4-jjhiblot@ti.com>
 <3e648fab-638f-4aa0-dda9-8ddba6562751@gmail.com>
 <20191013120937.GK5653@amd>
 <eb8c0df1-0d5b-11d0-9965-3192fa5675f3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb8c0df1-0d5b-11d0-9965-3192fa5675f3@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Oct 14, 2019 at 12:49:07PM +0200, Jean-Jacques Hiblot wrote:
> 
> On 13/10/2019 14:09, Pavel Machek wrote:
> > Hi!
> > 
> > > I must say I'm not a big fan of this change.
> > > It adds a bunch of code to the LED core and gives small
> > > functionality in a reward. It may also influence maximum
> > > software blinking rate, so I'd rather avoid calling
> > > regulator_enable/disable when timer trigger is set.
> > > 
> > > It will of course require more code.
> > > 
> > > Since AFAIR Pavel was original proponent of this change then
> > > I'd like to see his opinion before we move on to discussing
> > > possible improvements to this patch.
> > Was I?
> > 
> > Okay, this series looks quite confusing to me. First, 1/3 looks
> > "interesting" (would have to analyze it way more).
> > 
> > Second, 3/3... So we have a LED driver _and_ a regulator? So yes, the
> > chip driving a LED is usually ... voltage/current regulator. What is
> > second regulator doing there? Is that a common setup?
> 
> This is quite common with current-sink LED drivers.
> 
> The setup looks like this:
> 
> +-----------+
> |           |
> | Regulator |
> |           +------------------------+
> |           |                        |
> +-----------+                      __|__
>                                    \   /
>          +---------------------+    \ / led
>          |                     |     V
>          |    Led Driver       |   --+--
>          |                     |     |
>          |                     |     |
>          |                +----------+
>          |              \      |
>          |               \     |
>          |                +    |
>          |                |    |
>          +---------------------+
>                           |
>                        +--+--+
>                        ///////
> 
> 
> Only the regulator usually does not supply only one LED.

Given questions have been raised about the complexity of the change I
wondered whether, for a system with this topology, the regulator
could/should be enabled when the LED driver driver probes?


Daniel.
