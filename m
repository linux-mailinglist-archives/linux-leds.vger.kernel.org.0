Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDC2C9D84
	for <lists+linux-leds@lfdr.de>; Thu,  3 Oct 2019 13:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729823AbfJCLke (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 3 Oct 2019 07:40:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36205 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCLke (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 3 Oct 2019 07:40:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id m18so2046363wmc.1
        for <linux-leds@vger.kernel.org>; Thu, 03 Oct 2019 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=gjHdxQE7PtU5YVyM+ycu+GpQGZRZGPXn8KLYV2GOEKk=;
        b=M4k7ZEaOrA5MBGW706POYnYF+p7UCzDpRDmB6KUX786TBU7kDYHUX5qgxshhoqyUQ8
         2h+yx+Wrx3YZkGDqFvQM2n76bQMi7hxDFFVRmqdFwDtmKDBHC0C1V4WbKZFFpmSKiNtk
         2dDq1dnYh8JFNYqnHUtvtgqPNTQxV5Pv+CQn+T2oHQ16zT6sk/3UJx4EkxEqfx6KIdLx
         JZwOvG9EH0TosRqhoWm+SWsNlwtJ0dPhJgNY7whXqUyetzZhUJ0nuNyMddCsl/BYp3T0
         IvpjkPZwd5ju/73exB5nEx++DHrubLvNaxZaAJuxkCLT7fv/3wBFAohiAaM+yy6nNT2g
         0oNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=gjHdxQE7PtU5YVyM+ycu+GpQGZRZGPXn8KLYV2GOEKk=;
        b=NZNaLMEho/JthTGZhJMre7vCUqrTIvznJHB8lBLcdZLD3nYSiPNTQudR1CGF8ew2vM
         VwCwYQNKXoyebyZV6j3bf7hu78XcFxfIuEwl+PHzB1AbQoaENEvCBhKgRuKS0RyKuSde
         RW0lWfXa0WJSAwQFdXNO7IS9l/sZqrplwrkbCPLnLqXxrsSlwIQpRgLK6bPEDd594Fbi
         1E/1D2HOaDn5j0LJjM5/D/YsFsz9Y6fkQYGZYdBAWAUng6+qdM5UrmB9DZ6as4UaF851
         8ZY48nd3Mbs8YddoIDmVxWMXoEs+3DByS6fQZGZHnoBmHCn39bmqFe5yOX1fbuOHsVPu
         L9aw==
X-Gm-Message-State: APjAAAVhHbXPsFAoLStPopiVX7fRwjk+4QtkfjpEi2NTap6aqFv4OjIx
        YyzObrFoyBLFmyvBDvF4yxfQNA==
X-Google-Smtp-Source: APXvYqzkSbKbEO08kV+O5J56dhn/FaSKA4qIomPodHv4axxtI0btIULXGYjMIdOtEj1HzR/N8fo89Q==
X-Received: by 2002:a7b:c932:: with SMTP id h18mr6111876wml.86.1570102832057;
        Thu, 03 Oct 2019 04:40:32 -0700 (PDT)
Received: from dell ([2.27.167.122])
        by smtp.gmail.com with ESMTPSA id q10sm5931600wrd.39.2019.10.03.04.40.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 04:40:31 -0700 (PDT)
Date:   Thu, 3 Oct 2019 12:40:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com
Subject: Re: [PATCH v8 0/5] Add a generic driver for LED-based backlight
Message-ID: <20191003114028.GC21172@dell>
References: <20191003082812.28491-1-jjhiblot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191003082812.28491-1-jjhiblot@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 03 Oct 2019, Jean-Jacques Hiblot wrote:

> This series aims to add a led-backlight driver, similar to pwm-backlight,
> but using a LED class device underneath.
> 
> A few years ago (2015), Tomi Valkeinen posted a series implementing a
> backlight driver on top of a LED device:
> https://patchwork.kernel.org/patch/7293991/
> https://patchwork.kernel.org/patch/7294001/
> https://patchwork.kernel.org/patch/7293981/
> 
> The discussion stopped because Tomi lacked the time to work on it.

[...]

>  .../bindings/leds/backlight/led-backlight.txt |  28 ++
>  drivers/leds/led-class.c                      |  98 ++++++-
>  drivers/video/backlight/Kconfig               |   7 +
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/led_bl.c              | 260 ++++++++++++++++++
>  include/linux/leds.h                          |   6 +
>  6 files changed, 399 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
>  create mode 100644 drivers/video/backlight/led_bl.c

How should this set be processed?  I'm happy to take it through
Backlight via an immutable branch and PR to be consumed by LED.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
