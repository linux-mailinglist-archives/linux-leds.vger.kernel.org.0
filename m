Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9424ACBD84
	for <lists+linux-leds@lfdr.de>; Fri,  4 Oct 2019 16:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388937AbfJDOjO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Oct 2019 10:39:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40490 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389239AbfJDOjE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Oct 2019 10:39:04 -0400
Received: by mail-wr1-f67.google.com with SMTP id l3so7515507wru.7
        for <linux-leds@vger.kernel.org>; Fri, 04 Oct 2019 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=YSJx2AVpZIhH/SmIkBCouxV6Yw+6RdyUnfQbUQg9xHo=;
        b=PsT/Hu4bN1kmMpoS7Yly/JpXitObRi+4sbIGKFaai/teDTC9OsWJHnN90FDzXMmGgu
         vDzmp+y7NDwNf0Su4i1PgkqpGAWXTLkHU2uXngFzosjFEGJm9iyWqkLHpebJx31+UEAJ
         0ilVeTNjLXs6Qq7bLksNbUK5Jq3BV7phYGxtv7wur3XKDa13A531Xm8I7saFpPKrTP6A
         bfI2eLNE5whWj5eKAbahdxGsKH6Z8jk7GpBRJg2p3GUO5HCtk9JODApjwH6OxufpB4Ps
         pXQcjPf66zltB8NNV25hQh2tnppa4/upLtnyfWVk0qsDEe5ejnPtflbSph2LNW9wX0sP
         q+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=YSJx2AVpZIhH/SmIkBCouxV6Yw+6RdyUnfQbUQg9xHo=;
        b=IsWEQkhNUpF3NqIQlhJ1o+tzLo6o4cxn2fVTLjhYe+8vi0eA/zX6/GKKvX+O8cyyup
         q4pPVd2EzujaiBrwbBSoVfCJ7KW9HUtZvQzwCEZS68I6bHE4k/9Y2g5wIxZtpX+4sM/F
         uAMLF88WTp/06KLLHQxAuZPlub7MTct91pemZyRlikwW4k7q+OLOLPyyY+nxxpisjfqI
         vzugvpCRMlNfYexEaVcn/KaqsRQPOMmCYxckQivE20knij1Y5zogTUQHGEESK2H220Wx
         cXWl2lEK2dBz2V+NuAxfosnpYHU2DKw5nLKJRM8xP5wHrAzVeYmzgzbzpG4rawCJ9BJ5
         WlEg==
X-Gm-Message-State: APjAAAVFWI1roy82SAqLqI+XPKSTSEcJuRqLU9JiUZtBDJay4k8T2QlC
        RPf4dYSx4P83UYKpT+/GuLnNNQ==
X-Google-Smtp-Source: APXvYqzWsK19yzkIkp4GiYmqNcrSqqri+QClnftj1qCLCnM7D7Z/q2g2MF9SygafVBX8aUWGmDkoOg==
X-Received: by 2002:a5d:48d0:: with SMTP id p16mr2445899wrs.83.1570199942428;
        Fri, 04 Oct 2019 07:39:02 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id o4sm1065292wre.91.2019.10.04.07.39.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 07:39:01 -0700 (PDT)
Date:   Fri, 4 Oct 2019 15:39:00 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v7 5/5] backlight: add led-backlight driver
Message-ID: <20191004143900.GO18429@dell>
References: <20190918145730.22805-1-jjhiblot@ti.com>
 <20190918145730.22805-6-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190918145730.22805-6-jjhiblot@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 18 Sep 2019, Jean-Jacques Hiblot wrote:

> From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> 
> This patch adds a led-backlight driver (led_bl), which is similar to
> pwm_bl except the driver uses a LED class driver to adjust the
> brightness in the HW. Multiple LEDs can be used for a single backlight.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/Kconfig  |   7 +
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 drivers/video/backlight/led_bl.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
