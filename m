Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 699E113BB25
	for <lists+linux-leds@lfdr.de>; Wed, 15 Jan 2020 09:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbgAOIdr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Jan 2020 03:33:47 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36518 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOIdq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 15 Jan 2020 03:33:46 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so16804493wma.1
        for <linux-leds@vger.kernel.org>; Wed, 15 Jan 2020 00:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=WpuKpiDRvGzuOKGz765acle30K2AapAgvO0dQxkTLhY=;
        b=jNgkV9pOWBh6UAJ1PXeVfZpoCLEkrt5tE1fLX1d0hpCo+qtWxgbGVRX7MnaYc0XJ3m
         eHw0DOLOVM3vj8nJqdCRoIqnoF8NdAX5+8VI8WDbvTU5nCl38z4y5dCewj92rilzsEM9
         n35aDnjpZP3U0vdjmu3CzjLKybHJLZ5D1p27zms1nvGo83WD56mx1oTVDxJGwLokGSdl
         FrUFsaOnGs4HbZLNkEQMz/3l/ojgoA3qowGgapvll6xqXQM81Yce4jvmvKnX7HHk7Cdb
         Q1hlPFF216XNb5Urdj4tepa3NqINe+u+vbZBifcdgQUvqgW1jCBLksXOKCHbeB52Uv9X
         rQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=WpuKpiDRvGzuOKGz765acle30K2AapAgvO0dQxkTLhY=;
        b=nLRHCGJS7dp3jrhcqcxukObG9rx1nX4riEJxgz1HsdI1rFIvzFu3ngXS3fcY2GLmDZ
         muE7pi0wOJ4GT9uLIzpb0n34e+349WDWwPBdLruAAGHwItKexEQUNbqR7GIlIzt37yUj
         dcQusvJhaG9Op2WDJ/8FRMqypae+5R+NCSzR4walxzfhjyGejhVYSUvpnP8FUQJ98k58
         b4sgLHtiamNZxg12ZI89LjCds349ZIOx/apEizKxnvZWp8Ck6nmJa8B/PeqhOx9nTUXF
         sSuvif1M5EkUXXagCLv1NIFCqe9i1UCbaaHXPgXulgJ3c0mptzyqmO4Wiu8f8+8xeT10
         7HuQ==
X-Gm-Message-State: APjAAAXcJ3lygLWwqs4luOfUYb5SMEXSAQDWkqL0wpO0Nnb5fQt5Nmmz
        VnxAyPNg9V6UWYe5ybJBaEoicw==
X-Google-Smtp-Source: APXvYqyTbNPBM+b0H7a+geOBj4EY/YVa2dv7LeznO4hME0KN8z55nb/XzKzrODJRYwtnGQHSFMXehQ==
X-Received: by 2002:a1c:dcd5:: with SMTP id t204mr33506655wmg.34.1579077224548;
        Wed, 15 Jan 2020 00:33:44 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id z123sm23648038wme.18.2020.01.15.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 00:33:43 -0800 (PST)
Date:   Wed, 15 Jan 2020 08:34:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v9 02/12] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <20200115083403.GE325@dell>
References: <cover.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
 <b58952aedd1cce08aa4d7f346007a24923bb2b64.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b58952aedd1cce08aa4d7f346007a24923bb2b64.1578644144.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 11 Jan 2020, Matti Vaittinen wrote:

> ROHM BD71828 Power management IC integrates 7 buck converters, 7 LDOs,
> a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> and a 32.768 kHz clock gate.
> 
> Document the dt bindings drivers are using.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> No changes since v8  
> 
>  .../bindings/mfd/rohm,bd71828-pmic.yaml       | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml

I only have patches 2-6, so I cannot help with merging.

My guess is that some of the other patches will have dependencies or
be dependants of the MFD changes, thus someone else will either have
to merge the set and send out a pull-request for the other maintainers
to consume, or you will have to send the whole set out again. 

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
