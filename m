Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1DE5434457
	for <lists+linux-leds@lfdr.de>; Wed, 20 Oct 2021 06:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbhJTE31 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 20 Oct 2021 00:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTE30 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 20 Oct 2021 00:29:26 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE06FC06174E
        for <linux-leds@vger.kernel.org>; Tue, 19 Oct 2021 21:27:12 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id r64so8091160oih.8
        for <linux-leds@vger.kernel.org>; Tue, 19 Oct 2021 21:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KVKplhRxILI8I/oy0FMY8RP+d5gKK/Wsa1r6nqQ6o3U=;
        b=bAjp6vkLKBf5OVZt33zDaaAdJgfXccJSKnoVSKOf6Y2zM89m+ddRnlIcBfnBeiMAGB
         pqyZOh/VkiJZjeZ8VO/Fa1ov9vrCSBE3WgJhaWUCkWLwh4RGqEwlHjCuVN9N0SaTYwW+
         /KtiISyCJV5UScjlpTp4wCAKBOI3ddhOe0T2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KVKplhRxILI8I/oy0FMY8RP+d5gKK/Wsa1r6nqQ6o3U=;
        b=zIJjhxA70AJuN5TSg0iG6LKnQ0sQoh4VUBUNCHilTXSe/2rh1Mwaz90P6QZ9inTpkl
         d3DPXHKAQh/M52Cpy/09/7wNEL/U+8xyXgmnItbBn18CEgteKUZ7e8OpZcPUb85Q4MhU
         9Xkk2rY5ud0kaH2kDWO3YK6nLLv1LmhVnmkc7ERj525q01pyGyy5sE2/yDuVEgxuY7ni
         8EgiCnEmcewBlGTxnsPit8JYWGZiN59XghdJ3kNXcKoqI/EtmIWtZ29RykkM2SaIG/M6
         AzcnUt1D3+kvzDtGFcHfo2NypArKSsKN44BGGw54j3r1VeXIsGOjZtRbIQQ96hzhFH3w
         wnmw==
X-Gm-Message-State: AOAM533ITUpGBrO6BMKgJrcTBgdqr+FxxrAo9L3w3mVAKvOGGPuFJdjX
        bKRbSz6i4D39AVEYxY6I4ubk09B4nmIffK7JUY1DYQ==
X-Google-Smtp-Source: ABdhPJzh3ZOGe96IecK1OqqtQSExKI9kebMcVSUhZrUrhR6WDYqRhGnx1+pIa+JBaJw/ZtCtcC9iBYQ8L33OtBMjwMs=
X-Received: by 2002:a05:6808:23c2:: with SMTP id bq2mr7418740oib.32.1634704032132;
 Tue, 19 Oct 2021 21:27:12 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Oct 2021 23:27:11 -0500
MIME-Version: 1.0
In-Reply-To: <1634640531-15813-4-git-send-email-skakit@codeaurora.org>
References: <1634640531-15813-1-git-send-email-skakit@codeaurora.org> <1634640531-15813-4-git-send-email-skakit@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 19 Oct 2021 23:27:11 -0500
Message-ID: <CAE-0n509=RqfzqBjzVDRphk3umbmZEuN8=A91FY8DPWyn0BH1g@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: dts: qcom: pm8350c: Add pwm support
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Satya Priya <skakit@codeaurora.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Quoting Satya Priya (2021-10-19 03:48:51)
> From: satya priya <skakit@codeaurora.org>
>
> Add pwm support for PM8350C pmic.
>
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
> Changes in V2:
>  - Dropped suffix '4' from pwm phandle and removed "status=ok".
>
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index e1b75ae..08fc0a8 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -29,6 +29,12 @@
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
>                 };
> +
> +               pm8350c_pwm: pwm {
> +                       compatible = "qcom,pm8350c-pwm";

It should have a reg property. Every node should have a single cell for
the reg property because the parent has #address-cells = <1>

> +                       #pwm-cells = <2>;
> +                       status = "disabled";
> +               };
>         };
