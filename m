Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA062D5497
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 08:27:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgLJH1c (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 02:27:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727277AbgLJH1c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 02:27:32 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0150C0613D6
        for <linux-leds@vger.kernel.org>; Wed,  9 Dec 2020 23:26:51 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id r4so2322815pls.11
        for <linux-leds@vger.kernel.org>; Wed, 09 Dec 2020 23:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=USRN4aJ9sEiwZlAROLtbHMelBYyYvpQx6lROZQiOzA8=;
        b=hkVuSfU9fqbO/mAIKd/SjkUpzsu9LuCmVTvEjmE/Py3Gxu9BhrTwFz8Pr7phiPwME5
         I5l1vc3ovDC+8Zx88mKIn/a2ohgNcKsM4J8Qkexm1IMYedSeItW7IJJMBmPhc6gl84N5
         LgWv3lU/X0pudSbkCTYKJBEoO5oGUae/jYYJfXbIXwTmj2QHYk1EltT0fWmmeIqgwwm5
         5YLN9aqp2esbW2IQIrWZVXLj9K1E60lY4Xqyu61ivLLkmeUwKggM3+iltgvpcJbBIg5c
         tAspDnaL4kU9RLD3tdHaaAL/Q77HXbeEOnTXnrbNAycFlKj0OmjZZJAQwwEImj79DXPs
         GqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=USRN4aJ9sEiwZlAROLtbHMelBYyYvpQx6lROZQiOzA8=;
        b=OQrSlh+zZ+IUfCvYCGdeTkjog3b4IUUMs2qrdu4nvQN4sX6V1QFt8HlJZXZIE4RNi9
         QUkqTuKsFtynMZV1YXUBqrxTUgagVFLjhc2NBNj+RB3+jHSyfBLQMXcWclChhZ43Mif3
         j5h3wiBBFn2byzhwXoPjHdfvQ+QylsOjbBDPCa/4IFcHflV+jx3FkW97Q2gFPSCJgA0M
         fUPREQQnCfPJU1MQ+dSxTT42UJkuOee6r+LcKJiaW6R1huhcRX+Lus9DqdG3yH7lS8If
         jtsoGXVsglvBqpVCnuWshMsdDMcQKHSs2AJet8UHhGKAZ4+SYLvwqXjwEZnqwYP1LtMA
         AKqg==
X-Gm-Message-State: AOAM530W5xSc+2ls4ZpyErq6TG56XABQGL7/spxJeslAm/96vj/otrJV
        E3VAeREdCEum7KuCIRoPDC6OgC0dmp9R
X-Google-Smtp-Source: ABdhPJzPTDQurAJCyHKdzr+BPaiXOBf9afAP4bocl6Le0+PDarDPhWFOXRbIlzSYHzuqW55uliX8+g==
X-Received: by 2002:a17:902:bd01:b029:da:5bec:9ca2 with SMTP id p1-20020a170902bd01b02900da5bec9ca2mr5671698pls.62.1607585210950;
        Wed, 09 Dec 2020 23:26:50 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id gk4sm1838451pjb.57.2020.12.09.23.26.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 23:26:50 -0800 (PST)
Date:   Thu, 10 Dec 2020 12:56:44 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: Document commonly used LED triggers
Message-ID: <20201210072644.GB24867@work>
References: <20201210061431.23144-1-manivannan.sadhasivam@linaro.org>
 <a1dde00a-3b39-51c5-b15a-d9cd56ba969c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1dde00a-3b39-51c5-b15a-d9cd56ba969c@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Dec 10, 2020 at 02:57:09PM +0800, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/12/10 14:14, Manivannan Sadhasivam wrote:
> > This commit documents the LED triggers used commonly in the SoCs. Not
> > all triggers are documented as some of them are very application specific.
> > Most of the triggers documented here are currently used in devicetrees
> > of many SoCs.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../devicetree/bindings/leds/common.yaml      | 72 ++++++++++++++-----
> >  1 file changed, 54 insertions(+), 18 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> > index f1211e7045f1..eee4eb7a4535 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -79,24 +79,60 @@ properties:
> >        the LED.
> >      $ref: /schemas/types.yaml#definitions/string
> >  
> > -    enum:
> > -        # LED will act as a back-light, controlled by the framebuffer system
> > -      - backlight
> > -        # LED will turn on (but for leds-gpio see "default-state" property in
> > -        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> > -      - default-on
> > -        # LED "double" flashes at a load average based rate
> > -      - heartbeat
> > -        # LED indicates disk activity
> > -      - disk-activity
> > -        # LED indicates IDE disk activity (deprecated), in new implementations
> > -        # use "disk-activity"
> > -      - ide-disk
> > -        # LED flashes at a fixed, configurable rate
> > -      - timer
> > -        # LED alters the brightness for the specified duration with one software
> > -        # timer (requires "led-pattern" property)
> > -      - pattern
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +                # LED will act as a back-light, controlled by the framebuffer system
> > +              - backlight
> > +                # LED will turn on (but for leds-gpio see "default-state" property in
> > +                # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> > +              - default-on
> > +                # LED "double" flashes at a load average based rate
> > +              - heartbeat
> > +                # LED indicates disk activity
> > +              - disk-activity
> > +                # LED indicates IDE disk activity (deprecated), in new implementations
> > +                # use "disk-activity"
> > +              - ide-disk
> > +                # LED flashes at a fixed, configurable rate
> > +              - timer
> > +                # LED alters the brightness for the specified duration with one software
> > +                # timer (requires "led-pattern" property)
> > +              - pattern
> > +                # LED indicates camera flash state
> > +              - flash
> > +                # LED indicates camera torch state
> > +              - torch
> > +                # LED indicates audio mute state
> > +              - audio-mute
> > +                # LED indicates mic mute state
> > +              - audio-micmute
> > +                # LED indicates bluetooth power state
> > +              - bluetooth-power
> > +                # LED indicates USB gadget activity
> > +              - usb-gadget
> > +                # LED indicates USB host activity
> > +              - usb-host
> > +                # LED indicates MTD memory activity
> > +              - mtd
> > +                # LED indicates NAND memory activity (deprecated),
> > +                # in new implementations use "mtd"
> > +              - nand-disk
> > +                # LED indicates disk read activity
> > +              - disk-read
> > +                # LED indicates disk write activity
> > +              - disk-write
> > +                # No trigger assigned to the LED. This is the default mode
> > +                # if trigger is absent
> > +              - none
> > +                # LED indicates activity of all CPUs
> > +              - cpu
> The triggers phy0tx and hci0-power are missed.
> 

Yes, I just reworked my previous patch. Will add them.

> Since you've rewritten it, please consider sorting these property strings
> in ascending alphabetical order.
> 

Makes sense!

> > +      - items:
> > +            # LED indicates activity of [N]th CPU
> > +          - pattern: "^cpu[0-9][0-9]$"
> should be ^cpu[0-9]{1,2}$, otherwise, it always requires two digit.
>

Aww... Yes. Will fix it.

> > +      - items:
> > +            # LED indicates [N]th MMC storage activity
> > +          - pattern: '^mmc[0-9][0-9]$'
> should be '^mmc[0-9]{1,2}$'
> 
> Why CPU use "", and mmc use ''，It's better to keep them consistent.
> 

Sure.

Thanks,
Mani

> >  
> >    led-pattern:
> >      description: |
> > 
> 
