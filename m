Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41DCD1E352A
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2020 04:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbgE0CBF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 22:01:05 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:35816 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0CBE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 22:01:04 -0400
Received: by mail-io1-f68.google.com with SMTP id s18so10319090ioe.2;
        Tue, 26 May 2020 19:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F/zr+LlqqJd93CeXOiLT1YGsNK37J/3f8I4dWqfZ2nM=;
        b=uJg0lG9/1Qf1t0ih98IXFnBNSRlPIXjCBfNo1+UgwwNtNpNzKoycidhnERneQRk0vp
         J9CRNyJrCB2FQk1Zxf1CTAuzXsueS/XbPqa7xlC341vOhrIWgexPKnYWodexSMewu9x3
         /xWrA32Sm2EuPLmG55LP3KN5IcjJnOOvrRflXZeAo/Ep9PCBCdyjBOSJecxCvKJO81sA
         xdo7CeIn2NELgJrQsAoyoQ4Jwr+RF8WC9O7XEu2hPNxMd1p2peHvz/WIKkvHmlA6w4y2
         IYMO6C5YwkcXmbJocFohp66vT1QeNkVkRp5vz1r3WuVT6uslxIXvwvb6RdvdoXyty6mP
         I9Nw==
X-Gm-Message-State: AOAM530ipNAMsAp1HS7oHcnduwByewmNXPjYkXz3HF9LMBTA4YCPmFhb
        soXQUlFP3i2n00b3ZnWbSA==
X-Google-Smtp-Source: ABdhPJwRexlF8h8MO/YVoG7aR1AUg21O8r+BKhpOleaMogFSyAPl5WyD3V2M+xTsWmdUSSnnNOKsdw==
X-Received: by 2002:a05:6638:252:: with SMTP id w18mr3797053jaq.17.1590544863696;
        Tue, 26 May 2020 19:01:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y13sm655527iob.51.2020.05.26.19.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 19:01:02 -0700 (PDT)
Received: (nullmailer pid 893153 invoked by uid 1000);
        Wed, 27 May 2020 02:01:01 -0000
Date:   Tue, 26 May 2020 20:01:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v25 06/16] dt: bindings: lp55xx: Update binding for
 Multicolor Framework
Message-ID: <20200527020101.GA891065@bogus>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-7-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200526164652.2331-7-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, May 26, 2020 at 11:46:42AM -0500, Dan Murphy wrote:
> Update the DT binding to include the properties to use the
> multicolor framework for the devices that use the LP55xx
> framework.
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Tony Lindgren <tony@atomide.com>
> CC: "Benoît Cousson" <bcousson@baylibre.com>
> CC: Linus Walleij <linus.walleij@linaro.org>
> CC: Shawn Guo <shawnguo@kernel.org>
> CC: Sascha Hauer <s.hauer@pengutronix.de>
> CC: Pengutronix Kernel Team <kernel@pengutronix.de>
> CC: Fabio Estevam <festevam@gmail.com>
> CC: NXP Linux Team <linux-imx@nxp.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.txt  | 149 +++++++++++++++---
>  1 file changed, 124 insertions(+), 25 deletions(-)

Convert this to schema first because it's going to need to reference 
the multi-color schema.

Rob
