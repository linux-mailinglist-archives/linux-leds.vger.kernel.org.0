Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56E4FF08FB
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2019 23:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbfKEWEL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Nov 2019 17:04:11 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37843 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728178AbfKEWEL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Nov 2019 17:04:11 -0500
Received: by mail-ot1-f68.google.com with SMTP id d5so7004644otp.4;
        Tue, 05 Nov 2019 14:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CZ2D2tQY2XYxt9UiuyFFNh/aMpMyVl8ybiw5lOJ9UsM=;
        b=AsQZRW+v8UESLkRB7WNYmZ+KDTTb9o0EFhfxEUlvkjst2OlDLN6hmEhtWI81caYFbR
         ea7yNzCCIUGY9zw9yhEdyhx6JvijPkp5G5a8dYO4ebUz55JXH14GCPRbCQtC09Bw80lG
         6WRes0AqeK9C5sc71KX5VJUZCCvU6fcKhOrPSxThGwsjEV9I/9r6aJGPRa5/goU5Hz92
         pI6x4hY+jBmax444WW3Z9e69ON3CHkICxRYz7HlyQBpmvIB8JsdRNlaqgOMljDzZABc6
         xlv9VrhCjImK+lCTUeHPsOtsXGLN07zmQ2eYkUECBWKtzwOb6v/jMfBF6xGKE6+emm0a
         25nQ==
X-Gm-Message-State: APjAAAXVzYvGb9szmeSZ40DygC2G68LpjM0VNGE78cBd5G78zyIqfIdv
        j11NiYRpXJ2fE6/XK247CA==
X-Google-Smtp-Source: APXvYqxl9rK6tAOrYlktMp70iCJFHEU0MCT4jSTOGFY9S41OUYWigXQsydbUcc92xUHHvcx/LC/+vQ==
X-Received: by 2002:a9d:634d:: with SMTP id y13mr24705915otk.202.1572991449843;
        Tue, 05 Nov 2019 14:04:09 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e93sm6812630otb.60.2019.11.05.14.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 14:04:09 -0800 (PST)
Date:   Tue, 5 Nov 2019 16:04:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        darshak.patel@einfochips.com, prajose.john@einfochips.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: leds: Document commonly used LED
 triggers
Message-ID: <20191105220408.GA555@bogus>
References: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
 <20191030090124.24900-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030090124.24900-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Oct 30, 2019 at 02:31:21PM +0530, Manivannan Sadhasivam wrote:
> This commit documents the LED triggers used commonly in the SoCs. Not
> all triggers are documented as some of them are very application specific.
> Most of the triggers documented here are currently used in devicetrees
> of many SoCs.

I guess it's worth documenting these, but you plan to use 'function' 
instead, right?

> 
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../devicetree/bindings/leds/common.txt         | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Documentation/devicetree/bindings/leds/common.txt
> index 9fa6f9795d50..2a6806161590 100644
> --- a/Documentation/devicetree/bindings/leds/common.txt
> +++ b/Documentation/devicetree/bindings/leds/common.txt
> @@ -55,6 +55,23 @@ Optional properties for child nodes:
>       "timer" - LED flashes at a fixed, configurable rate
>       "pattern" - LED alters the brightness for the specified duration with one
>                   software timer (requires "led-pattern" property)
> +     "mmc[N]" - LED indicates [N]th MMC storage activity
> +     "flash" - LED indicates camera flash state
> +     "torch" - LED indicates camera torch state
> +     "audio-mute" - LED indicates audio mute state
> +     "audio-micmute" - LED indicates mic mute state
> +     "bluetooth-power" - LED indicates bluetooth power state
> +     "usb-gadget" - LED indicates USB gadget activity
> +     "usb-host" - LED indicates USB host activity
> +     "mtd" - LED indicates MTD memory activity
> +     "nand-disk" - LED indicates NAND memory activity (deprecated),
> +                  in new implementations use "mtd"
> +     "disk-read" - LED indicates disk read activity
> +     "disk-write" - LED indicates disk write activity
> +     "none" - No trigger assigned to the LED. This is the default mode
> +              if trigger is absent
> +     "cpu" - LED indicates activity of all CPUs
> +     "cpu[N]" - LED indicates activity of [N]th CPU
>  
>  - led-pattern : Array of integers with default pattern for certain triggers.
>                  Each trigger may parse this property differently:
> -- 
> 2.17.1
> 
