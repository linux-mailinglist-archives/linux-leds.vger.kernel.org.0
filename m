Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8BC18FFE4
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 21:55:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgCWUzA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 16:55:00 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38960 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbgCWUzA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Mar 2020 16:55:00 -0400
Received: by mail-io1-f67.google.com with SMTP id c19so15868588ioo.6;
        Mon, 23 Mar 2020 13:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DthQLy3F8qE76ytI2zl/5lwXeMISv0a2pxgdAol7tec=;
        b=L0lwa02M8o0aqkltHpMooE+pIvSwFb0YJYkMvlARcdeZQ/hLyzas3ThVvQFb1Ee6wl
         29jil+m/IIxmaDc8NbNIYiHgcCEO+yTDo2x5i6xscTiNzdt75AAuMzch1kHDIu8JQmNL
         XzllWhDgKuZcBhU/AKZs1R8irempeJ1dLEoC+FulSsxom8YTV9eS6+pHg7uynkTnAaFg
         5wk07SRri7T5l285RRWGNhw5W4rO74N/NwsaXoq5U+eIJP1+IePTyeVWafgKdE8Wcvus
         aBxBp8kzdEjnKv6cqxRKInwQRE9m+kmstPQdfLr1TaxPakJKKzVJLcF5Z1hE3Zh04Tiz
         zTCw==
X-Gm-Message-State: ANhLgQ3x7mx8F0CN6N41htIwDyuKc5nhNYgY4j4VNmp1CDaR/zFM6fdH
        bs7/Orz8sGozMDuaFYvxug==
X-Google-Smtp-Source: ADFU+vtrhUVYqN1aOaxp7RFvExInjLlbsAQVfpxCIKQEGANpOkD7aj+FHIuMpPOcPDre12GkBmh6IA==
X-Received: by 2002:a5d:85d4:: with SMTP id e20mr21710130ios.140.1584996899210;
        Mon, 23 Mar 2020 13:54:59 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id f5sm4591504ion.29.2020.03.23.13.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 13:54:58 -0700 (PDT)
Received: (nullmailer pid 3932 invoked by uid 1000);
        Mon, 23 Mar 2020 20:54:56 -0000
Date:   Mon, 23 Mar 2020 14:54:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Icenowy Zheng <icenowy@aosc.io>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH 1/3] dt-bindings: Add vendor prefix for SG Micro Corp
Message-ID: <20200323205456.GA3795@bogus>
References: <20200309203558.305725-1-luca@z3ntu.xyz>
 <20200309203558.305725-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309203558.305725-2-luca@z3ntu.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon,  9 Mar 2020 21:35:56 +0100, Luca Weiss wrote:
> "SG Micro Corp (SGMICRO) specializes in high performance, high quality
> analog IC design, marketing and sales." (http://www.sg-micro.com/)
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since RFC:
> - new patch
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob
