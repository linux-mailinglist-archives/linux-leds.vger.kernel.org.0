Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B252A01C
	for <lists+linux-leds@lfdr.de>; Fri, 24 May 2019 22:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389919AbfEXUu0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 May 2019 16:50:26 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40327 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389242AbfEXUu0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 May 2019 16:50:26 -0400
Received: by mail-ot1-f66.google.com with SMTP id u11so9879300otq.7;
        Fri, 24 May 2019 13:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L2729zncaNNNWYxnQkQPuG8OjV9FPkxJpfIh/jClGCc=;
        b=WZWb0dZkcbHSwVkd/CMQyAUo/xg4pSklzI3isgylW5zV1SHu8zS1nYurkgqdoqqCdH
         0XfmfvdVdDwHdP1nGDaUdtvt17ovXeTrXcrxaFuanKscbQJTPrrk5ZAbEX92Ee25q0Fr
         yvJRKSzpciMhop2xL4tj65hwRvYCWbq2TfrCxy+q8nhBDVKFX/qpTARNny3CZx7YM9Gg
         4mqOrNYuImIzlFofGdaZLrSskGjeIUaU5W61VurmPjlmVBAGtQezlT2bIbhSlGrCe8Zi
         7cB2IXAYYx/bBz7LPCOrcnKneurtFKdnhitX+7P0YkZPBtyA8Wop9eoTE4hj9toWha1L
         2cjw==
X-Gm-Message-State: APjAAAUx1jNSem0SwaFzJQx9KHNu9Nfbv1/rU9OqZuFg4K9/1ts4B+Ja
        kmTDElBqFTkE4T3zLVeq0g==
X-Google-Smtp-Source: APXvYqwiiZIliWSIY1fINTmczDrGFP0EeXEP+lF+/uGKB/S1RITTvWAXVEQei1a8ELNEFZr9/8XQRQ==
X-Received: by 2002:a9d:7395:: with SMTP id j21mr17659042otk.204.1558731024006;
        Fri, 24 May 2019 13:50:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g23sm1149853otr.71.2019.05.24.13.50.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 13:50:23 -0700 (PDT)
Date:   Fri, 24 May 2019 15:50:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 7/9] dt: bindings: lp50xx: Introduce the lp50xx family
 of RGB drivers
Message-ID: <20190524205022.GA9518@bogus>
References: <20190523190820.29375-1-dmurphy@ti.com>
 <20190523190820.29375-8-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523190820.29375-8-dmurphy@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 23 May 2019 14:08:18 -0500, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024 and
> LP5018 RGB LED device driver.  The LP5036/30/24/18 can control RGB LEDs
> individually or as part of a control bank group.  These devices have the ability
> to adjust the mixing control for the RGB LEDs to obtain different colors
> independent of the overall brightness of the LED grouping.
> 
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.txt  | 142 ++++++++++++++++++
>  1 file changed, 142 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.txt
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
