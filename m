Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5967B37EE6A
	for <lists+linux-leds@lfdr.de>; Thu, 13 May 2021 00:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245520AbhELVnE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 May 2021 17:43:04 -0400
Received: from mail-oo1-f54.google.com ([209.85.161.54]:39774 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385219AbhELUHR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 May 2021 16:07:17 -0400
Received: by mail-oo1-f54.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so5218228oot.6;
        Wed, 12 May 2021 13:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MuK2pfJEKg7cC7a1nR3QKyDJhlIbH4fW7RwxFFSYgU8=;
        b=LOHds058w6k7wBvCM/L8jmGoXysm7NKOaznPu13D4LSqh56C6UEeeoYyhktxIErRN8
         oRrNluNqsnRAaKMMtO+nX8Q7YSboAg/p/d7qU5svK1St/P698Mp1izogAPQjLZzRmz4f
         rT64olAbgil0u1IEZRdrPaOttUbp7VQTl4VSPkptMMlmYyLj7znPDjjye0sp6/9QhHOk
         dLt1vuhQZwZcQ7CpimjTjmGudIPJBLm/aL69n1+JR3FtMJR4aq1LtrtnjwN2pf93zOTp
         my5+CNR8bYgNNcaClArLgLSCC5L6LKZCC6Xvd/4V+FKj9n48EljGC2sqA6VcXU72Qsvt
         mhTA==
X-Gm-Message-State: AOAM532pGhjRVEm/1Fz3/PUL8hJ1ucBG31fyIk7dUjdTkOE4H2xQebeP
        bMPNegd0R2j1/Eym8kErt3D3pFiLOg==
X-Google-Smtp-Source: ABdhPJwXh4NHU4WqFF5W6vBoLPROoPq8C6EQ+6qTKkvt7ZW0sJjVrC5tacdogvwb/IE7xDUqB8UF1Q==
X-Received: by 2002:a4a:e512:: with SMTP id r18mr28916579oot.40.1620849968942;
        Wed, 12 May 2021 13:06:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f71sm180558oig.29.2021.05.12.13.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:07 -0700 (PDT)
Received: (nullmailer pid 2495086 invoked by uid 1000);
        Tue, 11 May 2021 19:49:40 -0000
Date:   Tue, 11 May 2021 14:49:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     pavel@ucw.cz, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        jacek.anaszewski@gmail.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: leds: common: add disk write/read and
 usb-host
Message-ID: <20210511194940.GA2495057@robh.at.kernel.org>
References: <20210508193654.2596119-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508193654.2596119-1-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 08 May 2021 19:36:54 +0000, Corentin Labbe wrote:
> The triggers enum misses 3 cases used by gemini DT.
> usb-host was added via commit 0cfbd328d60f ("usb: Add LED triggers for USB activity")
> so we add also as valid trigger usb-gadget which was added along in this
> commit.
> 
> disk-read/disk-write were added by commit d1ed7c558612 ("leds: Extends disk trigger for reads and writes")
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
