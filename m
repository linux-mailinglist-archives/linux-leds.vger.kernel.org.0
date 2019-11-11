Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F63F7082
	for <lists+linux-leds@lfdr.de>; Mon, 11 Nov 2019 10:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfKKJZM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 Nov 2019 04:25:12 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35712 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbfKKJZM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 Nov 2019 04:25:12 -0500
Received: by mail-wr1-f68.google.com with SMTP id s5so2672577wrw.2
        for <linux-leds@vger.kernel.org>; Mon, 11 Nov 2019 01:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VAhgFuknLH+5wiq8gpshwrQB5hsKGp5uyD1SKtlD5qw=;
        b=ZZT3kTVKlAhZeX/N1Fvo+J/MQqwPp8uIHJEUXfME6HpfveP8v/D27PTJfk90U4I90t
         mRCY+1phXU1NUxl7eV15hmK5Jssl7QqveGx+YJP6NsK9o4z9qV8DuQUUn0Clxw9Xo1Vf
         d+afqPzL/lG3S0DnazgdXV3z/eBii8U3kCEmsQekT3lWdpDZ4M28XaPdcket6px5zV04
         HUX1dgoE0fBPFv2531agmoF8MECttCNT9Gh1/a895oEFOK/goc7fjsW/n98WgKy9mUIA
         Bx71jjuXJSuDJc7PuYxJssZ+RLKbj5x/4W2KzOVch2qQBCx97p4nDoX9RboELD8dQMwq
         Ewsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=VAhgFuknLH+5wiq8gpshwrQB5hsKGp5uyD1SKtlD5qw=;
        b=knMJhY1Uh5sUkruzQw7Hw4m8hbO5WbHRjnbH0yNaBg3zZ6BWfX1RB1e/SHJ6ezEoti
         XtLroeQG+QWvLqBRevr+zSe9F9MShdYSU9I9u7/fdxWM2zn2tcZ/PDT3/E5DiheXAoSk
         O8nqipIgfnLoDY+NIr9mKdlNCnHahBeia4xHrxmuG0E3JL3LGahgrf+fAGz5wkjyfhBU
         Uofa5XPjWxMlHzBOnQcU73895qclO//kpJt37ONQ+kkvSUIJw/TtGQKCTVJQMoNJINY1
         CqX+6vwm7BNOm4sDfqh48gQ1PqjxfMdxOwLX2EF/lj8V8bI+GeRSwQwEy3l83qVEg53u
         xaaw==
X-Gm-Message-State: APjAAAU9IlACzZDNGFlc7aMdzCKYo4EsBZhSdiQloZMfxJXRSGgRbyCU
        RsjFTfI+myTqJFVLqNx+ZQ5CrA==
X-Google-Smtp-Source: APXvYqyw8G9ReMr7hKfdQleBjqoUQ06hvaDyQGL44hHp1RrN1PqVZqBIUWqqsUUff682AmzCC8i97w==
X-Received: by 2002:adf:c105:: with SMTP id r5mr20303156wre.125.1573464310629;
        Mon, 11 Nov 2019 01:25:10 -0800 (PST)
Received: from dell ([95.147.198.88])
        by smtp.gmail.com with ESMTPSA id q15sm6492591wrs.91.2019.11.11.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 01:25:10 -0800 (PST)
Date:   Mon, 11 Nov 2019 09:25:02 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V10 3/8] backlight: qcom-wled: Add new properties for
 PMI8998.
Message-ID: <20191111092502.GQ18902@dell>
References: <1572589624-6095-1-git-send-email-kgunda@codeaurora.org>
 <1572589624-6095-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1572589624-6095-4-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 01 Nov 2019, Kiran Gunda wrote:

> Update the bindings with the new properties used for
> PMI8998.
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  .../bindings/leds/backlight/qcom-wled.txt          | 74 ++++++++++++++++++----
>  1 file changed, 63 insertions(+), 11 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
