Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C346721A7BF
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 21:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgGITZu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 15:25:50 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34211 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgGITZu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 15:25:50 -0400
Received: by mail-io1-f65.google.com with SMTP id q74so3571543iod.1;
        Thu, 09 Jul 2020 12:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ldbyMoONpSx2IQ0MK7b8AaxaUexGSZIC17odQWV2ah8=;
        b=CKvGz8FN+VHWV8Fbpc9mbDVRjj6zKN7B8DS9XgkMUdB3+h0yYujbplQLd9pV8zEUXx
         ATAZTIlEtb7x7nPx3IElcxnxpSwXvkHEvX1+9ujhDC67SwDM7i/qU1IlubUgJJQq3db1
         s74rq7OHeu+lycDr0IvgVMEr4k3pbkT/CJBV9Ao1R2X57A2ys5ERn8k9aLWwq9g8tGq9
         gBJoAf2pfoOxGy4dIvyiufkJZBlZoHc+BMnephMK11gsdUbviGZinpcGXN2VY+G48EJ3
         dLPaWrGexUJFLGVOF45/ybvvk8u2uwNiXSd4gpMGvt0PEEJaTQfJIg6qM/dErj84/7Yj
         z2WA==
X-Gm-Message-State: AOAM530Pf2ExNy8mDXJLlSp+Ue6VHTCmh91jMy+FAvTSgSgntTLYlDKh
        IMyGf5/Cmt5t9f2kXtmZKg==
X-Google-Smtp-Source: ABdhPJyz+LyZnxFarkQsF+lvGnmqwnHFbV4CiVB12eCSaqM9gbZVkfa3wxvJHK01OTa+3tRWVBApCg==
X-Received: by 2002:a05:6638:168e:: with SMTP id f14mr69708356jat.64.1594322749623;
        Thu, 09 Jul 2020 12:25:49 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id k126sm2587024iof.50.2020.07.09.12.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:25:49 -0700 (PDT)
Received: (nullmailer pid 750338 invoked by uid 1000);
        Thu, 09 Jul 2020 19:25:48 -0000
Date:   Thu, 9 Jul 2020 13:25:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, jacek.anaszewski@gmail.com
Subject: Re: [PATCH v29 06/16] dt-bindings: leds: Convert leds-lp55xx to yaml
Message-ID: <20200709192548.GA750288@bogus>
References: <20200622185919.2131-1-dmurphy@ti.com>
 <20200622185919.2131-7-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622185919.2131-7-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 22 Jun 2020 13:59:09 -0500, Dan Murphy wrote:
> Convert the leds-lp55xx.txt to yaml binding.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/leds/leds-lp55xx.txt  | 228 ------------------
>  .../devicetree/bindings/leds/leds-lp55xx.yaml | 220 +++++++++++++++++
>  2 files changed, 220 insertions(+), 228 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lp55xx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
