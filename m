Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F29911A023
	for <lists+linux-leds@lfdr.de>; Wed, 11 Dec 2019 01:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbfLKAo4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Dec 2019 19:44:56 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44173 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfLKAo4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Dec 2019 19:44:56 -0500
Received: by mail-lf1-f66.google.com with SMTP id v201so15229976lfa.11
        for <linux-leds@vger.kernel.org>; Tue, 10 Dec 2019 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vxe3R5EVIXOlzXfg/ekg4fF+ZY9IvaW7g6YuHiA6CRc=;
        b=MtyeG8RpnpRGMdHyeEPGILjfxKzcweWjFHPnZnPKGrFC89h32clJMupq6IVPMFKjIj
         gOeCDnC7nFYvShxcl11BGmqnpkE0ipUZXu3xM6Jidjp1LySuANUWWCitzYibKMYfvWG1
         X1dvYxmajrxJPXeE9qG5K0USO0k/bPEeJpx6HsPEPGy1Vl6tmElflipIQZNvgvcRDfEz
         SYDSjIP8HkM6mjRFvP1HY5WnFHD4ZK+w6bTmrXu0iRwf6dpv9ylEpnrlCFSTeWitv/IO
         Q7peiKQcOi7HYEcvYEhxZSQSrV0XcqSLQtkL7vje6t8GWlJruym/eFAOowG1osU80Onk
         +0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vxe3R5EVIXOlzXfg/ekg4fF+ZY9IvaW7g6YuHiA6CRc=;
        b=O/vZjOQOtWYHLsE2I8mOD1Otak4K5yzeAobRt3tM3Q/gcOy1JWTD7N5cfXMgMted1y
         5KaHECYnTGDHUyTScFaE+WYZG8gyOTPoWZLE1O0Mgpm4x+ymujht+rdBjVi1ibyXFprq
         B2BLG73BM/IzEgpAGfvtbjLZGYlx/QmHvxWuv4OgIPh+5Q3G9YFxSfVfHGPM5odV1wQs
         PubcABtODCe/tNDVRFYFnLRNnX6KQzjMZrcV8cA6QNLLxc6M+RCcmIt5CvPTMI7Xfgdx
         nI28vMu8AnBVCIu1tTREXGVgEJtaBXkQZ3MAPawNvIFSqWlZ6n9xnkVf561m4h2Y5IGT
         X5kQ==
X-Gm-Message-State: APjAAAVMv4QKyBLXFEia6iM6lQojX4oQnU8InJorj4Dy36JkCGDhKVtG
        RHifJRa6/OM6uOIwxbZnP6V/WFXBJsCTzTxcmWRpLg==
X-Google-Smtp-Source: APXvYqyzkVpMJI7AkzWZi2reeD8NSrXhhAftpTMTQWujAo4UvyYRUUGGNKIP2kxrZNb+IPDOetsu2JxL4GfMINwTvD4=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr408358lfm.135.1576025094524;
 Tue, 10 Dec 2019 16:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20191205212501.9163-1-jacek.anaszewski@gmail.com>
In-Reply-To: <20191205212501.9163-1-jacek.anaszewski@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 11 Dec 2019 01:44:43 +0100
Message-ID: <CACRpkda220vtWPRkkKX+gSPsTuA+VjmKhCDTn8ZeLrkrLd3u8w@mail.gmail.com>
Subject: Re: [PATCH] leds: gpio: Fix uninitialized gpio label for fwnode based probe
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Dec 5, 2019 at 10:25 PM Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

> When switching to using generic LED name composition mechanism via
> devm_led_classdev_register_ext() API the part of code initializing
> struct gpio_led's template name property was removed alongside.
> It was however overlooked that the property was also passed to
> devm_fwnode_get_gpiod_from_child() in place of "label" parameter,
> which when set to NULL, results in gpio label being initialized to '?'.
>
> It could be observed in debugfs and failed to properly identify
> gpio association with LED consumer.
>
> Fix this shortcoming by updating the GPIO label after the LED is
> registered and its final name is known.
>
> Fixes: d7235f5feaa0 ("leds: gpio: Use generic support for composing LED names")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
