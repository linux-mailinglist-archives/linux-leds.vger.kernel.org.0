Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27A5D170B98
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2020 23:30:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbgBZWaf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Feb 2020 17:30:35 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36532 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbgBZWaf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Feb 2020 17:30:35 -0500
Received: by mail-oi1-f193.google.com with SMTP id c16so1265421oic.3;
        Wed, 26 Feb 2020 14:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIlPjifus7WfeBj0gGi82kKOzq1wYnOIRClo35MBZc0=;
        b=qxSRF0lhqypbaR4C2wgyFsDfMNKzmpIzykKyVqJUSM8JtDX70FJa1nWggYgc+b3qyi
         /6OyHKV8TVgctdEq1crg4l0I6rIHomV9CfmnC3QUlqn0nLaHFnNZF7M1RrzchBvWTP4F
         M8c4RKoKJO9LNHe3ejdvas2KVgEIAxGFzzq2sJVlXTMoA/wrcU9wMOxYCuXPp0qnLkCC
         m1RXKylkAwvXFgLUTFsStbiNoWxNfKIyOHeD/spmfM6aKd18DSpOpqYhvNu25tFRESfq
         qkyamb5eLJ9WE5XyvO3tUOCgKQHABpPulEm28hg8zcgAC/Vx92GdhVyBfpKf5cyX4zE5
         bZqg==
X-Gm-Message-State: APjAAAVE/QRTMbUPieYRnVwO+elD8Zq3hOAascninidBjIlqGMdtEmqa
        AgDNEQvK6qG0xWzp5Um3Fg==
X-Google-Smtp-Source: APXvYqxN8VRIZzGbJK5F6l4YjpqWBlSf2rbUDYu4nFqKC0CNhTmORVGaCz6j9VvqOV0Qu90LztjjPg==
X-Received: by 2002:aca:7591:: with SMTP id q139mr787618oic.54.1582756234681;
        Wed, 26 Feb 2020 14:30:34 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h15sm1236359otq.67.2020.02.26.14.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 14:30:33 -0800 (PST)
Received: (nullmailer pid 19907 invoked by uid 1000);
        Wed, 26 Feb 2020 22:30:32 -0000
Date:   Wed, 26 Feb 2020 16:30:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-sunxi@googlegroups.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: leds: Add a binding for AXP813 charger
 led
Message-ID: <20200226223032.GA13404@bogus>
References: <20200223131435.681620-1-megous@megous.com>
 <20200223131435.681620-2-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200223131435.681620-2-megous@megous.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Feb 23, 2020 at 02:14:32PM +0100, Ondrej Jirman wrote:
> The AXP813 PMIC can control one LED. Add binding to represent the LED.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../devicetree/bindings/leds/leds-axp20x.yaml | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-axp20x.yaml b/Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> new file mode 100644
> index 0000000000000..79282d55764bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-axp20x.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/leds/leds-axp20x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LED driver for AXP813 PMIC from X-Powers.
> +
> +maintainers:
> +  - Ondrej Jirman <megous@megous.com>
> +
> +description: |
> +  This module is part of the AXP20x MFD device. For more details
> +  see Documentation/devicetree/bindings/mfd/axp20x.txt.

Really, we should convert this first as this should either just be 
referenced from the MFD schema or just directly put into it.

Rob
