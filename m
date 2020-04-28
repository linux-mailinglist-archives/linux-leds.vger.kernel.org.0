Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEDE31BBAF9
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2020 12:17:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgD1KQu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Apr 2020 06:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727125AbgD1KQu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Apr 2020 06:16:50 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD961C03C1AB
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2020 03:16:49 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id b11so23956402wrs.6
        for <linux-leds@vger.kernel.org>; Tue, 28 Apr 2020 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Abo6l5Xyc1oYnHFvRioVLnD13zq9Rgb+0iUvfQi/YYI=;
        b=HitueB7/d1ualBTxbqUTESD3Pre5U2RmejIrTJWs1PwFw2iixni5EB1XiGxTaVKzLW
         pzKcn3Xj1PpcWFfa69UUG20I2QY9Hjx4EEOen2McVt74aVnKRV6y2A0PJtcfThHgcPw5
         oK6Al4D10wsEfr0T359Dyrbk2al7twmFMRjrMNXMJcGQvJbLjAnMv6uHJz+BmYR6Pd6Z
         cw5FibGDqmisikZM7Sa0cp3m2ug0YbjwqI5aKgxne7aMs3sRr2uS32gXNW8CShZwtewk
         ywABwowwP1RHJG7qay7Ymbnpc366x/+6HlMNcSPoqhESq0Z9ZEshf2vZWRjIeho4tRRk
         mThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Abo6l5Xyc1oYnHFvRioVLnD13zq9Rgb+0iUvfQi/YYI=;
        b=StzhABYR3cEftBOdLk5KworV1fcnRbGjlep7UjCs1ATkiHPELJhvZ/i88+eb3FidHD
         W0S7de0PQkWq7ADZTbz+yS5txu2S7nGP5nUfbIZbxCKC4PHalDWs/9ols2K9BBmy4V3S
         hV/HVywH+kWsyzU4jUQOEwB9rwd3CUwxZoN2pkksW48wXJIcJFnp8ILPd3OkQIC4J+vO
         kMydNim9gNkqnHeteIfNC+A64IfynTs5mJUm/F0UPFxe4QQwE1yfFjDfQqJ8Nprjqn4y
         AZw0KEo1GOOZzidlZaERx7gMpbnJB75PhfFxq2SoYW69ADj6P+xQHLtLh3hLUhN0W7Dk
         V3zQ==
X-Gm-Message-State: AGi0PuYPfiyCgyIPXdzR0woHbhgz9QqQbmRWL3eXvaIkdtfDcI/e17Yt
        +6g67y0hmOsXgEYYIWqwIxQwKg==
X-Google-Smtp-Source: APiQypLQ81+f0z7kO0fvBLeVPbuFSG2xYOUnKUA0JEXxXIUa3nlA/ckSrylVIOYt6X2eEAcUV7sWRw==
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr32720438wrr.341.1588069008454;
        Tue, 28 Apr 2020 03:16:48 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id f23sm2638156wml.4.2020.04.28.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 03:16:47 -0700 (PDT)
Date:   Tue, 28 Apr 2020 11:16:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 1/4] backlight: qcom-wled: convert the wled bindings
 to .yaml format
Message-ID: <20200428101646.GN3559@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-2-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> Convert the qcom-wled bindings from .txt to .yaml format.
> Also replace PM8941 to WLED3 and PMI8998 to WLED4.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 154 ---------------
>  .../bindings/leds/backlight/qcom-wled.yaml         | 208 +++++++++++++++++++++
>  2 files changed, 208 insertions(+), 154 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml

Needs a DT Ack.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
