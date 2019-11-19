Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68B5B102BAB
	for <lists+linux-leds@lfdr.de>; Tue, 19 Nov 2019 19:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfKSSV7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Nov 2019 13:21:59 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42254 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfKSSV7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Nov 2019 13:21:59 -0500
Received: by mail-ot1-f68.google.com with SMTP id b16so18752277otk.9;
        Tue, 19 Nov 2019 10:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JfzziSNNMmEFsbhda9+/4c2ILxfCbHBsfgRUy2MjJWU=;
        b=SH0uGZC01tdYMEz6LpYA6biKmc2Hu1kifZ2cGPpjzzktIWCUgfLFxBET3Ufg6aOnQP
         yB/9XfuqMZ/ffDAwPwV7Qea0PEFXW59up34NnL+BcJUgZ9vvpDbYH5MUYmR75HjhL9kU
         7nE/hybqTrr9mvwYloiqTGlm2I68ZqW+RntK2nmjii/IWdvHzKDgYyWolx609XsPlbpD
         RcuvEJv97XQ/O/irvmnuKZmrgI68gOojz4z+GD+Is3dRMQqWfbW8UwPoZYIHJTsXZzmX
         DjgM4TBoxIeuClkpijbTmSmKz8DTba39UpeQF1dT5SmgGqvufymHhPcl66ncyODb+9vh
         3Yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JfzziSNNMmEFsbhda9+/4c2ILxfCbHBsfgRUy2MjJWU=;
        b=f8C15Jw7vhnTgjsz4Xh0v254i1pxoA816d0cryi9kKjecww276w/r5WAkbn56SKxSO
         JXSflsZwu6Q+HgVOthfUC7OPuARMkBCHJSzfxQHfEMqRjM8KO7wvOS+ylbKE5lZCHSed
         oX4THxsx8m+YxiSDspr921vw8HXYEoS+oTUx50jAkSF7PkjvRq7b/WgRINuhmbYUgXeb
         lWd7DSVZhWhxPORlO8/A+xNOIobNvYGt7f+JQiZ15Aq5wKhG2Qewq2cGg7WCZRqjQbHn
         yVF6jpML7SbtuUnepC/CIsn2u0uZ9ssoMNKq7VY0Na4RrrsGiO1pUyotVXRTdCvyT8H1
         tyAg==
X-Gm-Message-State: APjAAAWTvEfB/kwlGM5EGcDb8RehmlAc8LUyLqzpgZw0cHucbw0UTzRK
        ZAaYoAnsGbt4JciM27jCl4Mo+ZYo19YyHVuU9dWwzQ==
X-Google-Smtp-Source: APXvYqyuaNkB+0CEnN+VngiKnTiURvUNAeRuesDrIcG9wmQK+WanO7o7TIS8umRR0r9GDDRZv4+uSYsQk5aL5WK1/RQ=
X-Received: by 2002:a05:6830:1e62:: with SMTP id m2mr4922972otr.116.1574187717824;
 Tue, 19 Nov 2019 10:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20191119154611.29625-1-TheSven73@gmail.com> <20191119154611.29625-3-TheSven73@gmail.com>
 <20191119181426.GE3634@sirena.org.uk>
In-Reply-To: <20191119181426.GE3634@sirena.org.uk>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 19 Nov 2019 13:21:46 -0500
Message-ID: <CAGngYiXoeCNTBO6fkLxaeECz4D9WY+7SfV8t743AOzoKCr2Cug@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] regulator: tps6105x: add optional devicetree support
To:     Mark Brown <broonie@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Nov 19, 2019 at 1:14 PM Mark Brown <broonie@kernel.org> wrote:
>
> This and the binding look good.  I think there's no interdependency with
> the other patches and I can just apply them?

That's right, things should continue to work as they did before.

Thanks for the guidance on this patch series, appreciate it !
