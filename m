Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FF4BD5CD3
	for <lists+linux-leds@lfdr.de>; Mon, 14 Oct 2019 09:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbfJNH5a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Oct 2019 03:57:30 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38132 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbfJNH5a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Oct 2019 03:57:30 -0400
Received: by mail-wr1-f67.google.com with SMTP id y18so9003933wrn.5
        for <linux-leds@vger.kernel.org>; Mon, 14 Oct 2019 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wlueTYL+8qZ9KSvaC2J4g2+SKGmj7tj869xGKKDwlhM=;
        b=EFZRMeDamau/PtjDTr3QllzMuLdqjBy/NYciSuFN+qIKgsX0Ot88ouA4V4VQ6UOMQG
         rWcI4kDhiK/io9dxf0zDYfHtSar7xjwL5WQEmucaF+ZqA2yfOGgkG8MlP4eq8kYcYh6M
         BV2DH+dladA+Iwa/7WEfoQWfy5qiHAzjwQP36mGz/BOraRyD/CEjY8f3SjfBYhYHafeo
         3Y8ostev2sEjqCZQ75hoFrs+xlgITGw50ztSPEyHM6GZprKYHasX7j9i5s5o+UIcbCB+
         Zv1gq2qmSvnoO7wpK3/3tyJGIUuBRXfHCXi/FCDYEkw/P4cXcx/KgDIBfW+E8PittOnW
         iSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wlueTYL+8qZ9KSvaC2J4g2+SKGmj7tj869xGKKDwlhM=;
        b=MxqQVj0nsvs/y3jkxhl7uVXPgioNhkEdbH+8YDdBh3Z230GOZHrPa/K6D+3kIiwPLw
         pnRP0ndTpjSgPTT/UK/MuvZVdcGrT9SVfBBAwJZkAwH9yoYI0kmKYMvR8Mjr1IXz7q4x
         ArW33KC7H/ObjuPXZIm0OIDgW2wsgKzc5pjtYgw6v5DjY0G9fTauq84wO11HyNNSxLsD
         8J1w6J+uP5Qz1RFWt32YW1tdNsfkq/xZz1ub9yD372BrikdyXV6yzGTk6frwrkKBXN0u
         RQEQZcr3aH1PnjGG2XZK66Pq6eE+1SuP0AtAgZA/x7PkTHYQwKvKbsniYcm9rvLe1a4+
         Isyw==
X-Gm-Message-State: APjAAAVHfjbdogD2HzkmIFSPqFBjaZZH/xImVbfsQf/DMO/O9StdAvV+
        EqCbtTGBY7Gebu9zjVAfQ+lcZg==
X-Google-Smtp-Source: APXvYqz1dQ+ediHiuUw3Ev4YeRHAcaUSBjOankgR/wtJRQ2BlmnBskvUcofomJfjQciB18XzBY6BAA==
X-Received: by 2002:adf:f5c2:: with SMTP id k2mr26018100wrp.0.1571039847065;
        Mon, 14 Oct 2019 00:57:27 -0700 (PDT)
Received: from dell ([2.27.167.11])
        by smtp.gmail.com with ESMTPSA id r2sm39324299wma.1.2019.10.14.00.57.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 00:57:26 -0700 (PDT)
Date:   Mon, 14 Oct 2019 08:57:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v7 5/5] backlight: add led-backlight driver
Message-ID: <20191014075725.GI4545@dell>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-6-jjhiblot@ti.com>
 <20191004143900.GO18429@dell>
 <cef282ee-3659-3bc3-da25-db02f843d61c@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cef282ee-3659-3bc3-da25-db02f843d61c@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 04 Oct 2019, Jean-Jacques Hiblot wrote:

> Hi Lee,
> 
> On 04/10/2019 16:39, Lee Jones wrote:
> > On Wed, 18 Sep 2019, Jean-Jacques Hiblot wrote:
> > 
> > > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > 
> > > This patch adds a led-backlight driver (led_bl), which is similar to
> > > pwm_bl except the driver uses a LED class driver to adjust the
> > > brightness in the HW. Multiple LEDs can be used for a single backlight.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > > Acked-by: Pavel Machek <pavel@ucw.cz>
> > > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > > ---
> > >   drivers/video/backlight/Kconfig  |   7 +
> > >   drivers/video/backlight/Makefile |   1 +
> > >   drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++
> > >   3 files changed, 268 insertions(+)
> > >   create mode 100644 drivers/video/backlight/led_bl.c
> > Applied, thanks.
> 
> It will break the build because it relies on functions not yet in the LED
> core (devm_led_get() for v7 or devm_of_led_get() for v8)

You're right, un-applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
