Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D63ECF7085
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfKKJZX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:25:23 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45923 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbfKKJZW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:25:22 -0500
Received: by mail-wr1-f68.google.com with SMTP id z10so8452068wrs.12
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wdf4vDYPrWUkIFw2I/tLGdO131jSnYkYMuWnygUSqLk=;
        b=QVjHDp3d+469LsP2NblXGvyg7PmbjNJAA/Lj8/YUSMVqsYksNAe3Pk26vNoh86CaIW
         Zs10nrrYxvXwqD3E1LIAWDrVEwn3zTuwrRvzYMAWSUhTqo88AO3X1KjkytzHetpoHW9K
         UQr8ifsnScI5cEo+wBnLoG7JmoRrxAU0YM1EM4w7hfEi6zKmqCZbF0PeYWKnljsGNGZ0
         k1M76IWhNU8FWi9JJNgOk06CotySwJoWYkOTjQBhyc5JsXUbecxnXUZ1JDeSBC56TWMq
         3Sf6dhzdePDLzCE/i70ky3motAWkcan/qqAHfSLJwvAqS7dTUQh043flEES3TdcmO5tC
         uLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wdf4vDYPrWUkIFw2I/tLGdO131jSnYkYMuWnygUSqLk=;
        b=KMZBwiPOEPWRVE5O4xQCBcd+V3D+CiUwMdoWzBmEprVQ/xW6mXx/GA3tbtGd+GTngs
         TBEfhKx1eBOIrWy0oMH0O8QdWSialQsrjS9QGMe3cRpPFe3fxT6jV8guEpPZV/JJe2JP
         JghvT0xpdzQjFW/OseZQXStZnG3n4ySKOadOJA/HgOZtej/Wn1zlvvYie0M0sOxzkCeY
         k9Mqak6I233UKdQXcLn9DNh0YRnLm8sFFtoH+esykoQ9g4W8C5AAkZyJDG1LsOaKf8UD
         ZwtwYkZhfZ04WJHbWbOAus4UbDBocasTD/w2/+6Lqes57TRyXNvBnIS+p3g/uHfDkX/4
         Sj9w==
X-Gm-Message-State: APjAAAWrahXkWxRKKHKyzdjgpipYj/GdP5KMMxygFbNpFTkekMTrKyIz
        mPxzHHzx4QyX8CMwOw80I9YUKw==
X-Google-Smtp-Source: APXvYqwqrFBkB4DNwsCnkk+NnHy2fa3C1N/2ZofRGerNFLj9+QnWiuNncAs3CNYES0zU4rIEPpmpbQ==
X-Received: by 2002:a5d:42d1:: with SMTP id t17mr7864805wrr.56.1573464320281;
        Mon, 11 Nov 2019 01:25:20 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id v128sm25894991wmb.14.2019.11.11.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:19 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V10 4/8] backlight: qcom-wled: Rename PM8941* to WLED3
Message-ID: <20191111092511.GR18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-5-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-5-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> Rename the PM8941* references as WLED3 to make the driver
> generic and have WLED support for other PMICs. Also rename
> "i_boost_limit" and "i_limit" variables to "boost_i_limit"
> and "string_i_limit" respectively to resemble the corresponding
> register names.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/video/backlight/qcom-wled.c | 248 ++++++++++++++++++------------------
>  1 file changed, 125 insertions(+), 123 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
