Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B6E40B476
	for <lists+linux-leds@lfdr.de>; Tue, 14 Sep 2021 18:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhINQX6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 12:23:58 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:43791 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhINQX5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 12:23:57 -0400
Received: by mail-ot1-f51.google.com with SMTP id x10-20020a056830408a00b004f26cead745so19261565ott.10;
        Tue, 14 Sep 2021 09:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ELcDPKJa1WqjIjHIohEd4xcW4UCoHGlmNfR9X3tKCTg=;
        b=RbIsV306p6VJp7xCtWsLY/hX1h/VweRtmmkb4uMQqm3/8QE1JAwQITGzBLX4BT0Tgm
         vx8n02vR4k+Fu6bR3nlDb2qJqvVlWJ5Ye4IxXpItzgIDNZJWcW3FY8XLmTbiPwScbgWq
         aW/FhJ9J+kmWwMzML6ZQvDLzFHq1N8ZiYkRFvCkKYQXpr4GbHLJeiOj9ShRArb/LHT5t
         H9CILK8silz/V7JJtcQ8ojGCbZjAIRkcNtejOrGgmRZsAmKjFbf+Wp36l6kV5rCksssl
         kTUUqnzhfQRMguROpmSK3tRuSvenZ/3dYRvBccrqRj4D8QJ20iMfeANMVFDPTzOdkjUT
         f5nQ==
X-Gm-Message-State: AOAM532xVsus8UsIDN+WZWGxu7uOGEFmBy+hL+xhhkW3NQzabPzHnBEu
        jZF59mj/Pt3G5KOfIFj6tw==
X-Google-Smtp-Source: ABdhPJx9tiukj074D2L64vCKyJvg7rExXu5ryDjVuvb6hck/1tQT1ViBfr9195nKNOWbxgUtyPokxA==
X-Received: by 2002:a9d:36d:: with SMTP id 100mr15545952otv.237.1631636559607;
        Tue, 14 Sep 2021 09:22:39 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r20sm2704219oot.16.2021.09.14.09.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 09:22:37 -0700 (PDT)
Received: (nullmailer pid 3503731 invoked by uid 1000);
        Tue, 14 Sep 2021 16:22:36 -0000
Date:   Tue, 14 Sep 2021 11:22:36 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: leds: Convert register-bit-led
 binding to DT schema
Message-ID: <YUDMTGdFOOn2eZET@robh.at.kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
 <20210913192816.1225025-2-robh@kernel.org>
 <CACRpkdZX6_rBEpScxSjmiBQr_cCY9mSipm-a5B8nFRLJVBqXaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZX6_rBEpScxSjmiBQr_cCY9mSipm-a5B8nFRLJVBqXaw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 14, 2021 at 12:41:31AM +0200, Linus Walleij wrote:
> On Mon, Sep 13, 2021 at 9:28 PM Rob Herring <robh@kernel.org> wrote:
> 
> > Convert the register-bit-led binding to DT schema format.
> >
> > As the example just repeats nearly identical nodes, trim it down to a
> > few nodes and use some documented values for 'linux,default-trigger'.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Pavel Machek <pavel@ucw.cz>
> > Cc: linux-leds@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Thanks for doing this!
> 
> > v2:
> >  - Drop undocumented linux,default-trigger values
> 
> Will this lead to warnings? People tend to want to use these.

Yes. The list for linux,default-trigger was purposely limited rather 
than just throw in all the occurrences we could find. It's kind of a 
mess with similar or overlapping names.

There's other and better ways to do this now. There's the 'function' 
property and you can link to another device. 

> 
> (Possibly we could actually create operating-system independent
> triggers that make sense on any system. But it's another can
> of worms we don't need to open today.)
> 
> > +    enum:
> > +      [ 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80, 0x100, 0x200, 0x400, 0x800,
> > +        0x1000, 0x2000, 0x4000, 0x8000, 0x10000, 0x20000, 0x40000, 0x80000,
> > +        0x100000, 0x200000, 0x400000, 0x800000, 0x1000000, 0x2000000, 0x4000000,
> > +        0x8000000, 0x10000000, 0x20000000, 0x40000000, 0x80000000 ]
> 
> That's an interesting looking enum :D
> 
> But I can't think of anything better, so:

We could define our own type, but I can't say I recall the need for this 
elsewhere.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks.

Rob
