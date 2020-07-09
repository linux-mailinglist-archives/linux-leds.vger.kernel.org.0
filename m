Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C04AA21A7BC
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 21:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgGITZG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 15:25:06 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36683 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgGITZG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 15:25:06 -0400
Received: by mail-io1-f68.google.com with SMTP id y2so3548267ioy.3;
        Thu, 09 Jul 2020 12:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5DD46ZsIeppMNyS9uf1ashBYJjtuEqvvHc5Gyh8gPlA=;
        b=VH3oRM4ATVjSoomHYR7uDRCH3g+wnSMjRA2bGmb8QWMc2OQWEG4/FLq8oH5m/DIl8Q
         8Sey0w6i9pmmchpZKX+DHnul7kVopYsI7YV7TqwsGd4s2KYNvxNI6E4ci6/HIjXXRzWt
         BwLLlG324rBeeFF2TeMfOtLKE8GfZaBMFnDQGsNzV6a5bcEWDzU3fdDGf6z4ukYf2Rp7
         /XmLieBs6+/Jx6mNG5IxlQR+07io0Jw7EYGHauHRopUX7NqNIEqwqxzYUV7vhdRoUxGl
         yPLRUifPFLuzhod5e88TFnmx0+JBkPNZlvo5TPbxpwbOoEfIIkv8IOqIO6bkE4XhGWZr
         hUHg==
X-Gm-Message-State: AOAM533SNLVrnmaRQDa0G6OQtKAfiecBOQxAa4mLqPJonjo1X7+gbPQ1
        30h2+KV1cmXSt6ka0VgoBw==
X-Google-Smtp-Source: ABdhPJweNbWtVYNFr8NJv3XP/k1jpC6i+0l4M88nutRLz18pWdLFvSz6puSEMhCLOHjx1ZxiGlL8QA==
X-Received: by 2002:a05:6602:2e8d:: with SMTP id m13mr43936103iow.100.1594322705319;
        Thu, 09 Jul 2020 12:25:05 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id c7sm2358325ilo.85.2020.07.09.12.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:25:04 -0700 (PDT)
Received: (nullmailer pid 749236 invoked by uid 1000);
        Thu, 09 Jul 2020 19:25:04 -0000
Date:   Thu, 9 Jul 2020 13:25:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, jacek.anaszewski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, pavel@ucw.cz
Subject: Re: [PATCH v29 04/16] dt: bindings: lp50xx: Introduce the lp50xx
 family of RGB drivers
Message-ID: <20200709192504.GA749144@bogus>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-5-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622185919.2131-5-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 22 Jun 2020 13:59:07 -0500, Dan Murphy wrote:
> Introduce the bindings for the Texas Instruments LP5036, LP5030, LP5024,
> LP5018, LP5012 and LP5009 RGB LED device driver.  The LP5036/30/24/18/12/9
> can control RGB LEDs individually or as part of a control bank group.
> These devices have the ability to adjust the mixing control for the RGB
> LEDs to obtain different colors independent of the overall brightness of
> the LED grouping.
> 
> Datasheet:
> http://www.ti.com/lit/ds/symlink/lp5012.pdf
> http://www.ti.com/lit/ds/symlink/lp5024.pdf
> http://www.ti.com/lit/ds/symlink/lp5036.pdf
> 
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp50xx.yaml | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
