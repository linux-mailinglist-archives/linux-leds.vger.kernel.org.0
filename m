Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C11A1116E1F
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2019 14:44:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfLINoa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Dec 2019 08:44:30 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:39960 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLINoa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Dec 2019 08:44:30 -0500
Received: by mail-oi1-f193.google.com with SMTP id 6so6309734oix.7;
        Mon, 09 Dec 2019 05:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pdtrpdD1TKIjvb8irx4vWJg8+w04giYZXMmV837pN2g=;
        b=T/al3Bw8wn27lr3SLBgNIYFJs63fsI0DIaot21MQzkCVT4iZZT2NYjs5gJSJz4znGj
         8uHbiqVU0MyxiterYKYbi0iazUDeDA71H4Z33DYgRMdbEvSygujbrg0L+QUVoTlbBtku
         3oPvYqYbuFQUClKdzeI724fbXIX2lYSrVb+/EjYq20tF/8KPtPYcBh9VnhEVEvqVLpOe
         JdJKgXwu57YIVoWXwI1UMSJ++EQBYdOWDDBxFfaSBTfSk9C2EU/RY2d5kxpJMGcMG91x
         +zIev+3/ST2HH3ioHuzEMkQXsNzh2R8/XvEySepe1mr8h67Fs/EkyUwFEGNMBsO7bUkJ
         kTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pdtrpdD1TKIjvb8irx4vWJg8+w04giYZXMmV837pN2g=;
        b=DWwnSvgS7H4pvng+8dRmoYSx/g4zEsHa63wRT29FeLB+elSVbiB7roZY4U+ghNprFk
         ilkOLvg03vcQ8UcyYmoSY/8HMWgQO9rKDQP69K1xIel4U4OuOckZaFwDgkRk04TW36rj
         kZ6oXoDLZzTSYKORUvO8aNUjgLHSp+5J04QvAAnk3JBfyatmT6tO6s1w16/sUKNQrs8M
         iISlxK9UbBEBiRTPYrP+6afvu9X1em0ET1yxq0nvY9wP7B0oNVPAvrXoaLjc5rnh+OWL
         8bIPOpNO2C6n1tqbDftwC5RTKc1ubTDo8Tgxu98CmD5htRMtXQ59GDQ1KKF/2/9W3AAW
         YpRg==
X-Gm-Message-State: APjAAAX/gC54HHfxsfe6cbYg7peut0M3aC1lKNlpzEcebyxYqAu11tS0
        PVcsuVJJjTBMF03GULpLlvEejertypCzODAXnNE=
X-Google-Smtp-Source: APXvYqwZ7NMEhCMa1CsGy9xOP12ehMUrB/FCbl2ilogCpY1zCGGz6MQ/XHN66Y9YL/Qw/iNI5SRd5y+Jfz0YzL7xQTQ=
X-Received: by 2002:aca:3cc3:: with SMTP id j186mr23081279oia.169.1575899069062;
 Mon, 09 Dec 2019 05:44:29 -0800 (PST)
MIME-Version: 1.0
References: <20191121142726.22856-1-TheSven73@gmail.com> <20191121142726.22856-3-TheSven73@gmail.com>
 <20191209123206.GI3468@dell>
In-Reply-To: <20191209123206.GI3468@dell>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 9 Dec 2019 08:44:18 -0500
Message-ID: <CAGngYiX4hgEM7cjeLE-sRswDXTff92OqdBWNgx5WGNmPjuqsUA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
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

Hi Lee, thank you for the review.

On Mon, Dec 9, 2019 at 7:32 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> > Tree: next-20191118
>
> Why is this in your commit message?

I have been posting patches against various maintainer trees lately, which
will not apply to mainline or next. So I have been including base tree
information in the patch itself.

Base-tree info on patches is high on developers' wish list, but not yet
standardized. This was discussed at the 2019 kernel maintainers
summit:
https://lwn.net/Articles/803619/
