Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C16AAF9F9
	for <lists+linux-leds@lfdr.de>; Wed, 11 Sep 2019 12:09:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbfIKKI6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Sep 2019 06:08:58 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34167 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbfIKKI5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Sep 2019 06:08:57 -0400
Received: by mail-wr1-f65.google.com with SMTP id a11so14054751wrx.1
        for <linux-leds@vger.kernel.org>; Wed, 11 Sep 2019 03:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VDs4QBH4rsd9WApRFewbfBpAla/8JjMokOT6RslkOmM=;
        b=NHM6VwFJgk9JP6K9tIa+qvaxn5+Ogzc7cDz8+F43SM8S6lFWNT0g/1L9XZBSVwaola
         kZatLw3ohMiWvKK1iMWcap3jFwco0hBhy93RhTuCBarNbZP5Zi66A2/LNsXnwDrKyuPO
         cWfXRoIHoq9VEqG/3oP4hGClbNkeNBPXy3Q7YepKlI2br1az4hA5lc1Qjt5yrgzKTsEo
         CA3paIui1sOrvQKRKI8XBt4tGDOfdrw/DWSsAFggd6V/zfcMbx7N1jRIcp/dU2unHVdM
         aDQ0BivD+hvha25GecLASN4k9C8wMNJdyuwmnls6pmJu2H5brulQUp5+CdOPOYcnBFE+
         2lBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VDs4QBH4rsd9WApRFewbfBpAla/8JjMokOT6RslkOmM=;
        b=ZbpBW3P3wQAiurU8sW433aRb91oFHCubH3zYbyHlKsPdHMCVmHefWyu7Z2Q4chpDLk
         pWnbnP7kqDMS7ja2+fT7n+BvtNIf/n9RHgq9zQv0Ucyggocoqp3i3im40v58ABOqnNGI
         ES8nZNyel6jmQgsN4f4v7pHo3jBVBYBkNbUArlDms5qi9Bj5D9IOGqtcShLW2EMu1XFy
         G2lophUpaNpBBb7gtQzu5GywlxjJ/1c+aNUoOFXhxnoI3EUBMcSAhAIHb8qaABRIaOw8
         jYjWz1a/vCAgU4Bm20BZWT46ZY8s+KFAmOz63TKZJVwQHSACUrrYP9PMZ5rZPie0Zz0k
         98NQ==
X-Gm-Message-State: APjAAAW7QOYu+PENr7ZFV3QUNmxXJvWemoo9DOHIbjU/Gnc8KX1izqsr
        aIDVBL9LrN0z8cxvaoa9l9xPzg==
X-Google-Smtp-Source: APXvYqwwO7ms6cDK74/Pkx8Q/GbwMaXoYLDIpo3xME5YnvIM2YoARQAWfaF+MWOS/r+pfR+2cwba4A==
X-Received: by 2002:adf:8444:: with SMTP id 62mr23305991wrf.202.1568196533899;
        Wed, 11 Sep 2019 03:08:53 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id z189sm3551152wmc.25.2019.09.11.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 03:08:53 -0700 (PDT)
Date:   Wed, 11 Sep 2019 11:08:51 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     lee.jones@linaro.org, jingoohan1@gmail.com,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: lm3630a: add enable_gpios
Message-ID: <20190911100851.f4rnldghtmly26oo@holly.lan>
References: <20190910212909.18095-1-andreas@kemnade.info>
 <20190910212909.18095-2-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910212909.18095-2-andreas@kemnade.info>
User-Agent: NeoMutt/20180716
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Sep 10, 2019 at 11:29:08PM +0200, Andreas Kemnade wrote:
> add enable-gpios to describe HWEN pin
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
> changes in v2: add example
>  .../bindings/leds/backlight/lm3630a-backlight.yaml           | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> index dc129d9a329e..1fa83feffe16 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/lm3630a-backlight.yaml
> @@ -29,6 +29,10 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  enable-gpios:
> +    description: GPIO to use to enable/disable the backlight (HWEN pin).
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -92,6 +96,7 @@ examples:
>      i2c {
>          #address-cells = <1>;
>          #size-cells = <0>;
> +        enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
>  
>          led-controller@38 {
>                  compatible = "ti,lm3630a";
> -- 
> 2.20.1
> 
