Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B000C9D96
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 13:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfJCLmc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 07:42:32 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34973 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730052AbfJCLmc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 07:42:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id y21so2053377wmi.0
        for <linux-leds@vger.kernel.org>; Thu, 03 Oct 2019 04:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=cHvDsFcekIPBjH5IQouCdyPdPjje7XItWyIIEhMEyPI=;
        b=KUHnsWOZhhK6SSsl82Z+eu8JxSen5PB6zveEcc7ZS/DZqL2xMoZCrsOM+Cgj/s/GZU
         jm2bl+2+AgLJLDfMc0Rgk0E8CwafVlGkNSIEa2jrBFRY2tZxr5dHjI4NXYJ1BSl49Vy6
         chNXh8bWIusGKFXGeCSOxPhRTfC0FQOeSssodjmRhFw6ZuJKZ2mXORD2jeT5hi0qDFnh
         oyV4QmcBNWJvY4STPmI08IqiWkcXLqNGzrkm7U24CqRxt/ucuuBeDSqJeVkDwEPoForM
         ZhCxnXCK2QTLZbkH8OL2+8qxHL9O5N1zLJXAEMU4ZS5vjfOKggq2k2pD9y4XKySoKnoD
         /BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=cHvDsFcekIPBjH5IQouCdyPdPjje7XItWyIIEhMEyPI=;
        b=dXLR0esv/Txj7klK5hV0IMjLTJonytoEhe4uWfobt8ir76TEB+dJ/eYCOBu5+1Eibq
         SzNu9EjmIJJJBfgUE+HVOkmxsoqOb4gQWTeRvI2kyyanSChEsUY5bbbwVgvtFoteeeVk
         wXfUlvoZn/BN5QwjEB6DPlIuB00TAY0t/Aaclmnlufk9LlS7Dtr3D8m6uaTp0bNE/SKu
         o7/inAe1tElPJzMlzq0ieb857rrOT1ZxfJrBmcNz5exB8aoIVhd3vYpzrULO99EtlcK5
         jdExOYe6iyIMv7QMdBVdiNLSNVj85KrvpEBfXP8HAJMzn7d9FhQ00pAwSJtarIEJc5yL
         otgQ==
X-Gm-Message-State: APjAAAUsYunhwFqMTFtw+pBR2py7nqERC7LhzIheNfwOkm6rTcTrYMrf
        eYo8sfcFWlJ+zfZg469lpn1HMA==
X-Google-Smtp-Source: APXvYqw1NwetRlcDBzEKd3mk6MdQNZN+YmmIwRP4K/p2HZFkqtNAeXNCEmkgLAMiYM73jRZWrIMe1w==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr7069293wmg.25.1570102950452;
        Thu, 03 Oct 2019 04:42:30 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id m62sm2235472wmm.35.2019.10.03.04.42.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 04:42:29 -0700 (PDT)
Date:   Thu, 3 Oct 2019 12:42:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     daniel.thompson@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: backlight: lm3630a: Add enable-gpios
 to describe HWEN pin
Message-ID: <20191003114226.GD21172@dell>
References: <20190912213257.24147-1-andreas@kemnade.info>
 <20190912213257.24147-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190912213257.24147-2-andreas@kemnade.info>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 12 Sep 2019, Andreas Kemnade wrote:

> Provide DT documentation for enable-gpios.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dan Murphy <dmurphy@ti.com>
> ---
> changes in v2: added example
> changes in v3: added Acked-by
> changes in v4: moved enable-gpios to the right position
>   in the example
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
