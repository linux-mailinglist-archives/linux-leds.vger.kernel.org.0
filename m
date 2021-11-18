Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FD0455E5B
	for <lists+linux-leds@lfdr.de>; Thu, 18 Nov 2021 15:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhKROlm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Nov 2021 09:41:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:50264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbhKROlm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 18 Nov 2021 09:41:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 138BC61A40;
        Thu, 18 Nov 2021 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637246322;
        bh=pD4G7qW+x2KbwwtQMCGnHfxLMGX7bM3IVbUSdTzZuoo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Nl335lEOgtonooJ1AmxqZ7gbLg2ZK4bE1yqe+Bu2OfQt/0hU8hVoTN7cuODAvARuO
         /oTUvMQkWowi6fH6yh9lHnIKSDCIil0ugwkY1nKPp9tputgevhuG9+NqSYl1aXhiSJ
         eQKaQBfJxIwS8B2MFxnArZ44v0RpQ4wyC+JouWZa0TBsMLZjfEpP/uOjbCiPYpA0o7
         lAQVbWU1Yy1s2clw9ojoKaRgdzPruZLN1CVtZ4epWel8RbNvBr18nUk/MG2Wpqqcmy
         aCpNn/12I977252NzAYDYn0rZnUssFZlk5lUdaU4yEmWSrKqCqV6uEd7OaZZ0Ny0Ad
         vGTBcLtck74+w==
Received: by mail-ed1-f44.google.com with SMTP id g14so27962026edb.8;
        Thu, 18 Nov 2021 06:38:42 -0800 (PST)
X-Gm-Message-State: AOAM533fb/4vrldDq6ZYK9CaTHRYaw8VZwlMMjfV+fvLEWEg3j9k2nlf
        /VPfbohi5R42NiSzZMgCEi41ETVYwcHlrXXuWQ==
X-Google-Smtp-Source: ABdhPJyOhXQHvTcURpMYCd+ExjovfdgFB53E0/G+tY3NoX68Ljj4B0aI15Jv0BevTj64Nx8D/hi2bSWPp2mlCQoC7kc=
X-Received: by 2002:a17:907:7f25:: with SMTP id qf37mr34307372ejc.147.1637246320480;
 Thu, 18 Nov 2021 06:38:40 -0800 (PST)
MIME-Version: 1.0
References: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
In-Reply-To: <1637133726-6581-1-git-send-email-u0084500@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 18 Nov 2021 08:38:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJim5emHCnP4JLbxuuPcaLYiW5e6g9GCq1iEUg4vvr+nw@mail.gmail.com>
Message-ID: <CAL_JsqJim5emHCnP4JLbxuuPcaLYiW5e6g9GCq1iEUg4vvr+nw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: Replace moonlight with indicator in
 mt6360 example
To:     cy_huang <u0084500@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Gene Chen <gene.chen.richtek@gmail.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Gene Chen <gene_chen@richtek.com>, wilma.wu@mediatek.com,
        benjamin.chao@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Nov 17, 2021 at 1:22 AM cy_huang <u0084500@gmail.com> wrote:
>
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Replace moonlight with indicator in mt6360 example to prevent the below
> build error:
>
> Error: Documentation/devicetree/bindings/leds/leds-mt6360.example.dts:114.24-25
> syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:385:
> Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml]
> Error 1
>
> Link: https://lore.kernel.org/lkml/CAL_JsqJRMVE163LaHTbtFARc4f_qg33bfQx+sD3ukce_xQF+gA@mail.gmail.com/
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> Hi, Gene:
>
> I saw you have removed LED_FUNCTION_MOONLIGHT in v14.
> But you may forget to remove it from the binding example.
>
> Please help to review this change.
> ---
>  Documentation/devicetree/bindings/leds/leds-mt6360.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
