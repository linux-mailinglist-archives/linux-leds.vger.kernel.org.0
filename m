Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437FF1E3523
	for <lists+linux-leds@lfdr.de>; Wed, 27 May 2020 03:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgE0B7i (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 May 2020 21:59:38 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37038 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbgE0B7h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 May 2020 21:59:37 -0400
Received: by mail-io1-f66.google.com with SMTP id r2so13953416ioo.4;
        Tue, 26 May 2020 18:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rk36MC3jyTPT68BWNMYU/40Sxim3Mm06hHCBporf6CA=;
        b=cucI/1BW55G5ki6Vv9MMg+j/bqmphqUOXximvA5N3sVvmuggwVTnt+s/KIxAbvgjaH
         nkBgnkArVgWiejk6jBZZ9F7laDHEAhuZCBF7n2f6A53RIyWsEwmZslcWTdFLvNp9k+EL
         vUl7IEaRDObmEbuv7u9E4WuaRSgCF0yRRM1U5WU35ggjq8bQzneMkME/OK7Wv5RWDo7e
         Wb9mmg15IgzKM/8DFlvitC1d+vDpOenPNsDEBSC5pUyLZvfzoxqitPPfLsUuLnhajHXt
         A90NZdp6clVEMEFnwtSgjKByf1TrszOsfgMYt8sRPmOw5QwanienrJK9AndR3KeKRvgl
         7vtw==
X-Gm-Message-State: AOAM532rBJau3M4y0KrPo2zbNEMk3Fey6qVR0dDhiGjI+3Tma566Q7BJ
        h31Zb0vabul+I/qVj281KQ==
X-Google-Smtp-Source: ABdhPJyZAweZWcirV+y5SAvErLhs1QJzoscLXh3nnj1Z1lnj9DZU1xEcBDVn0cjaPhrs+evcChLr6A==
X-Received: by 2002:a02:a493:: with SMTP id d19mr3651318jam.56.1590544776304;
        Tue, 26 May 2020 18:59:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id e13sm842438ils.27.2020.05.26.18.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 18:59:35 -0700 (PDT)
Received: (nullmailer pid 890822 invoked by uid 1000);
        Wed, 27 May 2020 01:59:35 -0000
Date:   Tue, 26 May 2020 19:59:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     pavel@ucw.cz, linux-kernel@vger.kernel.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v25 05/16] dt: bindings: lp55xx: Be consistent in the
 document with LED acronym
Message-ID: <20200527015935.GA890764@bogus>
References: <20200526164652.2331-1-dmurphy@ti.com>
 <20200526164652.2331-6-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526164652.2331-6-dmurphy@ti.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 26 May 2020 11:46:41 -0500, Dan Murphy wrote:
> Update the document to be consistent in case when using "LED".
> This acronym should be capital throughout the document.
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  Documentation/devicetree/bindings/leds/leds-lp55xx.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
