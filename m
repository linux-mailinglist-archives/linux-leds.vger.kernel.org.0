Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C5752734
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2019 10:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbfFYIzj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jun 2019 04:55:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37222 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730860AbfFYIzj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jun 2019 04:55:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so16897086wrr.4
        for <linux-leds@vger.kernel.org>; Tue, 25 Jun 2019 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z+PEbZrcWsg/sfdRRqnH3yNiO1c5IQdDweuvUj+RdlY=;
        b=LpOvY4Y/Xp6kcxkeGGWl5Ga1uyDShUmNT0B0vb1XysMnFJ8OiNfztz6lJTuywUtAEp
         6RzYY+Cv1oy9edc0yZA05NhSucLvFXJHHr2JCpjV/0jMROnNLwQHwHdCDuoHrjaw937d
         CAYam5pvNQ131EpeGwGBFcU/a3P9F4w45uH15cjQ4R1P2OwSbesnRRNenYNhTOPm6/ly
         l7LHmB9FEwGB3uwEoH5HSaVIWjUowBs9NVKAEFrYwsMsG0itq++y6gNCbQo6u5gxop0E
         PHGu9LmJn8d6vw6buFXektsMC7UorgoL7C+ZRa4rYxkft6MpRruLR7POuz59WAvo1glo
         nAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z+PEbZrcWsg/sfdRRqnH3yNiO1c5IQdDweuvUj+RdlY=;
        b=fvhfDFSSUWYlnyz9mNDkujg2RgCsv6XOyfp4vQws91p+3o6RdFGNpxnh1LszmvT4hA
         96/AzOiRNG5sg8Bd4Tgl+Nbc5TIPwt2TNlHCja3/mLuYj3f0Oy8dIeyMFGPz1Dy6kpsT
         FyHhB0LE2sEymY+Sn4qhD+ZRZ0WV0Paz3PTTpDY2IM3s1yv2PRLkWwxBTPXa/L/Q40A7
         fZeaZrIwZ08laGWXB3I/YwHxkcWk/XqvMlJydMf43xTZdXmbUsN/KacadlYgAiJm93Xx
         5qA3nw2tsVHxJ0puV0DAkwuG2EeVDqnuSZIz5DEfoYmap6H6rlKAlqo34rQe5Mfi35LP
         EZfA==
X-Gm-Message-State: APjAAAUPeVBpGrZFQm4obMJT2O30eLjMPsbllwU4+YWAGzQnCnIn72tP
        et3TIYegZgCPtiyh/I9qQPON5g==
X-Google-Smtp-Source: APXvYqxFEeOqm4oLNY5l5ka6WBRsFT3+qsMRNi25s2VSLy6UfyHaCehvfuHvOlO6Kx6fFOy37zXAJA==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr105800458wrj.66.1561452936808;
        Tue, 25 Jun 2019 01:55:36 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id o6sm2163440wmc.15.2019.06.25.01.55.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 25 Jun 2019 01:55:35 -0700 (PDT)
Date:   Tue, 25 Jun 2019 09:55:34 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Brian Dodge <bdodge09@gmail.com>
Cc:     pavel@ucw.cz, lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, pbacon@psemi.com
Subject: Re: [PATCH 1/2]    dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
Message-ID: <20190625085534.xf2ullyju3ewbgik@holly.lan>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Jun 25, 2019 at 12:05:28AM -0400, Brian Dodge wrote:
>     The vendor-prefixes.txt file properly refers to ArcticSand
>     as arctic but the driver bindings improperly abbreviated the
>     prefix to arc. This was a mistake in the original patch
> 
> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> ---
>  .../bindings/leds/backlight/arcxcnn_bl.txt         | 24 +++++++++++++---------
>  1 file changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> index 230abde..9cf4c44 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> +++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
> @@ -1,8 +1,12 @@
> -Binding for ArcticSand arc2c0608 LED driver
> +Binding for ArcticSand arc family LED drivers
>  
>  Required properties:
> -- compatible:		should be "arc,arc2c0608"
> -- reg:			slave address
> +- compatible: one of
> +	"arctic,arc1c0608"
> +	"arctic,arc2c0608"
> +	"arctic,arc3c0845"

This is more a question for the DT folks than for Brian but...

AFAICT this patch is fixing the binding for the ArcticSand devices to
use the correct value from vendor-prefixes.yaml and has been previously
discussed here:
https://lkml.org/lkml/2018/9/25/726

Currently this patch series just updates the DT bindings but the
implementation also honours the old values (since there is a Chromebook
in the wild that uses the current bindings).

Hence I'm not clear whether the bindings should document the deprecated
options too (e.g. make it easier to find the bindings doc with git grep
and friends).


Daniel.


> +
> +- reg:		slave address
>  
>  Optional properties:
>  - default-brightness:	brightness value on boot, value from: 0-4095
> @@ -11,19 +15,19 @@ Optional properties:
>  - led-sources:		List of enabled channels from 0 to 5.
>  			See Documentation/devicetree/bindings/leds/common.txt
>  
> -- arc,led-config-0:	setting for register ILED_CONFIG_0
> -- arc,led-config-1:	setting for register ILED_CONFIG_1
> -- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
> -- arc,comp-config:	setting for register CONFIG_COMP
> -- arc,filter-config:	setting for register FILTER_CONFIG
> -- arc,trim-config:	setting for register IMAXTUNE
> +- arctic,led-config-0:	setting for register ILED_CONFIG_0
> +- arctic,led-config-1:	setting for register ILED_CONFIG_1
> +- arctic,dim-freq:		PWM mode frequence setting (bits [3:0] used)
> +- arctic,comp-config:	setting for register CONFIG_COMP
> +- arctic,filter-config:	setting for register FILTER_CONFIG
> +- arctic,trim-config:	setting for register IMAXTUNE
>  
>  Note: Optional properties not specified will default to values in IC EPROM
>  
>  Example:
>  
>  arc2c0608@30 {
> -	compatible = "arc,arc2c0608";
> +	compatible = "arctic,arc2c0608";
>  	reg = <0x30>;
>  	default-brightness = <500>;
>  	label = "lcd-backlight";
> -- 
> 2.7.4
> 
