Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6323BE9D62
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 15:24:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfJ3OYV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 10:24:21 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41915 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726377AbfJ3OYU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 10:24:20 -0400
Received: by mail-oi1-f196.google.com with SMTP id g81so2096720oib.8;
        Wed, 30 Oct 2019 07:24:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+hSPHUSIwWmvXSSjJKJB0kSKFNi9HZxvhkDhQSbnnn8=;
        b=PKYwV5eaqJLZVu3U+QaUm1EyU+fvxpYiUkaS66/bw4a7pImU4nWhLE/C/UVy9ZB06e
         imI6T8PteJRvDowFjmSKYuRKNarBD5Zh9ohwSd0A4bgMjDrlgVe6V7RznKN6Ec7Z8+eL
         p7ZleBk25E4bS+aJcHAEZFvcBKU6VUkGWb5puHsDhpB+DphvePJT3Iibbjvp4yzb2ZiG
         bKTEag8lYztCwOWrTkzTYvJO59gOB2fsjoDq5UAdbSTZ+bXdJy+863r4ULxiiN4rOWpv
         x7ly/pzTrCVUhbnWDbcPYpJetG77KSB8P3wAwlbllba/kRO0hWhbU1F/omhQZMDDIIWm
         HloQ==
X-Gm-Message-State: APjAAAVonSl9rxsfHRwUAxEC2xcQMTbumhdwO6XxJrynJP3WQ0aoTGET
        uVE7rL6OtyPDE7g8Fkqfuw==
X-Google-Smtp-Source: APXvYqzpHFH7IUJY/qo3GgcQxa/sjrrwWjFNgOWTNWWQu/F50UbWA/UfcMdwCrIKAUKFOsWfdnjICg==
X-Received: by 2002:aca:e104:: with SMTP id y4mr9349900oig.117.1572445459811;
        Wed, 30 Oct 2019 07:24:19 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t9sm45396oij.41.2019.10.30.07.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:24:18 -0700 (PDT)
Date:   Wed, 30 Oct 2019 09:24:17 -0500
From:   Rob Herring <robh@kernel.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Bjorn Andersson <bjorn@kryo.se>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jean-Jacques Hiblot <jjhiblot@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: Add leds-meter binding
Message-ID: <20191030142417.GA8919@bogus>
References: <1572185379-21537-1-git-send-email-akinobu.mita@gmail.com>
 <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1572185379-21537-2-git-send-email-akinobu.mita@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Oct 27, 2019 at 11:09:38PM +0900, Akinobu Mita wrote:
> Add DT binding for generic LED level meter which consists of multiple LED
> devices by different drivers.

Do you have some pointers to actual h/w?
 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Bjorn Andersson <bjorn@kryo.se>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>  .../devicetree/bindings/leds/leds-meter.yaml       | 67 ++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-meter.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-meter.yaml b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> new file mode 100644
> index 0000000..b5fcd98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-meter.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-meter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic LED level meter
> +
> +maintainers:
> +  - Akinobu Mita <akinobu.mita@gmail.com>
> +
> +description:
> +  Generic LED level meter consists of multiple LED devices by different drivers.

Googling this, the only thing I see is audio level meters though those 
are all just a voltage level input, so it could be any source I guess.

> +
> +properties:
> +  $nodename:
> +    pattern: "^meter-leds(@.*)?"
> +
> +  compatible:
> +    const: meter-leds
> +
> +  leds:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: List of phandles to LED node that are members of a level meter.
> +
> +  brightness-weights:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      By default, the brightness of the LED level meter is proportional to the
> +      number of actual LEDs that are turned on.  We can optionally specify
> +      the contribution ratio for each LED within a level meter by this
> +      property.  The example below shows how to setup an exponential
> +      relationship between the number of LEDs turned on and the brightness of
> +      meter-leds.

This seems oddly named if this is a bar graph. Yes, more LEDs on is 
brighter, but it's really a piecewise linear graph you want. 

Each LED could have variable brightness, so you could also ramp the 
brightness for an individual LED.

Rob
