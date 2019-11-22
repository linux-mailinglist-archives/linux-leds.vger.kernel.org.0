Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747AF106712
	for <lists+linux-leds@lfdr.de>; Fri, 22 Nov 2019 08:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKVHbl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Nov 2019 02:31:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34029 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVHbk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Nov 2019 02:31:40 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so7408329wrr.1
        for <linux-leds@vger.kernel.org>; Thu, 21 Nov 2019 23:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+sAO6BARi9nh6Xk/KHCfUyEO35XUSRjOifLynmlQiDE=;
        b=HVx/6pO5h4567D8hjH/yuda0DHmEfrIy3KwJRAMUgQnJpMtEjiO10f0to3AgQi6jKl
         uI0JNCNWfiVFi4+LjM/alLflRMt85ggNnISXKhfI6HgU4Oi/80HcceDAJbuBh4qSkmy/
         tFuaiCt9IehZSDylgPocF/7oaHOUYEMpYcSoxESO/YPs30DcOo/yVHyfPELiXpX9+rbd
         6xdEPygv9bp6lSzT51SDPt5A/xd87f+5k4mQPF0tHZbP0iZr91NoW/FsoiGdvqitBTk9
         mgL4gacKXEOc5ihfnAqmpv1vriRoFJPIq/cYR6Ku07g9/ecSsN4DB7CR0mK7V/qPhyJp
         +m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+sAO6BARi9nh6Xk/KHCfUyEO35XUSRjOifLynmlQiDE=;
        b=SeRjedFU+//V96OmnrNQil2jEMyvGlO5ysF7H2oUp3JuGQ6PBoN/tAjMA93GORwfYH
         VGq2OMhFdxNlpIjhbHlngYuovf+FJWA/vNoamFCS0mw+/8qOXTSwcPutqTJ5GWT08HV4
         faKD9yd7tRtm1smS3xNUfQ9Iwh4vjFjWt/HwdOYfJwRoHxyA4RQkw7PuG6lWFUxKVidr
         woaIXKVXqZryAJK82WO9UhXrIzIge5iUEwLWnSWJAqEuhy7vPMzEV5qUfT80CXoAnEmt
         RwzAGD4YXIgwBqL6Oh7LBPx/3o33Bb3hmQPrrZn46ie4FH7R3Jt43NjZB9bvEqPze4oh
         kR2Q==
X-Gm-Message-State: APjAAAVKFWYu7noIFZn9d/SPEkI5ZH+5bWZz35wFo4AQUgireho1rnnS
        r6/brqqT6S364VM1CKkKQD72zA==
X-Google-Smtp-Source: APXvYqwmW0dHTIlMP+PqU32cRM7vod5yAs1/BX5jdgQJ3kTCd2Ik5H0UkoGKz7MJ00stV1bxRKW5Uw==
X-Received: by 2002:a5d:558e:: with SMTP id i14mr15807519wrv.140.1574407898736;
        Thu, 21 Nov 2019 23:31:38 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id w17sm6784989wrt.45.2019.11.21.23.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 23:31:38 -0800 (PST)
Date:   Fri, 22 Nov 2019 07:31:24 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org, Grigoryev Denis <grigoryev@fastwel.ru>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Subject: Re: Applied "tps6105x: add optional devicetree support" to the
 regulator tree
Message-ID: <20191122073124.GA3296@dell>
References: <20191119154611.29625-2-TheSven73@gmail.com>
 <applied-20191119154611.29625-2-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <applied-20191119154611.29625-2-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 20 Nov 2019, Mark Brown wrote:

> The patch
> 
>    tps6105x: add optional devicetree support
> 
> has been applied to the regulator tree at
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.5
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.  
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
> From 62f7f3eca4c30064ab37b42d97cef4292d75fdd0 Mon Sep 17 00:00:00 2001
> From: Sven Van Asbroeck <thesven73@gmail.com>
> Date: Tue, 19 Nov 2019 10:46:08 -0500
> Subject: [PATCH] tps6105x: add optional devicetree support
> 
> This driver currently requires platform data to specify the
> operational mode and regulator init data (in case of regulator
> mode).
> 
> Optionally specify the operational mode by looking at the name
> of the devicetree child node.
> 
> Example: put chip in regulator mode:
> 
> i2c0 {
> 	tps61052@33 {
> 		compatible = "ti,tps61052";
> 		reg = <0x33>;
> 
> 		regulator {
>                             regulator-min-microvolt = <5000000>;
>                             regulator-max-microvolt = <5000000>;
>                             regulator-always-on;
> 		};
> 	};
> };
> 
> Tree: linux-next
> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> Link: https://lore.kernel.org/r/20191119154611.29625-2-TheSven73@gmail.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  drivers/mfd/tps6105x.c | 34 +++++++++++++++++++++++++++++++---
>  1 file changed, 31 insertions(+), 3 deletions(-)

?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
