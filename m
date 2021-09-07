Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367F1402E41
	for <lists+linux-leds@lfdr.de>; Tue,  7 Sep 2021 20:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345782AbhIGSR7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Sep 2021 14:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343833AbhIGSR7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Sep 2021 14:17:59 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6163DC061757
        for <linux-leds@vger.kernel.org>; Tue,  7 Sep 2021 11:16:52 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id s29so8815881pfw.5
        for <linux-leds@vger.kernel.org>; Tue, 07 Sep 2021 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MTKC20tO9zMCWTI8piOtIK2h9ol7uIIjMhJrYZXtkYg=;
        b=JP54FaieVXwvNpDq0XuDG07BQCdr2Dtael/Sn0U3W4F72gblOSgWKOsVQPfglUQAaR
         StOI2FGY99ADuiwTdcirDT+f0z6RhL7DTRVC6isDQEcfoj3yj9RU/kovpZIum8a+La0t
         Pz7XbBeLrdLb73e0g/FBjw0cAHp/L5prC+VWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MTKC20tO9zMCWTI8piOtIK2h9ol7uIIjMhJrYZXtkYg=;
        b=fVbQIEH7oA8ixQk3czqgHqq9e5w2lYb99TW+3sBGFcAhX4HQXtyPr8fjn9GLzqhFeA
         7HCtAuhxJA4V0gTuF/iAzfaVghxf0JQ2ZlBsdQvqN68my01s1mCLV65bPSvAeXYipe+r
         IvzyKwa7YW+GQ4OU4k1T1OrJkePL+DXtruSouUYGxF6nVEXjL+ERvbBPt0qFosti1a4o
         /c0cCMB0MPXrlEDvbdnIM0w4M4AX1tsbRw/S2yqYB0QareTW4VNpBTcF+YKwhEM76Ise
         URNOgxDzDSTlOPr1qvlu9MLlIzffQ3yACpH1OkpfWI/43B6WUNNbwdE6pBpUrQsIx8gP
         N9lg==
X-Gm-Message-State: AOAM533Iy0sXa9o63ynX0zuM6FeMBLwMex+CHYFwdcMNEoP/PLNvrVMA
        A8fCWvQv2KQ//ytIdyAa90bBEQ==
X-Google-Smtp-Source: ABdhPJx9jtF/JxyCIZPs2rLwflSaCsmFbpbllqX2GRRW80zYBwd0FSUQ8BPYOPQvDaCV2DUIfScgUA==
X-Received: by 2002:a65:6a4b:: with SMTP id o11mr17543541pgu.278.1631038611904;
        Tue, 07 Sep 2021 11:16:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id h4sm3704143pjc.28.2021.09.07.11.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 11:16:51 -0700 (PDT)
Date:   Tue, 7 Sep 2021 11:16:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8350c: Add pwm support
Message-ID: <YTeskY7kXsdmvGPp@google.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 06, 2021 at 04:11:07PM +0530, satya priya wrote:
> Add pwm support for PM8350C pmic.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index e1b75ae..ecdae55 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -29,6 +29,12 @@
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pm8350c_pwm4: pwm {

What does the '4' represent, an internal channel number? It should
probably be omitted if the PM8350 only has a single output PWM
port.

> +			compatible = "qcom,pm8350c-pwm";
> +			#pwm-cells = <2>;
> +			status = "okay";

I don't think it should be enabled by default, there may be boards with
the PM8350C that don't use the PWM.
