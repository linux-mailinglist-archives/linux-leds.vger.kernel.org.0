Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91120178E8
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2019 13:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbfEHLxc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 May 2019 07:53:32 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55252 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbfEHLxc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 May 2019 07:53:32 -0400
Received: by mail-wm1-f65.google.com with SMTP id b203so1737368wmb.4
        for <linux-leds@vger.kernel.org>; Wed, 08 May 2019 04:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lQpYdKueKd5GodvUSuXNOvFoEgO6IktebbFb9QN9iWA=;
        b=AykjrtNqhwZKTNyKdi3loPGsyOQ6pj6vMupWy72eN3oJnHqGLGcu3N4HSjLt6+F9B/
         sXQP5z3gHPaE36AnKDkgHDwgrHW95o8rv7UJHhpY2j32hgC/BDwGF5Dy3xx+aKgdPxDq
         m2bP5sY219WiO1MRcLKWD6QMIEDN6/rIrfuZ/olk4HbYwV1ECPMkgonPEHbs6NJB6Kat
         8gcmLnzQ0ULxTePPDXi/Cz6zVyLjoRcGbkDdbhvE0D+lBMN3Ah7kw3ii2F7mfn8TRbra
         lerPjTbi7INob6Ci8zBxyjpAJ6xAmlyZ9JuqW7gbzqUyA8/n6mNr/EpjHv7D9FMANs0I
         tqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lQpYdKueKd5GodvUSuXNOvFoEgO6IktebbFb9QN9iWA=;
        b=ELgvYOLuTE4EZIcWW5mt5B5V5xM3eEfGf1uuN41zVomQOhL0Qa0rvPA5U4Uz7mY+zt
         FsXlK00mtFxfyQpph9ZO/g0w2Iwi1tgW4JYp2h3ShorY4seGQNgS3Wz1gJ0xHC0BPas+
         dAMLR0vUvrAFKHvKcSj7+lVvzanjf4TNymh9xJhPkS3QLgz1Tz9aX6idhlQaBE/08Grs
         JKF/EWnxvED0kAgADCnKqgJk5c8RkE5VV1jW0f6UQ5kcqenLtfAlFX5PKDCHJAqfmzhi
         GE2g0M5XSPvuqNwEwqw3x6skNjIIzhNHm7Gj6J4IEZ2+FmXREa0pj29ZWfYqDGNHXPui
         tDcg==
X-Gm-Message-State: APjAAAXZVM5WChY+YLNVIKsjNaPq2Ekag0vDKpkCKgYlmUe6ZL70PD1Q
        bBz7LjRZuvXhz6tMLTOF2C0KiBSHJzo=
X-Google-Smtp-Source: APXvYqxHUiE2SWdc0d3qosb62vYh2L55jvapOGaR1hhteA8wydi1budIpEccC8GDTAtWGKYT1zyPcQ==
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr2614038wmj.121.1557316409784;
        Wed, 08 May 2019 04:53:29 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id d4sm34521361wrf.7.2019.05.08.04.53.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 04:53:29 -0700 (PDT)
Date:   Wed, 8 May 2019 12:53:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, rdunlap@infradead.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/6] mfd: ti-lmu: Add LM36274 support to the ti-lmu
Message-ID: <20190508115327.GO31645@dell>
References: <20190507201159.13940-1-dmurphy@ti.com>
 <20190507201159.13940-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190507201159.13940-4-dmurphy@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 07 May 2019, Dan Murphy wrote:

> Add the LM36274 register support to the ti-lmu MFD driver.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  drivers/mfd/Kconfig                 |  5 ++---
>  drivers/mfd/ti-lmu.c                | 14 ++++++++++++++
>  include/linux/mfd/ti-lmu-register.h | 23 +++++++++++++++++++++++
>  include/linux/mfd/ti-lmu.h          |  4 ++++
>  4 files changed, 43 insertions(+), 3 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
