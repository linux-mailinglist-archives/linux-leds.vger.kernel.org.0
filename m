Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB2A1182A9
	for <lists+linux-leds@lfdr.de>; Tue, 10 Dec 2019 09:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfLJIqL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Dec 2019 03:46:11 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50657 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfLJIqL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 Dec 2019 03:46:11 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so2183287wmg.0
        for <linux-leds@vger.kernel.org>; Tue, 10 Dec 2019 00:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=Sf2jzUQoJx+vkdqL3Lrl+slAij3PSJ+0kod67p8yXiM=;
        b=ZpTaFHhm9dc14a/4WDLVIs2VKBqLSnQ+v9eUkru5nC84kp56SK9CNXOsUVQo4W4SWG
         MhqCGKmlka4dIKzCIlSURDyy3Y8CvBvuAr4PdzV5bRNcRHf5+p6B0ymIoxLHlCYxZ9kc
         f1dwEEEhR8c8/MRBDGZPp4aDRWeu3VlMwwcIU8BKnHOGrIq3VQnuaMDsGMKuTk/qidrx
         3ykAFtNO87Uft4mvdEYhO8yHB1sRCwyb9Cyl5uw4OcgP7go7+QDmdYHCWK5miFrnHIgS
         7qC4GJGFE+RXdg0gkJ2jIJDyi7OOA1wEgkSOQEqstc2r1DX6h/Ya668VzlqkyKRGYHJy
         WPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=Sf2jzUQoJx+vkdqL3Lrl+slAij3PSJ+0kod67p8yXiM=;
        b=QVx7zTNs1/nhqX69ZV0cfa5w+tmohaM7Petxpc1obarUFYPDU1r5fWoPDSgLin4PQm
         1CufRQxk/KCdoQ2kHMlh4p3/eQjlcT4aLGYVGm7esesWLiWTytwo94IDlHfGydWqHPF0
         dLFQloP/D4LUivLVPVvZC3IN9nyVqoqatk1aPNsp4xc0XLY3I8z5mFnfbwVvAG8YAFsG
         qllCtMYy43P6D5hCxjdSG+BpOt5NicG2cX5KUZdwRwmVxqesKmpP9kb32+s5Pgq5N20K
         A/IQcC3nj5WgVv1t0NS64QsT/X3eSgypnhiIWZc9KHyml2A5ejK2GeYA/H/Y4bso8AdD
         O6gg==
X-Gm-Message-State: APjAAAXMt+W3DEoiTtYw+28Wt+5UW2EI5J3/f3Fr/8xdIK1Trp6b9mmf
        KRXorhxbsKkHfOsGpCihVv4AAA==
X-Google-Smtp-Source: APXvYqyk5qy6VoKY1LQKfssShX2LSxPWL/GaGs6aTZNiVFgrozRQX1bZ+nLDnmYuV/dGj8Kq6vF3bw==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr3689313wml.74.1575967569240;
        Tue, 10 Dec 2019 00:46:09 -0800 (PST)
Received: from dell (h185-20-99-176.host.redstation.co.uk. [185.20.99.176])
        by smtp.gmail.com with ESMTPSA id o4sm2380233wrw.97.2019.12.10.00.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 00:46:08 -0800 (PST)
Date:   Tue, 10 Dec 2019 08:46:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grigoryev Denis <grigoryev@fastwel.ru>,
        Axel Lin <axel.lin@ingics.com>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mfd: update TI tps6105x chip bindings
Message-ID: <20191210084603.GO3468@dell>
References: <20191121142726.22856-1-TheSven73@gmail.com>
 <20191121142726.22856-3-TheSven73@gmail.com>
 <20191209123206.GI3468@dell>
 <CAGngYiX4hgEM7cjeLE-sRswDXTff92OqdBWNgx5WGNmPjuqsUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGngYiX4hgEM7cjeLE-sRswDXTff92OqdBWNgx5WGNmPjuqsUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 09 Dec 2019, Sven Van Asbroeck wrote:

> Hi Lee, thank you for the review.
> 
> On Mon, Dec 9, 2019 at 7:32 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > > Tree: next-20191118
> >
> > Why is this in your commit message?
> 
> I have been posting patches against various maintainer trees lately, which
> will not apply to mainline or next. So I have been including base tree
> information in the patch itself.
> 
> Base-tree info on patches is high on developers' wish list, but not yet
> standardized. This was discussed at the 2019 kernel maintainers
> summit:
> https://lwn.net/Articles/803619/

NB: I haven't seen this discussion (or opened this link just yet).

It's no problem to have it in the submission, but it would be better
to have it *below* the '--' with the diff, such that if it is applied,
it doesn't end up in the kernel's Git history.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
