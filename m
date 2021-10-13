Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D0042CDBD
	for <lists+linux-leds@lfdr.de>; Thu, 14 Oct 2021 00:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhJMWYr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 18:24:47 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:45730 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhJMWYr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 18:24:47 -0400
Received: by mail-ot1-f42.google.com with SMTP id l16-20020a9d6a90000000b0054e7ab56f27so5630173otq.12;
        Wed, 13 Oct 2021 15:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IZukGEHJvqlgWip19TMqoL0XVeuZEUX2PgpkS+yYC4s=;
        b=E2JwK/6+y6Y2fmj0ip4I7o0zmc9OAtiNNN2Qlw99qEQIyBN872M/T7VXTRsGmy9mL8
         2bMczh8ECLoy5nqeWTjVTC9ujvyvaAKOj5c0j+zJOVt/2kWK8y2H0DeKrg7M3bI+rjM5
         SHkxDz16dxATRKVp/YE1/1+3zAStvRsMm62isRVk3jDxbk76JF7IGzQfgNGvK/jywQYo
         9mFTNrcyjJEFHgct6HERSM7t8BY8UVGSas5OoOugO0xLSz0LbVq3HprDO9jeBZAIAlSA
         xIAsfBsVyvrYwngpAImCH8QlvENZcd5bHxfOde+6Xn6/2e5CL2gRXwSBhFxVL2td7MrT
         0tRw==
X-Gm-Message-State: AOAM531JLIIm3uGkTG0GBLcnXIp5uC2Z4R3oHWmQiL94UF4l7QWnddsp
        PQDHYQwehpK2rHFHMfCuXw==
X-Google-Smtp-Source: ABdhPJxCUVWH3jyuObrPrmBIeWTmDIxzsbUHA2Dhv0UeMr1/HiVBAzv5n6XJTm3+eYbIkvToriI93g==
X-Received: by 2002:a9d:71c5:: with SMTP id z5mr1585402otj.375.1634163763310;
        Wed, 13 Oct 2021 15:22:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 187sm217687oig.19.2021.10.13.15.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 15:22:42 -0700 (PDT)
Received: (nullmailer pid 1691002 invoked by uid 1000);
        Wed, 13 Oct 2021 22:22:42 -0000
Date:   Wed, 13 Oct 2021 17:22:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: leds: Convert register-bit-led
 binding to DT schema
Message-ID: <YWdcMv0g29RyBzQ/@robh.at.kernel.org>
References: <20210913192816.1225025-1-robh@kernel.org>
 <20210913192816.1225025-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210913192816.1225025-2-robh@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Sep 2021 14:28:09 -0500, Rob Herring wrote:
> Convert the register-bit-led binding to DT schema format.
> 
> As the example just repeats nearly identical nodes, trim it down to a
> few nodes and use some documented values for 'linux,default-trigger'.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> 
> ---
> v2:
>  - Drop undocumented linux,default-trigger values
> ---
>  .../bindings/leds/register-bit-led.txt        | 94 -------------------
>  .../bindings/leds/register-bit-led.yaml       | 78 +++++++++++++++
>  2 files changed, 78 insertions(+), 94 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/register-bit-led.yaml
> 

Applied, thanks!
