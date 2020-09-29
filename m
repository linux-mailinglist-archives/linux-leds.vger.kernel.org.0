Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF1C27D593
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 20:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgI2SON (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 14:14:13 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45516 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgI2SON (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 14:14:13 -0400
Received: by mail-oi1-f195.google.com with SMTP id z26so6470637oih.12;
        Tue, 29 Sep 2020 11:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2pY6YdUnvEYqApq4CXITI5udZ87iG0DZFB3zjU5P3uY=;
        b=gUuh5t+BpDHF0KL/6HO9DB6qC1xIZmjaX+oWyIZXWCNpjbVTxUak0rWwx22BAcUy+M
         nbumoIOd7YtC61aMwhZ3+g9aT34Wl/5H7Kc6pabVAAEsZfcfdS4+yacppeoTxq/d60DX
         hGN5Ge4xsyyV8H5y0L97RFlrRXxdeCnqHY0QxGXkVEjtEK/FU2OLS22zFhvFlxhGVjvt
         Hg/oNpXxV0pVDm+qSTPQFKPclfhuyc7nsZrT8T8qqyvjzG+OWIKXvNFs4hWp7tDL5j9U
         dcb4ZIAAXnN9LCR9C0M5iPTvO3nqNdp4MUWZZx1VDjOmQKdAYhlgz4aqLdtKlv76SIZw
         1asg==
X-Gm-Message-State: AOAM5319t6jhpSLZIs8VST8dKPBlycJ3gDE8bU7r9dkCf59IS+s2RJEG
        7Xb6NHTZG6lB53K9Alj/SA==
X-Google-Smtp-Source: ABdhPJyuk35FUV08XKInZct1/gwj5OdUGIjkl5RryGjGgYkUH5NMW8D/1tW5PDcoBSOYbqfnM5xzig==
X-Received: by 2002:a05:6808:b15:: with SMTP id s21mr3297380oij.52.1601403250974;
        Tue, 29 Sep 2020 11:14:10 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l3sm1224367oth.36.2020.09.29.11.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:14:10 -0700 (PDT)
Received: (nullmailer pid 892392 invoked by uid 1000);
        Tue, 29 Sep 2020 18:14:09 -0000
Date:   Tue, 29 Sep 2020 13:14:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Markus Moll <moll.markus@arcor.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 2/2] dt: bindings: pca9532: add description of pwm and
 psc settings
Message-ID: <20200929181409.GA890687@bogus>
References: <1570334746.101942.1600803234657@mail.vodafone.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570334746.101942.1600803234657@mail.vodafone.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 22, 2020 at 09:33:54PM +0200, Markus Moll wrote:
> These properties allow users to configure the PCA9532 blink rates.
> 
> Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
> ---
>  .../devicetree/bindings/leds/leds-pca9532.txt          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-pca9532.txt b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> index f769c52e364..3aa05eca9df 100644
> --- a/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-pca9532.txt
> @@ -11,6 +11,14 @@ Required properties:
>  		"nxp,pca9533"
>  	- reg -  I2C slave address
>  
> +Optional properties:
> +	- nxp,pwm: array of two 8-bit values specifying the blink duty cycle
> +	  fractions of each pwm (default <0 0>)
> +	  The duty cycle is pwm/256.
> +	- nxp,psc: array of two 8-bit values specifying the blink period of
> +	  each pwm (default <0 0>)
> +	  The period is (psc+1)/152 seconds.

I believe we have standard properties for LED patterns now.

> +
>  Each led is represented as a sub-node of the nxp,pca9530.
>  
>  Optional sub-node properties:
> @@ -26,6 +34,8 @@ Example:
>    leds: pca9530@60 {
>      compatible = "nxp,pca9530";
>      reg = <0x60>;
> +    nxp,pwm = /bits/ 8 <128 128>; // 50% duty cycle
> +    nxp,psc = /bits/ 8 <151 37>; // 1Hz and 4Hz, respectively
>  
>      red-power {
>        label = "pca:red:power";
> -- 
> 2.25.1
