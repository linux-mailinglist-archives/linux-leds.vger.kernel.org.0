Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBB5116D22
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 13:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfLIMcP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 07:32:15 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40057 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727492AbfLIMcP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 07:32:15 -0500
Received: by mail-wm1-f65.google.com with SMTP id t14so14705409wmi.5
        for <linux-leds@vger.kernel.org>; Mon, 09 Dec 2019 04:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=TcMAms7p1AUqadQqTsVabpfv+HfKMd7JiIn6+0u5b3A=;
        b=DCh5KZu71inkeOQZtpOb6fNnGUXSsbnL7cEiiLU5KddsEMz9ECtfYa3HgYGJe4I7JW
         gUIApCg9rdZQoaigvMt4IKU8b4M6cC39IRPWTfxYUHUl5McOXpozx3+paF8+LbCD1vzy
         WNrLYoSlA0om7Ehyh6EuQ4oy3Ug6AV1pgDMhRDWtd3tiGTDMU39Sz8wpqlDC94oyX7pY
         CafooqdJolIMHiPfgYM0LAFQxplJRM9b59HWhB9uGWzi3e8YdyZMyGd+vFu6mEl0MO6/
         Ke+/MEwe6t0qTGm/UOffRErHeDzu0V4nl2ZeeNsgDGKFhDtLAS3lZefqnuBRUpmQZwv2
         YBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=TcMAms7p1AUqadQqTsVabpfv+HfKMd7JiIn6+0u5b3A=;
        b=oopIF9MDpLPIdOcM/lyKn1HAQ24URwq8VMgnpMJ7mMtgjdHu+76wqFjB7NZ7gFFw2Z
         QzpA5Gd72iDTqHOHadTQn/4H/ZMow/k2TnhT10aFC31dhskpVYqAMNgxGCxlKze+Qz8v
         0iRDmzPwXAGyJcawHMx8olMoR3J8syqGLHKAnZWq62PsY0njOhK9qcN9hvu2FS+vNED7
         vpWZQmGEKdDCzN4f47mz9/u/ZAEGZ4CBcRtQNLjScp18JSxYSoDQJWAl8abD3sY+Xvjc
         40NDCSewqHEWWaIPtsB2WIJowG6F6eoIzL6fs25x3uwHM0lQoplF6NE8LuL3Vd25F4O6
         WEVQ==
X-Gm-Message-State: APjAAAV527RGfdat96EXomzqUKFl8DRpIYdWXqKzso2tnT0otWXnXiyr
        sCW19ii59+CgSBfCyZkaWiFDeg==
X-Google-Smtp-Source: APXvYqwrv2cRs37H9u3Gm+6DMpoyR28B91jn/bI1oNa8G1d5YGlOX8ZuK/J1QqXIrJ7mW3zHuCE32Q==
X-Received: by 2002:a1c:2245:: with SMTP id i66mr24316351wmi.86.1575894733535;
        Mon, 09 Dec 2019 04:32:13 -0800 (PST)
Received: from dell ([2.27.35.145])
        by smtp.gmail.com with ESMTPSA id m10sm27506266wrx.19.2019.12.09.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 04:32:12 -0800 (PST)
Date:   Mon, 9 Dec 2019 12:32:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Message-ID: <20191209123206.GI3468@dell>
References: <20191121142726.22856-1-TheSven73@gmail.com>
 <20191121142726.22856-3-TheSven73@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191121142726.22856-3-TheSven73@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 21 Nov 2019, Sven Van Asbroeck wrote:

> The driver has been extended to optionally get its operational
> mode, regulator init data and led naming from the devicetree.

s/led/LED/

> Tree: next-20191118

Why is this in your commit message?

> Signed-off-by: Sven Van Asbroeck <TheSven73@gmail.com>
> ---
>  .../devicetree/bindings/mfd/tps6105x.txt      | 47 ++++++++++++++++++-
>  1 file changed, 46 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/tps6105x.txt b/Documentation/devicetree/bindings/mfd/tps6105x.txt
> index 93602c7a19c8..1fc9aa3ed882 100644
> --- a/Documentation/devicetree/bindings/mfd/tps6105x.txt
> +++ b/Documentation/devicetree/bindings/mfd/tps6105x.txt
> @@ -7,11 +7,56 @@ Required properties:
>  - compatible:		"ti,tps61050" or "ti,tps61052"
>  - reg:			Specifies the I2C slave address
>  
> -Example:
> +Optional sub-node:
> +
> +This subnode selects the chip's operational mode.
> +There can be at most one single available subnode.
> +
> +- regulator: presence of this sub-node puts the chip in regulator mode.
> +	see Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +- led: presence of this sub-node puts the chip in led mode.
> +	Optional properties:
> +	- function : see Documentation/devicetree/bindings/leds/common.txt
> +	- color : see Documentation/devicetree/bindings/leds/common.txt
> +	- label : see Documentation/devicetree/bindings/leds/common.txt
> +			(deprecated)

Nit:

Could you please use relative paths here.

If you line up the ':', it would look slightly cleaner.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
