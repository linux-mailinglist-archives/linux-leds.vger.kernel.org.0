Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 882A0250B92
	for <lists+linux-leds@lfdr.de>; Tue, 25 Aug 2020 00:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHXWV6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Aug 2020 18:21:58 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43929 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgHXWV5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2020 18:21:57 -0400
Received: by mail-io1-f65.google.com with SMTP id s1so10438581iot.10;
        Mon, 24 Aug 2020 15:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HpXqLEs8eq8CnFuePFbsaPw/4gNKLcGm8cN6g5HaO/Y=;
        b=BuSm0NOteXNoDsUaXcGErbtGzBHkYctVHE7gnMfm8btJlGNO4lJLF+6gL8ZL9synw9
         mu2ZuGiBxbYMne3oTk907nGytcqU7MRFeUC5v//hpaIsOGsobNvCvGy68vPs0zpJyL6F
         Je7UxNsHuRcJAKWMVT3K7d2nJmA92mHrmnIsJTX5xbNNYutr7LRifpLngwrfT/B5vfVp
         N7MUtiBgAfVrZGaMKVokMvSE4oER+tN762cLNNNp+2RkzLT3Sy1/4y0hx3WiKflgMNpy
         xFGMd9iqEW4VoL+yQXroQWs7Hj73MIpShJfjWEQIibppv5HzaRM50teTMmVBr36DJfmg
         lO3Q==
X-Gm-Message-State: AOAM532hH40upz0lycHOpfN7hPMkyh+Ij4UVmlPsvlEqVpnDXi1TzOz2
        l8WUDnHTZ0cXvisAwtseww==
X-Google-Smtp-Source: ABdhPJyAsy9/gCtzYJlEu23h7nJFsyNQGwP4wLzftbw/oFPSfiFCfFrcFRhQENx14Unflu6NLIpU9g==
X-Received: by 2002:a02:9f87:: with SMTP id a7mr7474361jam.35.1598307716802;
        Mon, 24 Aug 2020 15:21:56 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id q1sm7268485ioh.0.2020.08.24.15.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 15:21:56 -0700 (PDT)
Received: (nullmailer pid 3423089 invoked by uid 1000);
        Mon, 24 Aug 2020 22:21:54 -0000
Date:   Mon, 24 Aug 2020 16:21:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Grant Feng <von81@163.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] leds: Add an optional property named 'sdb-gpios'
Message-ID: <20200824222154.GA3421740@bogus>
References: <20200808033731.15695-1-von81@163.com>
 <20200808033731.15695-2-von81@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200808033731.15695-2-von81@163.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, Aug 08, 2020 at 11:37:31AM +0800, Grant Feng wrote:
> The chip enters hardware shutdown when the SDB pin is pulled low.
> The chip releases hardware shutdown when the SDB pin is pulled high.
> 
> Signed-off-by: Grant Feng <von81@163.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-is31fl319x.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
> index fc2603484544..e8bef4be57dc 100644
> --- a/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-is31fl319x.txt
> @@ -16,6 +16,7 @@ Optional properties:
>  - audio-gain-db : audio gain selection for external analog modulation input.
>  	Valid values: 0 - 21, step by 3 (rounded down)
>  	Default: 0
> +- sdb-gpios : Specifier of the GPIO connected to SDB pin.

We normally use 'shutdown-gpios' for a shutdown GPIO.

>  
>  Each led is represented as a sub-node of the issi,is31fl319x device.
>  There can be less leds subnodes than the chip can support but not more.
> @@ -44,6 +45,7 @@ fancy_leds: leds@65 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  	reg = <0x65>;
> +	sdb-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
>  
>  	red_aux: led@1 {
>  		label = "red:aux";
> -- 
> 2.17.1
> 
> 
