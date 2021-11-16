Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE39A453817
	for <lists+linux-leds@lfdr.de>; Tue, 16 Nov 2021 17:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbhKPQxW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Nov 2021 11:53:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:55490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237079AbhKPQxS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 16 Nov 2021 11:53:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9989D61549;
        Tue, 16 Nov 2021 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637081421;
        bh=mariJGJLRCU1V8U+1zEQDC5Ctn63ipS/SXz7gKdrEJY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=URYP1lNgzTC7I0AONpafX2DmXTz/LIpjEjSlEj6zUe6r98sT1Uq5Q8TVH0nR6Y6hj
         PxSYXxaxYEYy3AWKu0e27AcRZdELlwc64BRZsbYfU0f0mItA32Z+aYxKSTvRGua5nW
         +l/16Zc5umP+RVX+1AC7hwjiWfBS0HaACNqSqExEh9pzqStgjAIjD3IabAuGV3gdWz
         7tb/+Mf/6lF2Jxg58V0JxhO7foZJAyPP5/BWvnby69wes1OXhN2mXMaSCtRqtpeLi4
         s21SNqlBuNAXp4EiNRUPxkRvhQYra7FIms6cQQXmhVUN2GCchZ8wtzFd7nzCJLUV+/
         FJecgFbodz2mw==
Received: by mail-ed1-f41.google.com with SMTP id r11so26879409edd.9;
        Tue, 16 Nov 2021 08:50:21 -0800 (PST)
X-Gm-Message-State: AOAM530qnI7oqlLdm3SGnfMYlAt1mINm1QH+hCzN3muw3yixp9VlWK+m
        Re3+HaCZr0SoOqhoEVStcAUr5A3d1nxLFe8OAw==
X-Google-Smtp-Source: ABdhPJwpeeor9bitplv96OWutWrM/OLr2WsQy9llndEbBRodAS9WBBUdGUQgDXJ0BT5D5eEOLQjQxhlVbVhuQKqgH9g=
X-Received: by 2002:a17:907:16ac:: with SMTP id hc44mr11230766ejc.363.1637081419992;
 Tue, 16 Nov 2021 08:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
 <20210716081731.80118-3-gene.chen.richtek@gmail.com> <20211115140343.GA13493@duo.ucw.cz>
In-Reply-To: <20211115140343.GA13493@duo.ucw.cz>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 16 Nov 2021 10:50:08 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com>
Message-ID: <CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com>
Subject: Re: [PATCH v15 2/2] leds: mt6360: Add LED driver for MT6360
To:     Pavel Machek <pavel@ucw.cz>,
        Gene Chen <gene.chen.richtek@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
        =?UTF-8?B?c2h1ZmFuX2xlZSjmnY7mm7jluIYp?= <shufan_lee@richtek.com>,
        =?UTF-8?B?Y3lfaHVhbmco6buD5ZWf5Y6fKQ==?= <cy_huang@richtek.com>,
        benjamin.chao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Nov 15, 2021 at 8:04 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Fri 2021-07-16 16:17:31, Gene Chen wrote:
> > From: Gene Chen <gene_chen@richtek.com>
> >
> > Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> > 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> > moonlight LED.
> >
> > Signed-off-by: Gene Chen <gene_chen@richtek.com>
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
>
> Thanks, applied.

Now linux-next is broken:

Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114.24-25
syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385:
Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
Error 1

I may have reviewed this, but the last 2 versions didn't go to DT list
and no checks ran.

Rob
