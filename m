Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDF6403C82
	for <lists+linux-leds@lfdr.de>; Wed,  8 Sep 2021 17:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352076AbhIHPbH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Sep 2021 11:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352065AbhIHPbG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Sep 2021 11:31:06 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 164BCC06175F
        for <linux-leds@vger.kernel.org>; Wed,  8 Sep 2021 08:29:59 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id m26so2375131pff.3
        for <linux-leds@vger.kernel.org>; Wed, 08 Sep 2021 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BdySeMpA5oxLZqf0kkPZHfESZokTOyR4F7+QPgrkdO4=;
        b=X/hiE8lRT8yZAgqubh4mszFmc1kMRhqDJkXKT6BTT9PYPwkuTvUrHscMOW8YkAdMQq
         FjV2kcCziH0PjL2i2EfuI2AatrsP2M9xRCIjEClmVBJKS8lIiKs+qwp9yWRu+ej5eTBy
         +/f3jo1R5MfTUn2rk4kz4Jec2oM3otoQ29ck0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BdySeMpA5oxLZqf0kkPZHfESZokTOyR4F7+QPgrkdO4=;
        b=1ADbJeAeSsnZuOJz83dIhWglJ8F+lM/eGULy8C2tUR1XdUSTZaccFsLQlvxKnTgmPM
         6eCv2NLJ3M9IRnVYK39Bh/hrAzwnDzKHWcpJ4CLVgNOiysSoROqfBl5tzzfA/qUIoUHW
         jHhUtrDMipUt6JAsvaBWx/JOaLxscbCChVb9dbxnGAaBy8IXlx/GQm67zvmSVkDqrSP0
         53aetnBMlKMefufxAIOdH5sRG0c3I2GQZYWhb40CI71vvkLxQ1ekpUybdp05Q1TUnNYi
         JdavkWViu1u2xO0QjCHXZrKQTGHzfObMvJLeqmI2S915ULyV8WSvNcw1rqUKrUnKe3n3
         ZfQQ==
X-Gm-Message-State: AOAM5308ovVksmojL6OKOp5uxWyDFLReec3XpNuUTDQV9ZrzO1kXT1PS
        cb53KK5eqyUQUHuK6X5eTo/ZXw==
X-Google-Smtp-Source: ABdhPJxP+IqKzKFKsz+xkh8ZRWYjhvOy/HgDupCGDDUOuHyv85z/btvLyACH7BUGQ82dUNy1yf5juw==
X-Received: by 2002:a63:e516:: with SMTP id r22mr4275826pgh.197.1631114998456;
        Wed, 08 Sep 2021 08:29:58 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c6b2:7ae:474d:36f6])
        by smtp.gmail.com with UTF8SMTPSA id a20sm2504035pjh.46.2021.09.08.08.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 08:29:58 -0700 (PDT)
Date:   Wed, 8 Sep 2021 08:29:56 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     skakit@codeaurora.org
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8350c: Add pwm support
Message-ID: <YTjW9LAGhTuszoa4@google.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
 <YTeskY7kXsdmvGPp@google.com>
 <b10e5f36fb0216a4c951d752f5103099@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b10e5f36fb0216a4c951d752f5103099@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Sep 08, 2021 at 02:37:39PM +0530, skakit@codeaurora.org wrote:
> On 2021-09-07 23:46, Matthias Kaehlcke wrote:
> > On Mon, Sep 06, 2021 at 04:11:07PM +0530, satya priya wrote:
> > > Add pwm support for PM8350C pmic.
> > > 
> > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > index e1b75ae..ecdae55 100644
> > > --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> > > @@ -29,6 +29,12 @@
> > >  			interrupt-controller;
> > >  			#interrupt-cells = <2>;
> > >  		};
> > > +
> > > +		pm8350c_pwm4: pwm {
> > 
> > What does the '4' represent, an internal channel number? It should
> > probably be omitted if the PM8350 only has a single output PWM
> > port.
> > 
> 
> pm8350c has four PWMs, but I think we can drop the '4' here.

Why is only one PWM exposed if the PMIC has for of them? Why number 4
and not one of the others?
