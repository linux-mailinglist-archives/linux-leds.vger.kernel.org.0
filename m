Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2413A310F82
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 19:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbhBEQYu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 11:24:50 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:39513 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbhBEQWN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 5 Feb 2021 11:22:13 -0500
Received: by mail-ot1-f45.google.com with SMTP id d7so5463540otq.6;
        Fri, 05 Feb 2021 10:04:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mTp6A1qwozX0Q2N8eolLgHis2iIcQhU+LJihP8ASbJA=;
        b=gI4LDvJH5OWgUayKUTjuxig0pTEuwdYVT9TRgkO4o8CwuK8jaPIrHfiWP9EY4ybVfX
         fdbe8hTpy3UNWW3+vkYeStz/2svgd3S5UUSKax2rYeJ9G7+MdOlFaY4pwWgsKbDTwu57
         4HLJwaTDjIJKt/0sB8J63nN8C5U9X20znN49jk0EUsBxvrfpOhoohJn1eZ79tB8EqmGp
         ht1OhZnvdn+zlSLJs5aHnpQVRm6a3Uf3I8Eo6tYxV00UpKkOlS2DyWFSia6NVoKee+O+
         Z5E4qZ9PCC2HWlCRGzZFZEjqq6IeHbP+9xHEWjEZ1gGdEQ7YoNMNSLbEqIKFD3RE+p/p
         clog==
X-Gm-Message-State: AOAM530w9NK+4EJPaaKXOdIhVSRd2RlvDikwFmXaZmR+nL3Eu7Jy05yM
        eAytz3lpUYLxWzbdGwTiw3WlrTGNUA==
X-Google-Smtp-Source: ABdhPJytB3er9J2lOXgWY854+pW1GYcoVQ9S+fZk9WlwQ0ZWHz4lx7Re0rLsDiwt6vUbaYyJJX90FQ==
X-Received: by 2002:a9d:6383:: with SMTP id w3mr4139805otk.225.1612548221824;
        Fri, 05 Feb 2021 10:03:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q7sm1808059oif.1.2021.02.05.10.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 10:03:41 -0800 (PST)
Received: (nullmailer pid 3387050 invoked by uid 1000);
        Fri, 05 Feb 2021 18:03:40 -0000
Date:   Fri, 5 Feb 2021 12:03:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] leds: lp50xx: remove unused regulator
Message-ID: <20210205180340.GA3378994@robh.at.kernel.org>
References: <20210203083305.2434-1-schuchmann@schleissheimer.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203083305.2434-1-schuchmann@schleissheimer.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 03, 2021 at 08:33:05AM +0000, Sven Schuchmann wrote:
> The regulator for vled-supply is unused in the driver.
> It is just assigned from DT and disabled in lp50xx_remove.
> So the code can be removed from the driver.

The binding is not a driver. Does the h/w have a 'vled' supply? If so, 
then it should remain in the binding.

> 
> Part 1 updates the documentation
> Part 2 removes the code
> 
> Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> 
> ---
>  Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> index c192b5feadc7..c20a81d13bfd 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -43,9 +43,6 @@ properties:
>      maxItems: 1
>      description: GPIO pin to enable/disable the device.
>  
> -  vled-supply:
> -    description: LED supply.
> -
>    '#address-cells':
>      const: 1
>  
> -- 
> 2.17.1
> 
