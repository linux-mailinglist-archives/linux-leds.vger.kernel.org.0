Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2F41C6E11
	for <lists+linux-leds@lfdr.de>; Wed,  6 May 2020 12:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgEFKIl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 6 May 2020 06:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729277AbgEFKIj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 6 May 2020 06:08:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6FBC061A0F
        for <linux-leds@vger.kernel.org>; Wed,  6 May 2020 03:08:38 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z6so1949975wml.2
        for <linux-leds@vger.kernel.org>; Wed, 06 May 2020 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=VzNe2ST4lz1BYAQ/p9YeE0kmmD4jLbs29p9J5C8f3PI=;
        b=lVg/KXxsQi9o5BFRkAdFAHJvM5az1noe+ABa8yeVzaBDNNCZTnPXEe6S/aOwqh/vkp
         8f0NhIcwAJ2PC/4vpwvKstSIXj0hfRFtrIeW0wcQYIan1lOdxvJyQqFAQfoII08sPkC4
         DGORLRfat4zBbEEmmc9MXkI3gjVEeqX+6hILIUTcqtnxODF/CSTLO5D+jI8mALONUf+L
         ikK7bGvxYlGDq4kzxRRF0d6+ObCh8KvLz/0bAVZgpwyprzBb9pD1uOu+cqtkevW0phpJ
         kzTkEGZKVK++p9qj8MHC5TvynAIpX+h0IbgOi9Tqyi9CmY91FSY9d8VpzwtWlO1tQvMq
         g81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VzNe2ST4lz1BYAQ/p9YeE0kmmD4jLbs29p9J5C8f3PI=;
        b=HSre8gzVhMZSiZCQSBc57ETUWcnmN2fRA858Cv55KZURv6hFdCxArc3gp8k57DQpzB
         x7fQxsVXm3YBKnOdm+9D9TfNjL4suIyOAepS9rvPgX6paAKtHpKrI9uumsEfefaKbF67
         Hcx21WeXqBiNUKBx4JeaR4TzVJ2/C6dH47qLeuXsXjwjk+F1GgbKxlZnyRDI7VKfjI2W
         r1d04jzs5rYORzdKc6a/kUR79TBaI7IRZ/oyqq0ssmSZ3eAWtYE+sy0+sTyDQIjpFcRr
         AfMnHKiEd4iMrFaaWE2DAwUl1FdHdmRNj29Zk8SBsZbgzpIGZVeVfuSUH3KTZq6UmboN
         2Lpg==
X-Gm-Message-State: AGi0PuYZH2IpsziZVqRaBAfoMDbUvdqOBRSKy/qiibJbzgIYc4zrTUpd
        pui3Nnx/nuCbK6wFvRBJmhnR7g==
X-Google-Smtp-Source: APiQypInYHUDNrqEUITYN/4bNtu4Kh3BGLktqne+H6HDYbuGJNmorPX8kNclKs+5lI97bApQew2ZlQ==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr3332429wmi.182.1588759716943;
        Wed, 06 May 2020 03:08:36 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id 88sm2000910wrq.77.2020.05.06.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 03:08:36 -0700 (PDT)
Date:   Wed, 6 May 2020 11:08:34 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        robh@kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH V6 4/4] backlight: qcom-wled: Add support for WLED5
 peripheral that is present on PM8150L PMICs
Message-ID: <20200506100834.GG823950@dell>
References: <1587656017-27911-1-git-send-email-kgunda@codeaurora.org>
 <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1587656017-27911-5-git-send-email-kgunda@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 Apr 2020, Kiran Gunda wrote:

> From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> 
> PM8150L WLED supports the following:
>     - Two modulators and each sink can use any of the modulator
>     - Multiple CABC selection options from which one can be selected/enabled
>     - Multiple brightness width selection (12 bits to 15 bits)
> 
> Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 378 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 376 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
