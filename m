Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C604A250C54
	for <lists+linux-leds@lfdr.de>; Tue, 25 Aug 2020 01:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgHXXZi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 Aug 2020 19:25:38 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:33022 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXXZh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 Aug 2020 19:25:37 -0400
Received: by mail-io1-f68.google.com with SMTP id g14so10587550iom.0;
        Mon, 24 Aug 2020 16:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3DyabqqkVJXgJh7HlmxLLOBa4fdlMTVhCi8DsvyDOPQ=;
        b=ViuBARhWqSgw7qkffvxK6O9YPusp7dhU+1waOwaYNo6QEtWQIHiefjHx+jxDy1sE+L
         E5ZgOYKI39MMVysDycsw6/v2UwVSZqcuikQvBgcVkbALaRnjA26Y5h1UTwWXlcCl6nW7
         LFjYbEjcCisggNvB6rQOtFFi3Squ6LsyW7lzEGSyHJ0atJF+pOgRod5k5l144w8vTYUO
         rkZnPy9VvkcfGq8ypXpb/0ZVVpdhSnBeyiEQYdO1UOoc17oFtT5R131C2QQjuXME3NbH
         8OivNNS0dCEh83QZCcOMwOF25Mz73tDR5doBkzWACM/KBW9pJhXEMjsfv41okI7sXJfZ
         4TOg==
X-Gm-Message-State: AOAM533dac+D4gffL/7wHVtgMFmOspNgCPVrWmqfq1TjdGUTKxYoZ3bt
        pFSlMedwmSUaGVT5TAKSr/Y+1dw8zA==
X-Google-Smtp-Source: ABdhPJysLH3RCzdnu0Wm63sVDNX9LiUm7l4X4vY8q10iw9HmYPUPuDvmazAs1jULAOWfa7J23/NPzQ==
X-Received: by 2002:a6b:e806:: with SMTP id f6mr3681139ioh.98.1598311536543;
        Mon, 24 Aug 2020 16:25:36 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id q133sm4068533iod.38.2020.08.24.16.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 16:25:35 -0700 (PDT)
Received: (nullmailer pid 3532221 invoked by uid 1000);
        Mon, 24 Aug 2020 23:25:34 -0000
Date:   Mon, 24 Aug 2020 17:25:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt: bindings: lp55xx: Updte yaml examples with new color
 ID
Message-ID: <20200824232534.GA3532166@bogus>
References: <20200812193248.11325-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200812193248.11325-1-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 12 Aug 2020 14:32:48 -0500, Dan Murphy wrote:
> Update the binding examples for the color ID to LED_COLOR_ID_RGB
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-lp55xx.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
