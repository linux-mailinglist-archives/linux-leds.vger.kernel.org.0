Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14B81B9A51
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 10:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgD0Idb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 04:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgD0Idb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 04:33:31 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A898CC061A0F;
        Mon, 27 Apr 2020 01:33:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h4so5281408wmb.4;
        Mon, 27 Apr 2020 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:subject:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w0nU7XWSKjZiq42hI6aJFP/wV037pceDvXS4f3Cj24g=;
        b=abmztt5gJbmn/okxMUbQZq3wfbR/ooUc1lHRkBzCsYfwqY/b/rQ6IfE9Gdd9IIy0kJ
         Q6piiNV6rQTZ3K0fPfXalydyufc+WO9ycBQd/npG373tXzphOEqqqYbAZHOcD6ZyHfN/
         Ki3hCsk/ORwsvcEZV35MfxVEDM9JTddzQZtfGFL00l5UPp0axMtX15HOg2vuCPO9iAv/
         hanG4dd7nuMjBdgZ5D3FgShsnF0qzJ97w3nN+Up1kfB7WlCXPh9W+xfMbPcsPrCYM3bc
         lt7WCcTZSzxaDOuOaYaKoA1OmdkYbALxXPoS9XGkcuZNhQ0xEasOL3NOeCZb01+OTxcU
         nDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:subject:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w0nU7XWSKjZiq42hI6aJFP/wV037pceDvXS4f3Cj24g=;
        b=fCzO0hfb1VLtNfdstsH2smOA0Lc7Kn9y87k/o6+8RzF0UFIE+BbCbPmGSDjHyuCiub
         bdxszFeD34bskpzjNE+nwuivs0nAXYb+s3wKnpfC0ikXVS6nlU3FcLOOVoBrMg0YdRx4
         SaUcP2EvkT0lArN2NIJsgDVhieHoYTgwbCJluihIlzJN2GMat4VziIv2LF6kvPc2hVAL
         K6+JeSqy0eXXt2eSu92QS+sKrBlOBifDd4pTP4GhVZCMsCgvWtCsnUPBOBplIltlJWdB
         P40rLYduo2f2K1sgPoXL67SkUTNECZ/tr5uKTFkZ5N8UEQOlz1P3Op23l6YjO7I4PbvF
         ZM1w==
X-Gm-Message-State: AGi0PuZcC7kFHCAoZlSmF08K0KZbOBn3TrtABbyfWn5p7LwoF/xhbBHX
        K7eO3TYRHs7BxKf8suB4a/Q=
X-Google-Smtp-Source: APiQypL9vQ25d/cx9/t2iweoGlzNivVSTWo7XTtXrJ5QP9N9j3FZH6z7MY/kfoDn/0qec5alrYVV6w==
X-Received: by 2002:a1c:808c:: with SMTP id b134mr26231938wmd.131.1587976409450;
        Mon, 27 Apr 2020 01:33:29 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id x18sm14448554wmi.29.2020.04.27.01.33.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 01:33:28 -0700 (PDT)
To:     wens@kernel.org
Cc:     devicetree@vger.kernel.org, dmurphy@ti.com, heiko@sntech.de,
        jacek.anaszewski@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-rockchip@lists.infradead.org, pavel@ucw.cz,
        robh+dt@kernel.org, wens@csie.org
References: <20200427073132.29997-2-wens@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: common: Drop enumeration for
 linux,default-triggers
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <4044214d-5385-94b6-d985-e1f824a60c5e@gmail.com>
Date:   Mon, 27 Apr 2020 10:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427073132.29997-2-wens@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Chen-Yu,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The bindings currently list a very small subset of valid triggers for
> LEDs. Since many drivers or subsystems in Linux register custom
> triggers, the list would become very hard to maintain.
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

This makes it free form, but deletes the documentation of options that
are standard available for people without custom driver.
Where should that info go?

>  
>    led-pattern:
>      description: |
> -- 
> 2.26.0

