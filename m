Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 533BCCCE24
	for <lists+linux-leds@lfdr.de>; Sun,  6 Oct 2019 06:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725298AbfJFEGl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 6 Oct 2019 00:06:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55795 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfJFEGl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 6 Oct 2019 00:06:41 -0400
Received: by mail-wm1-f67.google.com with SMTP id a6so9221264wma.5
        for <linux-leds@vger.kernel.org>; Sat, 05 Oct 2019 21:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kryo-se.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+uS9Iq71Nly9kmaIRhpKoadRKleDiTGevpR+ZqAHZYs=;
        b=jZqezZwxlS1YPn3bnr2v8C+R//3noxn9wJo0ifbD3Awy0DneqE5CfAYeBsGAxQXEcg
         z9VfNYXAYUKjzl2IBtO6LXg42/mObp6PzhkYUSpzhvf++owcp3wd8PzQ50LJfqeyQwpm
         v9+TWTvTee7WGOhUSjJkTdjf92a3G41x+SycJ+a906UaXjpn6Gc+2RwVpPVKzGjD/ong
         LP1Kz452WqGEHAC+JGjeunFW/jq3BTTgNj5+l8Z9kZxn2tMlcjo/zjDcW69BMfCn/tT2
         CbEJKuDyrQo4eznCf6XYm4NMIZ0J87Qq9Ylr5qW3IbWP7vEGqLAX1/4TbKcDEQVRSEjF
         4vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+uS9Iq71Nly9kmaIRhpKoadRKleDiTGevpR+ZqAHZYs=;
        b=gGuFVBLpoSVu3Zkh4p+3TGbz102mWvTEDAtNH6upenfK13RiSdncdw+hV/an37sRsx
         1onMLX0BTbevncLnR3PJodzd4h8a8kBn1sVs99CGqEsF+miaKJ/sM3x95UtqKHx5vRMc
         eXOIJcuN7ZIjB+7a7RenhwixnSwFsbrbLLiWELNFziFv11qSFhIeJOEIWhAwcxFusp6M
         fhq7fLMJCIXl2Ah5ItLOsVODPt+P0LPHdYyjnZW3goTYUWRlE3gIoHHVymKGd5WDZYK/
         uNNPF2wK9Xt55s95GjTymONDw0pCSdzJSB1g0ldW1PHVo5v4+Dm2/aKHPx2/UORuYIof
         9qrQ==
X-Gm-Message-State: APjAAAUv/BpWWCw/1evCBOK2R9MbaKD4L+xB9EMk64W1z1mV6m5U4gmD
        AEv9+sOEHELKuZSKJDp5QKXSHGTeIPQHuqfCux9cOg==
X-Google-Smtp-Source: APXvYqzEjmlx23LtZHhnO3vtMsvETtbJjdLbCfcHSKDCsRMmSQBSg9oiIqS4iPSDy8osUQPM2B4w3iaWv7ryaF8Pm2M=
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr15381822wml.157.1570334798953;
 Sat, 05 Oct 2019 21:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1570203299-4270-1-git-send-email-akinobu.mita@gmail.com>
From:   Bjorn Andersson <bjorn@kryo.se>
Date:   Sat, 5 Oct 2019 21:06:27 -0700
Message-ID: <CAJAp7OhLtWm4kToH2L39ZczEFZcvU82F4ZVdCO0D4JKOsgCGDA@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: support multi-level brightness
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Oct 4, 2019 at 8:35 AM Akinobu Mita <akinobu.mita@gmail.com> wrote:
>
> Currently, GPIO LED driver allows the GPIO properties to contain one GPIO
> phandle.  This enables to contain more than one GPIO phandle and the
> brightness of the LEDs is proportional to the number of active GPIOs.
>
> Describing multi-level brightness GPIO LED is only supported in DT.  It is
> not supported in ACPI and platform data.
>

This looks interesting.

I have a half-baked driver for the NXP PCA9956B; which is a 24-channel
LED driver, each channel with brightness control. With these LEDs
mounted in a line (like on my devboard), an interface for setting e.g.
a percentage and have the appropriate number of LEDs light up seems
like an interesting thing to pursue.

So I think this would be better represented in some more generic form,
perhaps a trigger?

Regards,
Bjorn
