Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A69107374
	for <lists+linux-leds@lfdr.de>; Fri, 22 Nov 2019 14:40:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfKVNkI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 22 Nov 2019 08:40:08 -0500
Received: from mail-pg1-f178.google.com ([209.85.215.178]:46860 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKVNkI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 22 Nov 2019 08:40:08 -0500
Received: by mail-pg1-f178.google.com with SMTP id r18so3346392pgu.13;
        Fri, 22 Nov 2019 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=544kcmMiCqtSjCBQu6R15oO53g7kg6Y6+1cat5y7nTQ=;
        b=PS5FZoQcmIwO9sPfyjUUlO5iDUYj99d46+dLMSXaHEeBNAyfiE1AVY29iK0W89+1Dx
         3o/rQIWDEIIPFLFv0yQsIIXCO6XQW3WT+AK/oC1hMgCLCHtynD6zMrvbD8PmqHxtPkhT
         zEcKRxCUlmPnvit9HmZ/ap8LrzT4BQRZe7xzoquSHiTutVQJ8hAGRnYNpHkW8FQEBxbD
         k4csC81Us6mov58Jwkh9aw0ZwXfoqPISqv6c7AQ4QL144ws6IGNmc7lexJxeY9nur20n
         GsDNeDwoGMNDLDMVS1zoO/mWSa4WG3TPbe9N2fQUBe5jI3a+gE8imLhUJvySaTuGSg7/
         4adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=544kcmMiCqtSjCBQu6R15oO53g7kg6Y6+1cat5y7nTQ=;
        b=jCf1lMQJ6V4YsRVnEpEU7L4Q7J5fNrgma7UD9MAHnS92EWYx9+2YgXmn9G3jcBBUd/
         l90r+HdFOqS6ycNbYmh4CYwWKRWZqgQZeqxvM5RC9OYWdNVbr561Yv9jVMkFmCNL7xf2
         HnIveQqr3E+sr1O2M6pgqZQWnJpYON35uUXHw3bRynR7Qk2HeZMarL6ajzy+a2ygE7q3
         9aRnRpm1Tum5vCqv2r7aw7tGXVHgfNXvpR7imx3xnThS9MH4l7f6y8R3jRdIcgsHDfTV
         007L/6lxkJb76ROhWaO8GeT84AUQlmmBVsQWuoNoTX8z90ciLIoRO3/GhPjg5hfp9wMd
         XGyQ==
X-Gm-Message-State: APjAAAUETvg4VYz0cOBW94VO+JR2itGLDlipdZFNnKVaz+7RICcENONm
        GuLpjEzSycrbMTs/tSQNd5UylqXmFB60D82PmEg=
X-Google-Smtp-Source: APXvYqw9ERYQwgfZpqcCRHZw+wkqE/xLzsHv80DAmZSb1Xyt1FBW6S2llKP15ZqNu0UwTfOTI38IAs1GwpxJbtyjIzM=
X-Received: by 2002:a62:75d7:: with SMTP id q206mr17094429pfc.232.1574430007362;
 Fri, 22 Nov 2019 05:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20191119154611.29625-2-TheSven73@gmail.com> <applied-20191119154611.29625-2-TheSven73@gmail.com>
 <20191122073124.GA3296@dell> <20191122133230.GD6849@sirena.org.uk>
In-Reply-To: <20191122133230.GD6849@sirena.org.uk>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Fri, 22 Nov 2019 08:39:56 -0500
Message-ID: <CAGngYiWzQS84MqW29xJXkYpC7QwudKGZAVGTSd1QtX3dJMmD1g@mail.gmail.com>
Subject: Re: Applied "tps6105x: add optional devicetree support" to the
 regulator tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>, Axel Lin <axel.lin@ingics.com>,
        Dan Murphy <dmurphy@ti.com>,
        devicetree <devicetree@vger.kernel.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Nov 22, 2019 at 8:32 AM Mark Brown <broonie@kernel.org> wrote:
>
> Sorry, I completely missed that this was adding a MFD file - the binding
> only mentioned regulator stuff and I clearly didn't look at the
> filename.  Do you want me to drop it?

I didn't put "mfd:" on the patch title line, adding to the confusion, sorry.
I'll roll that into the next patch version. Except if the patch is acceptable
to Lee as-is.
