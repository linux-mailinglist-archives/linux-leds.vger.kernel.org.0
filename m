Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821051815D4
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2020 11:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgCKKaw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Mar 2020 06:30:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43611 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728917AbgCKKaw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Mar 2020 06:30:52 -0400
Received: by mail-wr1-f67.google.com with SMTP id v9so1855847wrf.10
        for <linux-leds@vger.kernel.org>; Wed, 11 Mar 2020 03:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LzaLKCBRIewXD3EaTa5hnO0VT8owm6vRQQh9HZJ8avA=;
        b=Q8iLXeBxiZgXJvA2vze2ga6XXLHnHiwXpcRBGb+97vDPoqWmHmYQNZD5qm5/UYrxEN
         cjwCR0pOyqqvz+obQOJ74UiEbO7YwyeOGWUXaBfM4aUNnRCAIQ9IE4r3C+JmrXVApEtN
         QfPbit0/lnZGYVi+UbvPMWvMtahu0kOMN1FY7tWEojQqHEJFot3f9/ECjN87ZRJokwqG
         2UsaMwgAolYMNAwFN3YLUN/BSxz17PzqJ2t4SXZFY+UzqWaGXWXRITvoP1q9aPlL8I0s
         56ZCsoZTUZMEuVHJtvwg/6Z8hd7DcKfTuDssaWskglPcGlBC0+0hPscKQR+14eNZKuhJ
         oaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LzaLKCBRIewXD3EaTa5hnO0VT8owm6vRQQh9HZJ8avA=;
        b=ZP+/IpgcxKDNwT4hLjvAS617PQu0Cu6vjrS2MBqnl7+XknDyHPju/Jlg5kZR2k6neX
         EuYQtoMocLL6ozCWiiY95GhRIzzWWW0LtK53exHIhhaIZFLkyx/oRL4JYBuDs4bNv3uN
         q6ofhJeGJHd92ct0t8e2fJMzwNOM3SxEnJVnNs47zHYTsBHYuPG8WDDUQqX84hkoATHS
         u1VFeE3xNqvcfqEtChVRai1JhzELTEZFSEsf+d4RaVInR6JJIYRWxvqmoRJnsOVsJNkc
         Ge8+ijGpwW3jbSQy6Vl+pJ/KR8Wp0Jz0saun2d1P4hlS/wKK/4/h5oiNw2v/oj5aEow0
         H2pA==
X-Gm-Message-State: ANhLgQ3rwQySR2qLi4VcfwpxXOJbLbKt1WHCmnV2aCwv40Ncb5yofh6g
        aoqqnbakLZc+HE0XC14E+K3xhw==
X-Google-Smtp-Source: ADFU+vuO9qK9g/2D1BMl3E61Zu+yTrfHT1j9G9JEFmGh20HcuAhscXtAx5vC28GPTMlL0pnuoxc5CA==
X-Received: by 2002:adf:ef44:: with SMTP id c4mr3720111wrp.404.1583922649952;
        Wed, 11 Mar 2020 03:30:49 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id f9sm18718612wrc.71.2020.03.11.03.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 03:30:49 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:30:47 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     kgunda@codeaurora.org
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V3 2/4] backlight: qcom-wled: Add callback functions
Message-ID: <20200311103047.v7rt5ii3saack22a@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-3-git-send-email-kgunda@codeaurora.org>
 <20200310152719.5hpzh6osq22y4qbn@holly.lan>
 <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05ab744dfbd83b6704bd394ce3c3dfc9@codeaurora.org>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Mar 11, 2020 at 12:11:00PM +0530, kgunda@codeaurora.org wrote:
> On 2020-03-10 20:57, Daniel Thompson wrote:
> > On Mon, Mar 09, 2020 at 06:56:00PM +0530, Kiran Gunda wrote:
> > > Add cabc_config, sync_toggle, wled_ovp_fault_status and wled_ovp_delay
> > > callback functions to prepare the driver for adding WLED5 support.
> > > 
> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > 
> > Overall this code would a lot easier to review if
> > > ---
> > >  drivers/video/backlight/qcom-wled.c | 196
> > > +++++++++++++++++++++++-------------
> > >  1 file changed, 126 insertions(+), 70 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/qcom-wled.c
> > > b/drivers/video/backlight/qcom-wled.c
> > > index 3d276b3..b73f273 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -128,6 +128,7 @@ struct wled_config {
> > >  	bool cs_out_en;
> > >  	bool ext_gen;
> > >  	bool cabc;
> > > +	bool en_cabc;
> > 
> > Does this ever get set to true?
> > 
> Yes. If user wants use the cabc pin to control the brightness and
> use the "qcom,cabc" DT property in the device tree.

That sounds like what you intended the code to do!

Is the code that does this present in the patch? I could not find
it.


Daniel.
