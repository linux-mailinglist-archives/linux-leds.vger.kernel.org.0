Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8C9460B99
	for <lists+linux-leds@lfdr.de>; Mon, 29 Nov 2021 01:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232478AbhK2AaO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Nov 2021 19:30:14 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:33695 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241060AbhK2A2O (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Nov 2021 19:28:14 -0500
Received: by mail-ot1-f50.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso23235731otf.0;
        Sun, 28 Nov 2021 16:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gpxsLU6o1Yq28IvHM8hocQq391YFp9KWdpHzvMtrL3c=;
        b=6We+qih5AkdQClLdmr/xE0djAE6Ul5ZtMpL0Kmo9A0EpOFUDlkl8dzOMSyZt2n+LN9
         V0xM+Qq+y05pMppCMTKEoSf3K/BJV3RQWaYDpyiWrMdlwq63qMGIYXw/P5WviOe62XEY
         QKAnKGrZ2xZ78PXioK1eHh6Fn3aNIgiPX5N8pINx80JBEUM3GcSW2z2bfAo2TYQ/wKTr
         +Maf+DwddE57qg1R26f4M8Tj9aE/SUK6fDEuOmLivnSxhCfiDXFdK1b2pPcqVDMz5stS
         xoP9cPDAkqp+G5X/P88YXgh0Cvb0adsb+0gnNiGFq6rK/zTM9p7/jVq3fNmhwYqI0wSO
         GZOA==
X-Gm-Message-State: AOAM531gPD8OFqwiTpQG9VxyPlbaHxERpvHTibpufJ1W9WAPlv0ad4bP
        PHTcjLU8jDkj5LjJ5sxyMg==
X-Google-Smtp-Source: ABdhPJyEZsw2qHoboCT4LrMarGV5mtt2ZYCTg2tcgA7wYu841PQ1G8u9xoP52/RDscxcu1bC2U3Lxg==
X-Received: by 2002:a05:6830:12c3:: with SMTP id a3mr42299961otq.24.1638145497026;
        Sun, 28 Nov 2021 16:24:57 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.242])
        by smtp.gmail.com with ESMTPSA id bn41sm2638724oib.18.2021.11.28.16.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 16:24:56 -0800 (PST)
Received: (nullmailer pid 2883129 invoked by uid 1000);
        Mon, 29 Nov 2021 00:24:53 -0000
Date:   Sun, 28 Nov 2021 18:24:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
        Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add Allwinner R329/D1 LED
 controller
Message-ID: <YaQd1bSS3VCvvj5l@robh.at.kernel.org>
References: <20211119054044.16286-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119054044.16286-1-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 18 Nov 2021 23:40:42 -0600, Samuel Holland wrote:
> The Allwinner R329 and D1 SoCs contain an LED controller designed to
> drive a series of RGB LED pixels. It supports PIO and DMA transfers, and
> has configurable timing and pixel format.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v3:
>  - Removed quotes from enumeration values
>  - Added vendor prefix to timing/format properties
>  - Renamed "format" property to "pixel-format" for clarity
>  - Dropped "vled-supply" as it is unrelated to the controller hardware
> 
> Changes in v2:
>  - Fixed typo leading to duplicate t1h-ns property
>  - Removed "items" layer in definition of dmas/dma-names
>  - Replaced uint32 type reference with maxItems in timing properties
> 
>  .../leds/allwinner,sun50i-r329-ledc.yaml      | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/allwinner,sun50i-r329-ledc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
