Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3D4AE915
	for <lists+linux-leds@lfdr.de>; Tue, 10 Sep 2019 13:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfIJL0q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Sep 2019 07:26:46 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43218 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbfIJL0q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Sep 2019 07:26:46 -0400
Received: by mail-wr1-f68.google.com with SMTP id q17so14715862wrx.10
        for <linux-leds@vger.kernel.org>; Tue, 10 Sep 2019 04:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j0TBNK8vrhm3gWofBEygsEx6r5o4+eQ+f+iikza6PCs=;
        b=C2wbjYZcrPtWqMbHCc0NFcjoE48uA90sIUxmZk904S9onpeCgpqxYF2+qlIGnesGzU
         FTaWBzTKFCuFhpbtGzkixNWaxtdnMv5OxYd0pTKhqUIhAOhp7pdrrzvlIpUFFWz/de2j
         PxwAkDn4Z9WnrJUTrue3rQbFWzYuUfV/AS6q23eYDus9TSGguBSNI5x7k4DN9HEBwjOE
         gi3/dGho7qOlXW9b8mTLMRAlMNi6+sITQ8BI5dV2iT73s24OXY1w03gVyYTIISHOPBeW
         tnNF8uULOaWfzCd4yVdZqgFAoJf+Z+Hzc7mguJWpDt0O+pymCAFq/EP5AXoFHmdM9WTZ
         TzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j0TBNK8vrhm3gWofBEygsEx6r5o4+eQ+f+iikza6PCs=;
        b=r2Ba69IwevhO+Wsn/VAcw18BDz5z7d5afEksWFB5YSSA0aMUuaLh2gu3bWEjrpnUQk
         louYqfB/F81TTdp1fd535hXypGGEGJHALrc386zLt8SKZ3WxNKeDeD4AGGhFvqjKW5iS
         qdxPOBqxFIp6+iZkJU6qgjGAEecqOPpaLTVB7tu1yseyW6IeIZFSBUMT0jvNtzsTvIiT
         rhZ2AsL/6FPxw5RhB7R8ZhawPgHJ3A1CoIvrTsoGsvEPCBlj4H943ENEe21HAF1qwbUx
         x2soBEQLfT8LNZ5LIcbkvMldeXCO7u4gyMIh8PyrNtDGxh6oElk0t/SywgTEc3/E2rbp
         n45A==
X-Gm-Message-State: APjAAAWWJj4X21QZA6H0XSpq9BtAtcM4DIMhGLqYFnlqliJjqy5s4UMt
        LeUA7M4yGfsyxkjNW2lo/vgFfw==
X-Google-Smtp-Source: APXvYqy9l2m6tvel0D96cw1Y+Z7nXsZRSHOqRUjLgsUtGTNBvQhldiMJqmfTX5m82vMFJTeXKmkabA==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr26859432wrq.305.1568114803790;
        Tue, 10 Sep 2019 04:26:43 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id l1sm20279280wrb.1.2019.09.10.04.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 04:26:43 -0700 (PDT)
Date:   Tue, 10 Sep 2019 12:26:41 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, lee.jones@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dridevel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v5 3/4] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20190910112641.q4qpvhh6u6nqqw5z@holly.lan>
References: <20190910105946.23057-1-jjhiblot@ti.com>
 <20190910105946.23057-4-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910105946.23057-4-jjhiblot@ti.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 10, 2019 at 12:59:45PM +0200, Jean-Jacques Hiblot wrote:
> Add DT binding for led-backlight.
> 
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  .../bindings/leds/backlight/led-backlight.txt | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> new file mode 100644
> index 000000000000..4c7dfbe7f67a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
> @@ -0,0 +1,28 @@
> +led-backlight bindings
> +
> +This binding is used to describe a basic backlight device made of LEDs.
> +It can also be used to describe a backlight device controlled by the output of
> +a LED driver.
> +
> +Required properties:
> +  - compatible: "led-backlight"
> +  - leds: a list of LEDs
> +
> +Optional properties:
> +  - brightness-levels: Array of distinct brightness levels. The levels must be
> +                       in the range accepted by the underlying LED devices.
> +                       This is used to translate a backlight brightness level
> +                       into a LED brightness level. If it is not provided, the
> +                       identity mapping is used.
> +
> +  - default-brightness-level: The default brightness level.
> +
> +Example:
> +
> +	backlight {
> +		compatible = "led-backlight";
> +
> +		leds = <&led1>, <&led2>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <6>;
> +	};
> -- 
> 2.17.1
> 
