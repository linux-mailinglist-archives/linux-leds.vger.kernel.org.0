Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 523011407D1
	for <lists+linux-leds@lfdr.de>; Fri, 17 Jan 2020 11:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgAQKVm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Jan 2020 05:21:42 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32981 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbgAQKVl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 17 Jan 2020 05:21:41 -0500
Received: by mail-wm1-f65.google.com with SMTP id d139so9161534wmd.0
        for <linux-leds@vger.kernel.org>; Fri, 17 Jan 2020 02:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=oIMnoa3sbVn/rSlDZkNhieTQX0bAIPs2g8BvjBAAJYw=;
        b=uWT/LKHFB9KJAzcvqgQA2YPyMRp+0vG3uJZJyC3ZOr8OoMycE8q+vQ3sCqK9hRMWk8
         CfPK8HfmmypEvmovpHkBAuOmFommCtZrSL3YGxaKtIy3C3wGjROaOrRNZRZF/IbwZ6/N
         uFv0OCYryACBEzIU3GMggHYVxRB8XhctMuMY3RQ8xEyZFJ+Gu+v8KtV0SrU0pAbLQKw9
         aBK0/A/HOC8i4J4FHvzXI7LIUlYeWICcyQgPkVOMFQpN/HRBb9n7nDdCMeaD06aXcIHA
         pbdfSXj7+3zrtJ7O9sTCzn6iP4wsSNRAQDeSozArMrOTT3pTX/KgJkrI/TVLv78bVqaz
         +I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=oIMnoa3sbVn/rSlDZkNhieTQX0bAIPs2g8BvjBAAJYw=;
        b=pLpBtsn1fwGzmlnUNuG1WelJAQ+Nd7JSUb2AUy9jIueIaAOJxAvs3cstTuze40UfFc
         xcmJVAvJ//e3+DxmvmjILGOhXCtmtWctW2a0v3hur+fJCpznSmFWxBxBE2K/9JBVEVpf
         A8SxsvhVWBAIFsMBy9m1YDllNzLLxH2Q/pWIOHSedPS484lf7GN+IKg+dh5Kqe37u8FP
         CjdJGzR0YFIXDmDlrt9KVwD9qO03pi5FtQNg7RYSS10C04ETv0jgTdL047ReeBcRen7y
         yFUKNXoV+2WpOPndWJc3ZYc2oDZMu7whY75+q8fdkfap833sPWWmJPwQcEY5mqtBP2ZP
         +3iQ==
X-Gm-Message-State: APjAAAUgf0XgTvG8JryNK0KLLLeF2j23Q0zfxECIBUWdU5EeKEBQdYzU
        y5/mKLjnzDQetkxhIN+b2fUjLw==
X-Google-Smtp-Source: APXvYqyjoao5W4ukyHmbDLvlRKQ3NULe0P7hwKt2aT/kXMKOsmfbWd9tvncJKeQZdv+1I5pJSDFudA==
X-Received: by 2002:a05:600c:2c50:: with SMTP id r16mr3747778wmg.74.1579256500001;
        Fri, 17 Jan 2020 02:21:40 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id h66sm9780563wme.41.2020.01.17.02.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 02:21:39 -0800 (PST)
Date:   Fri, 17 Jan 2020 10:21:57 +0000
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
Subject: Re: [PATCH v10 09/13] mfd: bd70528: Fix hour register mask
Message-ID: <20200117102157.GE15507@dell>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
 <8609d42822a6ce3755e2166b8c1246b3b04eeb78.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8609d42822a6ce3755e2166b8c1246b3b04eeb78.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 17 Jan 2020, Matti Vaittinen wrote:

> When RTC is used in 24H mode (and it is by this driver) the maximum
> hour value is 24 in BCD. This occupies bits [5:0] - which means
> correct mask for HOUR register is 0x3f not 0x1f. Fix the mask
> 
> Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
> Changes: Splitted this fix into separate patch which can be applied to
> 5.4 too
> 
>  include/linux/mfd/rohm-bd70528.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
