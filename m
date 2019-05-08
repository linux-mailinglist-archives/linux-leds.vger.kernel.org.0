Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86C53178E4
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 13:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727586AbfEHLwg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 07:52:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55143 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfEHLwf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 07:52:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id b203so1733468wmb.4
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bgzoKqv2vMCjmxJ3xMeLrXg9m73MgNn3EHeek8J9Jxg=;
        b=tKX/lzAEg5dvRlrWNl6NKBcTzikX0amTt12YXTGKL08kUnoqwQ9a0d+7hrlLVD0t8R
         I6I/NiseKd4g+RvEp9uB0Sq1XIhBfuCNsweM7c5q4mC4qxFr8IlELCRbHl5rTPcBAjzK
         vFkCiBrF7iWZeCj+EqPqEr3kqXHNE4Gh6ZhSp/Swr5jGPSLMLyVkLHOKjpdHRylphX5m
         Nu2n2+9AuUIiT/L622qQadZQctHkxLKzFTIKPNmZu3I6QuwpOhoqhLpfqKiUp11uv2fw
         kjEddNH13fQa7MM4ZM1a74kxReMnDA+T2EM9EYRAv6pk6QxMrQI7VyraWPK73DJbNnUF
         qgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bgzoKqv2vMCjmxJ3xMeLrXg9m73MgNn3EHeek8J9Jxg=;
        b=CwIF287JG4PW6NNQulLp8JbcEJbP6t9AYRmUUqvd8/tTqOc13FTx7Sj4BStjNRicH+
         00ufHdGBnQ5+usAWGoKuqphF1w8THsjUrjiBK+pLwCbnVvlowEm7qvaeuBlXgiurL75n
         V4+Mgo3FJJZ/gnKTvNXVIafBTqfPA6j/GrL5RICS43pvXM5LFPefxm+k1KMeSuhZD8Xi
         AqaRR2U/5mTl32g7Ef1GgViRs3U0JrZF0mXfpBPrAvXmIjJOr2HqjwNCIJ31NcSbVryI
         E0FytL4zGW+rjurIekY5eN3BQFAKTHFSaRHdFp7J2lu6dK9cyifAkxWKrD5xHuFVQYBv
         qVcA==
X-Gm-Message-State: APjAAAW1md3OQqh8+erBRuk0sUb709Z8N3+TpoRXXwvSMFxiPEoom4nq
        5pTJneBJBZN6Bty+UYi/+436VA==
X-Google-Smtp-Source: APXvYqzdG+CtYf6DOkiIqnOU8XWoNkkbpTTeRfLOp2Jj920q5O5hA+jcM9Fx2TLWUq5GF5da3ZHklA==
X-Received: by 2002:a1c:f70e:: with SMTP id v14mr2916093wmh.74.1557316353693;
        Wed, 08 May 2019 04:52:33 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id a184sm2953209wmh.36.2019.05.08.04.52.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:52:33 -0700 (PDT)
Date:   Wed, 8 May 2019 12:52:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: mfd: Add lm36274 bindings to ti-lmu
Message-ID: <20190508115231.GN31645@dell>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-3-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190507201159.13940-3-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 07 May 2019, Dan Murphy wrote:

> Add the LM36274 backlight driver with regulator support.
> This is a multi-function device for backlight applications.
> 
> Backlight properties will be documented in it's a supplemental
> bindings document.
> 
> Regulator support is documented in the regulator/lm363x-regulator.txt
> 
> http://www.ti.com/lit/ds/symlink/lm36274.pdf
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/mfd/ti-lmu.txt        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
