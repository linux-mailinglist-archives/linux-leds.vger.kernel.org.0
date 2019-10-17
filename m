Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 913DDDAE68
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 15:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732328AbfJQNab (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 09:30:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39059 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732391AbfJQNa3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Oct 2019 09:30:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so2375364wrj.6
        for <linux-leds@vger.kernel.org>; Thu, 17 Oct 2019 06:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rjaSf8zw6DTRcAsezcie89NERI7/xyB+gUZSDTVO6Jw=;
        b=vMOx91oGQ6DpKfU+vZ+lrtK+QQ/NbAKKsNcwAKY96DPNR6C61fyhwFCNVCqYpEaaKG
         Wss/xzTdFC6uoYn9y9wcN5SbDMnYxnCjnI/7kmV8tGSdqdKZjYCmRDCl8Biuw1U1G8CM
         G1dLvfs36VWgLTFXGfUk6/7Nz2bUYbY60eEahfaTU3AFGTwbR9f4v7Ho9j7jEBORgqT3
         aivbaWB/CaU6RcfK9vgqfqLyS4Czt4lSu7kyX1HHYYThhI5aUHgYBCQhpQHbajG77wPp
         fQaVZQ/C+/qHzfAEN3u0Hx8aWwlUoWVZ7fJ/YVFSorJBdpnVY8SfDDvWq9WZi3KfeRev
         owBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rjaSf8zw6DTRcAsezcie89NERI7/xyB+gUZSDTVO6Jw=;
        b=b+LfjZ7wMUTaYiBL5ZWeVhmpcLpVXsE5E6lg83JCKMBHKWmTDbFCn7kwpUu5mGmIO4
         pxBUs9jnDmF5q2nabmkWVKptoKP3rJ0KfQrOd9+FyUuPlr3GW3aurJGWvl8n3K+uIXek
         /kzjrJ1lBUgDpY9JlOccAylaEJAi1xyv1dgw5QoanI7cr2dAvxnN0/sCihN3j09SJ3LY
         BLiRKGTII2CVPYOt5WKFvcA2S5emoJtHB+K9o5Pr3sRnx5fJUZU0Y7R4ZvuNasKwT+5Z
         lhzWkhtx86TirTxJhHIOacdfmESzp0eyit/GWx6MNQ1IcSNHC9/7zbNqcyfzNq752JCH
         wzLQ==
X-Gm-Message-State: APjAAAX/d9vPICDziwiaO8GUYvkVE7RyhRuvyvjQqWCoq4T13GqBN6f5
        ZpQn22ORMUsxPL0LMO02TUdgvw==
X-Google-Smtp-Source: APXvYqyd8CrMZlUf79wYbN2VsKW/LdfXSXPM7CJxz3i3MZV7iVso3CgHyzrYbH5WQbsQ5uYN92rbpQ==
X-Received: by 2002:a5d:5587:: with SMTP id i7mr2888198wrv.289.1571319026750;
        Thu, 17 Oct 2019 06:30:26 -0700 (PDT)
Received: from dell ([95.149.164.47])
        by smtp.gmail.com with ESMTPSA id u83sm9732697wme.0.2019.10.17.06.30.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 06:30:26 -0700 (PDT)
Date:   Thu, 17 Oct 2019 14:30:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     kgunda@codeaurora.org
Cc:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        daniel.thompson@linaro.org, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH V7 6/6] backlight: qcom-wled: Add auto string detection
 logic
Message-ID: <20191017133024.GQ4365@dell>
References: <1571220826-7740-1-git-send-email-kgunda@codeaurora.org>
 <1571220826-7740-7-git-send-email-kgunda@codeaurora.org>
 <20191017122653.GO4365@dell>
 <689831a9d7561f51cdb7ea0a1760d472@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <689831a9d7561f51cdb7ea0a1760d472@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 17 Oct 2019, kgunda@codeaurora.org wrote:

> On 2019-10-17 17:56, Lee Jones wrote:
> > On Wed, 16 Oct 2019, Kiran Gunda wrote:
> > 
> > > The auto string detection algorithm checks if the current WLED
> > > sink configuration is valid. It tries enabling every sink and
> > > checks if the OVP fault is observed. Based on this information
> > > it detects and enables the valid sink configuration.
> > > Auto calibration will be triggered when the OVP fault interrupts
> > > are seen frequently thereby it tries to fix the sink configuration.
> > > 
> > > The auto-detection also kicks in when the connected LED string
> > > of the display-backlight malfunctions (because of damage) and
> > > requires the damaged string to be turned off to prevent the
> > > complete panel and/or board from being damaged.
> > > 
> > > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > > ---
> > >  drivers/video/backlight/qcom-wled.c | 410
> > > +++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 404 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/video/backlight/qcom-wled.c
> > > b/drivers/video/backlight/qcom-wled.c
> > > index b5b125c..ff7c409 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c

[...]

> > > +		if (int_sts & WLED3_CTRL_REG_OVP_FAULT_STATUS)
> > > +			dev_dbg(wled->dev, "WLED OVP fault detected with SINK %d\n",
> > > +				i + 1);
> > 
> > I haven't reviewed the whole patch, but this caught my eye.
> > 
> > I think this should be upgraded to dev_warn().
> > 
> Thought of keeping these messages silent, Because the string configuration
> will be corrected in this
> and informing it at end of the auto string detection.

[...]

> > > +	} else {
> > > +		dev_warn(wled->dev, "New WLED string configuration found %x\n",
> > > +			 sink_valid);
> > 
> > Why would the user care about this?  Is it not normal?
> > 
> Actually, it comes here if the user provided string configuration in the
> device tree is in-correct.
> That's why just informing the user about the right string configuration,
> after the auto string detection.

Then I think we need to be more forthcoming.  Tell the user the
configuration is incorrect and what you've done to rectify it.

"XXX is not a valid configuration - using YYY instead"

[...]

> > > +static int wled_configure_ovp_irq(struct wled *wled,
> > > +				  struct platform_device *pdev)
> > > +{
> > > +	int rc;
> > > +	u32 val;
> > > +
> > > +	wled->ovp_irq = platform_get_irq_byname(pdev, "ovp");
> > > +	if (wled->ovp_irq < 0) {
> > > +		dev_dbg(&pdev->dev, "ovp irq is not used\n");
> > 
> > I assume this is optional.  What happens if no IRQ is provided?
> > 
> Here OVP IRQ is used to detect the wrong string detection. If it is not
> provided the auto string detection logic won't work.

"OVP IRQ not found - disabling automatic string detection"

> > If, for instance, polling mode is enabled, maybe something like this
> > would be better?
> > 
> >       dev_warn(&pdev->dev, "No IRQ found, falling back to polling
> > mode\n");

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
