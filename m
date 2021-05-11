Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A83537EE6E
	for <lists+linux-leds@lfdr.de>; Thu, 13 May 2021 00:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344976AbhELVnQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 12 May 2021 17:43:16 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:40578 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385227AbhELUHf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 12 May 2021 16:07:35 -0400
Received: by mail-oi1-f170.google.com with SMTP id u16so23395565oiu.7;
        Wed, 12 May 2021 13:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xScpjZF24m3UdJjUJUusXULrOo6cMeOXInbHAzmPRfM=;
        b=ARQIKPCwN1j+UGPUr8o+rCB+HfokE4PsRq6ywn1b9o1UeVW+RIkBKCCfUpzha0IBmW
         y/WZcD/c4+Eghiy3mxQ0n8u2j5lf8isnqGlRNeoarylmMb3uLhoPDoRpbijJmsHNKUfG
         nXu1m0IVpPiB1wzWCUtY3pKeq+rvOek/FqImGGt5pFWRFrIbGbhoNUHPZubAKT4CmH5W
         D1GsQ32/TEZhBaKgpTVQf5SLGRzSIXeABs8tlBHMYxt4bK7DB+lqqTSmXxAvdQlaYETD
         cmXy27AWMpebf4gV/QkwnsMsjyL2DeoZQNhbngU1CbnSIMtLJRC6JdzaHcX0saQDST94
         dC0Q==
X-Gm-Message-State: AOAM532PzR8VSfnz/ieW57jgjjA8L5CnYLRpMSzYuTBxvkpMavb8bohn
        V7AY834xyBUvMM5e80LWfg==
X-Google-Smtp-Source: ABdhPJxpABV1wrTiqQ3LuxW4DhZ9etLYCpVGmTMxdx9PhGNgrhqSeBi8C+5jPK9hjKzyCcpXE43Y4g==
X-Received: by 2002:aca:1101:: with SMTP id 1mr129294oir.171.1620849985709;
        Wed, 12 May 2021 13:06:25 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y13sm221930oon.32.2021.05.12.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:24 -0700 (PDT)
Received: (nullmailer pid 2493789 invoked by uid 1000);
        Tue, 11 May 2021 19:48:45 -0000
Date:   Tue, 11 May 2021 14:48:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Wan Jiabing <wanjiabing@vivo.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, kael_w@yeah.net
Subject: Re: [PATCH] leds: Fix reference file name of documentation
Message-ID: <20210511194845.GA2493740@robh.at.kernel.org>
References: <20210506070824.10965-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506070824.10965-1-wanjiabing@vivo.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 06 May 2021 15:08:24 +0800, Wan Jiabing wrote:
> In commit 56b01acc1c79a ("dt-bindings: gpio: fairchild,74hc595:
> Convert to json-schema"), gpio-74x164.txt was deleted and replaced
> by fairchild,74hc595.yaml. Fix the reference file name.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-bcm6328.txt | 4 ++--
>  Documentation/devicetree/bindings/leds/leds-bcm6358.txt | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!
