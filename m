Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B75F33E16E
	for <lists+linux-leds@lfdr.de>; Tue, 16 Mar 2021 23:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhCPWbn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Mar 2021 18:31:43 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:44850 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhCPWbg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Mar 2021 18:31:36 -0400
Received: by mail-io1-f50.google.com with SMTP id 81so38946169iou.11;
        Tue, 16 Mar 2021 15:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WJtR43SK9y60MrC+iBaP+BHM7QH0U5+Z7I60Fr5nGiY=;
        b=lbrvb2fEj3y9S5SLhGV1O6UYsArV31TKRWOxRaHVxF8dhJExIfTQPbWXA9f5GdCc+y
         kCBCr7Vim67UQvuD6tyzH6k9loXPFgDcV0ZadgrQBRp2iR8bpnAWkkIPGKbCnwBTyybC
         lzZidAJRgFBJ8WhWw686zmDTviAQNEgtuv1Lc3QqEq6UJ3UE3aAQH5x2XhpCGZAyzHch
         lQybt4VFBqSepCe0JL4dMdRQxMapwUns+9/Pu2ilt+1YLlFw3PzTQoNTi1qhETQndxtL
         ssz7AYQLN45e4e1zirhG2AIcO3ujgdT4KOETR+v+h6WAzJqw41cUX4IJcEwcjFU9JaWD
         SjOA==
X-Gm-Message-State: AOAM530AyL8hTdB4cSJLIfHdlW+1Wk85FO7n1Lf0CRgBcDce02LNYWF5
        wcKWblCPtpBA5b9oIaI9Tg==
X-Google-Smtp-Source: ABdhPJwqr9lIBsQQqXGB/5M8cR/LbXNj5reci6RYP1hiUnw7QedPkqiHU4o1DmnBVFHru7RgPTsOVg==
X-Received: by 2002:a02:c610:: with SMTP id i16mr711846jan.36.1615933885246;
        Tue, 16 Mar 2021 15:31:25 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l14sm10091179ilc.33.2021.03.16.15.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 15:31:24 -0700 (PDT)
Received: (nullmailer pid 3803467 invoked by uid 1000);
        Tue, 16 Mar 2021 22:31:22 -0000
Date:   Tue, 16 Mar 2021 16:31:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
Message-ID: <20210316223122.GA3800914@robh.at.kernel.org>
References: <20210310070025.9150-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210310070025.9150-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Mar 10, 2021 at 08:00:25AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> The old regex allowed only 1 character to follow the "led-" prefix which
> was most likely just an overlook. 

Indeed.

> Fix it and while at it allow dashes in
> node names. It allows more meaningful names and it helpful e.g. when
> having the same function name with 2 different colors. For example:
> 1. led-power-white
> 2. led-power-blue

No, node names are supposed to be generic and reflect the class of 
device.

> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> index 7ad2baeda0b0..ae46a43e480f 100644
> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> @@ -21,7 +21,7 @@ properties:
>  patternProperties:
>    # The first form is preferred, but fall back to just 'led' anywhere in the
>    # node name to at least catch some child nodes.
> -  "(^led-[0-9a-f]$|led)":
> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":
>      type: object
>  
>      $ref: common.yaml#
> -- 
> 2.26.2
> 
