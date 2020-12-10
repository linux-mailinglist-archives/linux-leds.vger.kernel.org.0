Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D4E52D53C0
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733192AbgLJGXL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733277AbgLJGWh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:22:37 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C39AC061793
        for <linux-leds@vger.kernel.org>; Wed,  9 Dec 2020 22:21:57 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id b26so3081425pfi.3
        for <linux-leds@vger.kernel.org>; Wed, 09 Dec 2020 22:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=NuismVZ4PrSdwp2DMCZD56Vg7x75UKlPw/nhIYGOfUM=;
        b=DBUQSef+F/ShCuziTzEd++xuwZ+wWAMZvdB3xZmTKewyemy6cgS17H/Wbr0xXu4GuJ
         R+hxiBaKYCg2Y2ue5XRgiILVM/01eT8WE1Ur2vuBrBgYibF15NmrHtee7l8vP3k5cN25
         0/pm4l4AyiOZvu0D1ft0Jopz1WlU9B3oRzQmaVwErw5N4EtzDTABoM4YveBIkw3IIty1
         bA7fY+AU5G5jNbdLM0EpO8S9S8QA3V1i+U3lFhr3+lxnVCbAm280k7S0cxiWLKXVpOsw
         NevKR42PYd+fNErmQBGZblNqMruJlTgEfayTrDBLhoGth+D6+av+Ze21U8xj7HmHUenO
         lNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NuismVZ4PrSdwp2DMCZD56Vg7x75UKlPw/nhIYGOfUM=;
        b=jS3l/EpRPbI4u8x6jCZpot5MelB6bprSWR4qLdRS6elNjJjSd5kTj+V3UKZdKPNsil
         a+RqTzS9Fbaeg8jXZqHZXVlDC6dcxPDDcDRDAzQvr4lOqSLYFsiFy2cPB8EKMPVcIoLR
         /39Sier2a1rWb5MvlPRodf76HYw129FDUCS8b83+Aifvi4X6s80H2/FzcrQXmpb6r73Q
         sTZMT/EdaIy8FI31j65/t4isa1GKn3tuH2ap+LPqWCIHMV5gLogZC06m7HtUfjRE1s7j
         dR0vb+/CLfPj7fEE3bjU0enjnQRqfYgpu7erWQ6e3XH8vVX6uKiznaMDdlbwBHrBiqHv
         q2tQ==
X-Gm-Message-State: AOAM530df58T3fNoBfyPsTE3mMWLQQ+lVC5DROz4nbPH45ONqlVFHNRO
        rw0WwhMNEnh3xylo0CErMbNQxvKVY2YI
X-Google-Smtp-Source: ABdhPJyYrQ6chu6zPDYEq3yrD1lw04Ln2yRldRTh6g+qWim4T69F+f0ZVW0nJPnnTExkYFhg6SEHpg==
X-Received: by 2002:a17:90b:3698:: with SMTP id mj24mr5739733pjb.149.1607581316615;
        Wed, 09 Dec 2020 22:21:56 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id i2sm4588909pjd.21.2020.12.09.22.21.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 22:21:56 -0800 (PST)
Date:   Thu, 10 Dec 2020 11:51:47 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-leds <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Darshak Patel <darshak.patel@einfochips.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Guodong Xu <guodong.xu@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/1] dt-bindings: leds: add onboard LED triggers of
 96Boards
Message-ID: <20201210062147.GA24867@work>
References: <20201210031203.1901-1-thunder.leizhen@huawei.com>
 <20201210033157.GA6466@thinkpad>
 <704f703c-7ed9-6302-60df-7708d0633af0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <704f703c-7ed9-6302-60df-7708d0633af0@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Dec 10, 2020 at 02:14:57PM +0800, Leizhen (ThunderTown) wrote:
> 
> 
> On 2020/12/10 11:31, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > On Thu, Dec 10, 2020 at 11:12:03AM +0800, Zhen Lei wrote:
> >> For all 96Boards, the following standard is used for onboard LEDs.
> >>
> >> green:user1  default-trigger: heartbeat
> >> green:user2  default-trigger: mmc0/disk-activity(onboard-storage)
> >> green:user3  default-trigger: mmc1 (SD-card)
> >> green:user4  default-trigger: none, panic-indicator
> >> yellow:wlan  default-trigger: phy0tx
> >> blue:bt      default-trigger: hci0-power
> >>
> >> Link to 96Boards CE Specification: https://linaro.co/ce-specification
> >>
> > 
> > This is just a board configuration and there is absolutely no need to document
> > this in common LED binding. But if your intention is to document the missing
> No, I don't think so. The common just means the property linux,default-trigger
> is common, but not it values. This can be proved by counter-proving：none of
> the triggerrs currently defined in common.yaml is used by 96Boards.
> 

Right, but I was not happy with you mentioning 96Boards in the binding. Because
the triggers are used in more platforms other than 96Boards and they are not
specific to 96Boards. The documentation of triggers itself is fine.

> > triggers, then you should look at the patch I submitted long ago.
> 
> I'm just trying to eliminate the warnings related to Hisilicon that YAML detected.
> So I didn't pay attention to other missing triggers.
> 

No worries :)

> > 
> > https://lore.kernel.org/patchwork/patch/1146359/
> > 
> > Maybe I should resubmit it again in YAML format. (thanks for reminding me :P)
> 
> Yes, I hope that you will resubmit it. After all, these false positives are
> entirely due to YAML's failure to list all triggers. The DTS itself is fine.
> 
> By the way, the description of this patch I copied from your patch：
> 953d9f390365 arm64: dts: rockchip: Add on-board LED support on rk3399-rock960
> 
> That's why I Cc to you.
> 

I've now submitted the patch. Please take a look!

Thanks,
Mani

> > 
> > Thanks,
> > Mani
> > 
> >> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >> Cc: Darshak Patel <darshak.patel@einfochips.com>
> >> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >> Cc: Shawn Guo <shawnguo@kernel.org>
> >> Cc: Dong Aisheng <aisheng.dong@nxp.com>
> >> Cc: Guodong Xu <guodong.xu@linaro.org>
> >> Cc: Wei Xu <xuwei5@hisilicon.com>
> >> Cc: Linus Walleij <linus.walleij@linaro.org>
> >> Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> Cc: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Heiko Stuebner <heiko@sntech.de>
> >> ---
> >>  Documentation/devicetree/bindings/leds/common.yaml | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> >> index f1211e7045f12f3..525752d6c5c84fd 100644
> >> --- a/Documentation/devicetree/bindings/leds/common.yaml
> >> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> >> @@ -97,6 +97,16 @@ properties:
> >>          # LED alters the brightness for the specified duration with one software
> >>          # timer (requires "led-pattern" property)
> >>        - pattern
> >> +        #For all 96Boards, Green, disk-activity(onboard-storage)
> >> +      - mmc0
> >> +        #For all 96Boards, Green, SD-card
> >> +      - mmc1
> >> +        #For all 96Boards, Green, panic-indicator
> >> +      - none
> >> +        #For all 96Boards, Yellow, WiFi activity LED
> >> +      - phy0tx
> >> +        #For all 96Boards, Blue, Bluetooth activity LED
> >> +      - hci0-power
> >>  
> >>    led-pattern:
> >>      description: |
> >> -- 
> >> 1.8.3
> >>
> >>
> > 
> > .
> > 
> 
