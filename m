Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 994E7127125
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2019 00:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLSXEW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 18:04:22 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41234 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfLSXEW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 18:04:22 -0500
Received: by mail-ot1-f67.google.com with SMTP id r27so9235471otc.8;
        Thu, 19 Dec 2019 15:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=F7dFVXsBXe6V0IT3wFxkvgfpUWL9SwHOltmODSQxTMA=;
        b=b/xY4LsYRSVUYUjbOrSWi5la84BIrcEnc4LNRB4S4TTQ0hZK3J6DmdlLKd2jiyBLSQ
         s/uwRqilXZ/eRPFZGBvYgNNxCimZ+pckdr3sJ4tK25VJj9C41jVTMQnXiBf4ZKWB9YtX
         IRoFOSfj/vlDxfi2vG2RpJwPELXyW5eu7Ll0voxJOm4PWubQ+4nvY5r3HTZMKerExqPv
         zDtrHo0IJJhGumD/HFYs/JiiikNhFAy6GE8z+aLPESQUGGPSDFyk22SG26vUJ0hUCKqF
         z5fj05NTKziPKMyD7G3QXLxmZWlmw0KrCqfNEAiPNFy1qUj8KQ74/wTqlpJwTITYLDWd
         VORg==
X-Gm-Message-State: APjAAAVzirvkod+c2EPs1od7vL8a1AL3II+MWoXe8ZW3sFrD4ATwnb+o
        9zolXDxq/baXH5pKXKC/K9Iygx9bXA==
X-Google-Smtp-Source: APXvYqy132pI7t/f3+X+sZU4Ko0GpazlmqI0elgfvDTZQ8i2aDSAFKJOgz5uZujIhEm+kDaj8cyaCA==
X-Received: by 2002:a9d:d0b:: with SMTP id 11mr11694540oti.287.1576796661610;
        Thu, 19 Dec 2019 15:04:21 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net. [184.205.174.147])
        by smtp.gmail.com with ESMTPSA id b206sm2499978oif.30.2019.12.19.15.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 15:04:21 -0800 (PST)
Date:   Thu, 19 Dec 2019 17:04:20 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     linux-realtek-soc@lists.infradead.org, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        zypeng@titanmec.com, Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org
Subject: Re: [RFC 06/25] dt-bindings: leds: Add Titan Micro Electronics TM1628
Message-ID: <20191219230335.GA25461@bogus>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191212033952.5967-7-afaerber@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191212033952.5967-7-afaerber@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Dec 12, 2019 at 04:39:33AM +0100, Andreas Färber wrote:
> Add a YAML schema binding for TM1628 LED controller.
> 
> Cc: zypeng@titanmec.com
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  @Rob: How could we express constraints on two-cell reg value ranges here?

It's encoded as a matrix, so something like this:

reg:
  items:
    items:
      - # constraints on 1st cell value
      - # constraints on 2nd cell value


>        Should we also model constraints on reg range by #grids property?

So the value of #grid defines the max values in reg? Unfortunately, 
we can't yet for json-schema. There's been some proposals, but nothing 
final I think.

>  .../devicetree/bindings/leds/titanmec,tm1628.yaml  | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
> new file mode 100644
> index 000000000000..024875656e79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/titanmec,tm1628.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/titanmec,tm1628.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Titan Micro Electronics TM1628 LED controller
> +
> +maintainers:
> +  - Andreas Färber <afaerber@suse.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +    - titanmec,tm1628
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#grids":

I'd be more a fan of using '#' prefix if we'd been better at using it 
when appropriate, so I'd probably drop the '#'.

> +    description: |
> +      Number of GRID output lines to use.
> +      This limits the number of available SEG output lines.
> +    minimum: 4
> +    maximum: 7
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^.*@[1-7],([1-9]|1[02-4])$":
> +    type: object
> +    description: |
> +      Properties for a single LED.

Please describe the unit-address format. I assume it's <grid>,<segment>.

> +
> +    properties:
> +      reg:
> +        description: |
> +          1-based grid number, followed by 1-based segment number.
> +        maxItems: 1
> +
> +      linux,default-trigger: true
> +
> +    required:
> +      - reg
> +
> +examples:
> +  - |
> +    #include <dt-bindings/leds/common.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led-controller@0 {
> +            compatible = "titanmec,tm1628";
> +            reg = <0>;
> +            spi-3-wire;
> +            spi-lsb-first;
> +            spi-max-frequency = <500000>;
> +            #grids = <7>;
> +            #address-cells = <2>;
> +            #size-cells = <0>;
> +
> +            colon@5,4 {
> +                reg = <5 4>;
> +                color = <LED_COLOR_ID_WHITE>;
> +                function = LED_FUNCTION_INDICATOR;
> +                linux,default-trigger = "heartbeat";
> +            };
> +        };
> +    };
> +...
> -- 
> 2.16.4
> 
