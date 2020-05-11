Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E631CE8E3
	for <lists+linux-leds@lfdr.de>; Tue, 12 May 2020 01:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgEKXM6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 11 May 2020 19:12:58 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:46431 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgEKXM6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 11 May 2020 19:12:58 -0400
Received: by mail-oo1-f67.google.com with SMTP id x16so2324336oop.13;
        Mon, 11 May 2020 16:12:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YDsjgW4MArlBA1SB+uZg3khyj2WK0GRuGD4JKeBynv8=;
        b=OvD1PtAqLFZSYqeXOJRIw1+jVbfNsbD9Ze/zWqKiTzrL3NYbehegJ5bvNMkKG3vYKp
         bCJdRr9BQZ5BxgMXV4pd1eM6YuWL+Pz7XrDuYcEe+AkC9+RF9tWHfcDFMCOwy6nUIbAy
         mo4mSevWP61/sxq89y09eky+53ju2goCLCY3n6Gh1YpVDAIEj9Fftd8fxB8UiGyw4zVq
         nu0wMqxKDOB0Iwr8MeYx7sHMdl2T+W4coDaH5wtRWPLsWXKAhmulIps/aotWHa65fVg+
         t4eoqpy8LhHnYGvGXOAO64D93s67s2Z/aBmebicgO8V90jpPoVr422BC36pxrdW3r/Z4
         6jTA==
X-Gm-Message-State: AGi0PubbRzk+Tyh4NUYMF7hoKyLxo/MS8szh1CzsV2MMv7L+udSZYICf
        ZYVGWKy9itWyM5Vf2RSc3g==
X-Google-Smtp-Source: APiQypJYcIJELa5zMY/ISbRUVZAa+Q7Ic4+PGG1ZB0L0pvzkPLwl0FKURFdszYQ9BrNGvh3O0VOGQw==
X-Received: by 2002:a4a:af0d:: with SMTP id w13mr3249600oon.77.1589238776873;
        Mon, 11 May 2020 16:12:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m65sm2138476oib.49.2020.05.11.16.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:12:56 -0700 (PDT)
Received: (nullmailer pid 11706 invoked by uid 1000);
        Mon, 11 May 2020 23:12:55 -0000
Date:   Mon, 11 May 2020 18:12:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: common: Drop enumeration for
 linux,default-triggers
Message-ID: <20200511231255.GA24112@bogus>
References: <20200427073132.29997-1-wens@kernel.org>
 <20200427073132.29997-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427073132.29997-2-wens@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Apr 27, 2020 at 03:31:30PM +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> The bindings currently list a very small subset of valid triggers for
> LEDs. Since many drivers or subsystems in Linux register custom
> triggers, the list would become very hard to maintain.

The idea was we'll consolidate around standardized names and that new 
users should use 'function' instead.

There was discussion around this when adding 'function'.

> 
> Instead, just drop the list and allow free form strings.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../devicetree/bindings/leds/common.yaml      | 21 +------------------
>  1 file changed, 1 insertion(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
> index 4c270fde4567..3b3cdab3fc15 100644
> --- a/Documentation/devicetree/bindings/leds/common.yaml
> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> @@ -79,26 +79,7 @@ properties:
>      description:
>        This parameter, if present, is a string defining the trigger assigned to
>        the LED.
> -    allOf:
> -      - $ref: /schemas/types.yaml#definitions/string
> -    enum:
> -        # LED will act as a back-light, controlled by the framebuffer system
> -      - backlight
> -        # LED will turn on (but for leds-gpio see "default-state" property in
> -        # Documentation/devicetree/bindings/leds/leds-gpio.yaml)
> -      - default-on
> -        # LED "double" flashes at a load average based rate
> -      - heartbeat
> -        # LED indicates disk activity
> -      - disk-activity
> -        # LED indicates IDE disk activity (deprecated), in new implementations
> -        # use "disk-activity"
> -      - ide-disk
> -        # LED flashes at a fixed, configurable rate
> -      - timer
> -        # LED alters the brightness for the specified duration with one software
> -        # timer (requires "led-pattern" property)
> -      - pattern
> +    $ref: /schemas/types.yaml#definitions/string
>  
>    led-pattern:
>      description: |
> -- 
> 2.26.0
> 
