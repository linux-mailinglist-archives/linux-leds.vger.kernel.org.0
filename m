Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79231785D
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 13:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfEHLfP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 07:35:15 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51915 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbfEHLfP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 07:35:15 -0400
Received: by mail-wm1-f66.google.com with SMTP id o189so2861251wmb.1
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HXeOrT3youkkGlJIREGe1d+8JaSnzpTXLtcFxjjLlUY=;
        b=LliSzz7pVx0hjhCRfi+t9+LqV4Ah8haHdit5fv0NgcDm/ODp589aw2xPWnbKMLrekF
         Rv6P/MsoNN+69PGk+3WmM08UPq/pQbupbjOhSH56cJviz1J/IYisYdfZgkMc6FkxpD9G
         TldD+G8t2K7r6oq4TYB69Q4OZTkowf2l8R+dLOqWYpNZFWxUBb6YBkCayqd6M1qWtwgR
         wWp+/42MzAWZBBLPfzxvQdftRl3w6XIt8Wh6Zfo6aJ+Bhiwi3iZxhTorxcoR5OwrFZcp
         Jt8yia6x/rVZ6WihXYcNaL5dHTFSyfd7CdHOjy7B/yP5f3SdEPRkJGZsZbNnEiVh1OCR
         uYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HXeOrT3youkkGlJIREGe1d+8JaSnzpTXLtcFxjjLlUY=;
        b=tm3UQ8Ed2DChT9eX6xAw6BlKqDzJFgQGT/tKRRmKydUwzqnjUZF1QQNtCe3IjDQpS0
         cmncl34gBUd2Snz6kxw1SBJKf2faOHNmWnszEwJSBdOUGQniZc/yzT3Vi57JRndSYGiV
         rFvsBr2CnOQ6IAyUk/HT6ZH0Raps5BoRyUxzPoQ8gihtO2vZPF++vzuYUGLVn4wbdw8T
         J8ddrGnuPTRYdIG9uVoZ4PZMzP15i0Ar2EF3msEDwhPpWoHZnELM/nDPaO+5FrqGrK+H
         N9L7sOyCIVgf98RJ0ZRzn3ut35PCFsIPXQe12lE6oSvdqpD0iy1M0hISpUwDdCfuIIyr
         179w==
X-Gm-Message-State: APjAAAXCCgTMXhERZE5w+6bY065aaZtWdg/daJ3BWVPN80okArlR06t3
        eWgudbye7S9fYXoOyIvVQO90YQ==
X-Google-Smtp-Source: APXvYqwNFOAfUkxBrSyIDhXFkjVCnIQEKaQPvZER01gSPTdvNyQBaKHpBzlgxc/hpy319B6Un5JkPA==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr2669949wmc.137.1557315313220;
        Wed, 08 May 2019 04:35:13 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id v184sm2645597wma.6.2019.05.08.04.35.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:35:12 -0700 (PDT)
Date:   Wed, 8 May 2019 12:35:10 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mfd: LMU: Fix lm3632 dt binding
 example
Message-ID: <20190508113510.GA31645@dell>
References: <20190506191614.25051-1-dmurphy@ti.com>
 <20190506191614.25051-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506191614.25051-2-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 06 May 2019, Dan Murphy wrote:

> Fix the lm3632 dt binding examples as the LCM enable GPIOs
> are defined as enable GPIOs per the regulator/lm363x-regulator.txt
> bindings document.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
