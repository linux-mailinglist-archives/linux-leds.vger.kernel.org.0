Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8DFDF0D29
	for <lists+linux-leds@lfdr.de>; Wed,  6 Nov 2019 04:42:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfKFDmI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 5 Nov 2019 22:42:08 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37686 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfKFDmI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 5 Nov 2019 22:42:08 -0500
Received: by mail-ot1-f67.google.com with SMTP id d5so7600811otp.4;
        Tue, 05 Nov 2019 19:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sUzou7nm3+h5Nog2SILrIw3hOq4AAUw3wk7D48f6f9E=;
        b=J8obnx141Qoa3/g2Ugy8HmiSVyEb9Ijxk85MyyPtbXrQLoGZefiu0r5FpdhofJnB6I
         /15GcLcKytXYSjJ0ecAOMhhCf/LWB+TUWNtZ0/bIyVR/3VOLywpzsJ4cCdtxC0Gq3Ybs
         eejbfnyIBT+m+iPKvBUt94D6T9MoAdeZIccxh1AoCxTnJxo0v4ybMQR/Kl6QcXL1Wnwp
         zpIPgMXqq1YWpmsQJgYzTtr/BcqN0+X36bkRxxKt+FxqfulvOsz1No8/2LksUgIzRfzf
         qKaVm1DH3Rl/0nwCfZfAee/7FHvM1fKwXpUSdRGw1qbMJAVtxL/hA1TJnk7q86KXu5j9
         iNTg==
X-Gm-Message-State: APjAAAWooeIuSrham1GgkR/DHZAd8UaLR4jNN5R6W7aKGn/dqZn9VDfH
        k1y4KNGDooxAy/9YF4ioFA==
X-Google-Smtp-Source: APXvYqwUV6RFvARpSfB4zpl/i7CUMTJhvg1A13ghNfgJ0S+DOQ+NTMpRGGJY9xSkzf+EVUAXUvZ96g==
X-Received: by 2002:a9d:854:: with SMTP id 78mr189460oty.284.1573011727551;
        Tue, 05 Nov 2019 19:42:07 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm7270106otr.7.2019.11.05.19.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:42:06 -0800 (PST)
Date:   Tue, 5 Nov 2019 21:42:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] dt-bindings: an30259a: example for using fixed
 LED node names.
Message-ID: <20191106034206.GA6299@bogus>
References: <cover.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
 <5b9f9e7cd3dc959962fc43d27e471245e63f5f29.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9f9e7cd3dc959962fc43d27e471245e63f5f29.1572351774.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Oct 29, 2019 at 02:47:26PM +0200, Matti Vaittinen wrote:
> Use predefined LED node name to match the LED node in driver.
> 
> It would be nice to offload common LED property parsing to
> LED core driver. One of the key things to allow this is somehow
> 'pair' the LED DT node with LED driver initialization data.
> 
> This patch uses LED node name as a 'key' in a same fashion
> as regulators do. The an30259a was selected as demonstration
> example and this change may not be really feasible for an30259a
> as I have no idea whether the existing DTs for devices out there
> have specific node names (or can be changed). This servers just
> as an example to initiate discussion as to how we could pair the
> driver data and DT node.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-an30259a.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-an30259a.txt b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> index cbd833906b2b..bd1a2d11a0ad 100644
> --- a/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> +++ b/Documentation/devicetree/bindings/leds/leds-an30259a.txt
> @@ -9,7 +9,8 @@ Required properties:
>  	- #address-cells: Must be 1.
>  	- #size-cells: Must be 0.
>  
> -Each LED is represented as a sub-node of the panasonic,an30259a node.
> +Each LED is represented as a sub-node of the panasonic,an30259a node. LED nodes
> +must be named as led1 led2 and led3.
>  
>  Required sub-node properties:
>  	- reg: Pin that the LED is connected to. Must be 1, 2, or 3.
> @@ -34,20 +35,20 @@ led-controller@30 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
>  
> -	led@1 {
> +	led1 {
>  		reg = <1>;

This is wrong. reg requires a unit-address and vice-versa.

>  		linux,default-trigger = "heartbeat";
>  		function = LED_FUNCTION_INDICATOR;
>  		color = <LED_COLOR_ID_RED>;
>  	};
>  
> -	led@2 {
> +	led2 {
>  		reg = <2>;
>  		function = LED_FUNCTION_INDICATOR;
>  		color = <LED_COLOR_ID_GREEN>;
>  	};
>  
> -	led@3 {
> +	led3 {
>  		reg = <3>;
>  		function = LED_FUNCTION_INDICATOR;
>  		color = <LED_COLOR_ID_BLUE>;
> -- 
> 2.21.0
> 
> 
> -- 
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
> 
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =] 
