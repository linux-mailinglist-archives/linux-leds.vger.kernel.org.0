Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B14E222644
	for <lists+linux-leds@lfdr.de>; Thu, 16 Jul 2020 16:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgGPOy5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Jul 2020 10:54:57 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39354 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbgGPOy5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Jul 2020 10:54:57 -0400
Received: by mail-io1-f65.google.com with SMTP id f23so6288590iof.6;
        Thu, 16 Jul 2020 07:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BaqFZG9UWRjhx4RwScgiajamJpelOhhp1Z38o8FrMds=;
        b=dBYy+tcnR1zmrENGOQ5gkAc7diqBcqnw2Xul/4Io6VqONuy2Hed7+KTKlI/1N9TOrF
         rmde/GbNv/cWRfUP913Qx5yEDgp8/Mcmv1+dpfFd+zyYBjbn5QAAHp+W0vF0owoObLDx
         sL39LKUd1YVbxMhfeb2xrxvE6MDyMb50PEDsVtylph9w3uBW/j6CFWCXXgGtOuxQ02Sr
         MBAP4qpVK6L75mkEbAErX3UDmigAsLveOnk3zAcLFhCOAklXrPrZcqVGscTBfgHcLePh
         duISAnCyR+MYCZchlgr61/of3NGp+DJUzL1SNnYVgkUSav6YObxG2vOMSxwC9Odz1OI/
         /Dpw==
X-Gm-Message-State: AOAM530dBiP2pNpqPS3eb9VJltdNjl4iw0xx8Yl479RBvm0U2ILdJbBI
        KkI/3VR4jGm/mlauXnKZ+w==
X-Google-Smtp-Source: ABdhPJzcGGLXa59ebad8ZEMnpSmd8hkKy1t0JWfmwfPJjXYxdbzORCZ9sBc+M3YUvgGK+FSagG6rPQ==
X-Received: by 2002:a6b:9388:: with SMTP id v130mr4779402iod.134.1594911295879;
        Thu, 16 Jul 2020 07:54:55 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id p22sm2946887ili.88.2020.07.16.07.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 07:54:55 -0700 (PDT)
Received: (nullmailer pid 2316771 invoked by uid 1000);
        Thu, 16 Jul 2020 14:54:54 -0000
Date:   Thu, 16 Jul 2020 08:54:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        jacek.anaszewski@gmail.com, Dan Murphy <dmurphy@ti.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: leds: add cznic,turris-omnia-leds
 binding
Message-ID: <20200716145454.GA2313513@bogus>
References: <20200716114047.22943-1-marek.behun@nic.cz>
 <20200716114047.22943-2-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200716114047.22943-2-marek.behun@nic.cz>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Jul 16, 2020 at 01:40:45PM +0200, Marek Behún wrote:
> Add device-tree bindings documentation for Turris Omnia RGB LEDs.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../leds/cznic,turris-omnia-leds.yaml         | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> new file mode 100644
> index 000000000000..bfe19aee0805
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/cznic,turris-omnia-leds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: CZ.NIC's Turris Omnia LEDs driver
> +
> +maintainers:
> +  - Marek Behún <marek.behun@nic.cz>
> +
> +description:
> +  This module adds support for the RGB LEDs found on the front panel of the
> +  Turris Omnia router. There are 12 RGB LEDs that are controlled by a
> +  microcontroller that communicates via the I2C bus. Each LED is described
> +  as a subnode of this I2C device.
> +
> +properties:
> +  compatible:
> +    const: cznic,turris-omnia-leds
> +
> +  reg:
> +    description: I2C slave address of the microcontroller.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^multi-led[0-9a-f]$":
> +    type: object
> +    allOf:
> +      - $ref: leds-class-multicolor.yaml#
> +    description:
> +      This node represents one of the RGB LED devices on Turris Omnia.
> +      No subnodes need to be added for subchannels since this controller only
> +      supports RGB LEDs.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 11
> +        description:
> +          This property identifies one of the LEDs on the front panel of the
> +          Turris Omnia router.
> +
> +    required:
> +      - reg
> +

Add:

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
