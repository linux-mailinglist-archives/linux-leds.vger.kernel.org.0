Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF23747C798
	for <lists+linux-leds@lfdr.de>; Tue, 21 Dec 2021 20:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241840AbhLUTkB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Dec 2021 14:40:01 -0500
Received: from mail-qt1-f170.google.com ([209.85.160.170]:41877 "EHLO
        mail-qt1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241839AbhLUTkB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Dec 2021 14:40:01 -0500
Received: by mail-qt1-f170.google.com with SMTP id v22so13868943qtx.8;
        Tue, 21 Dec 2021 11:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UtIIbLbI/nGMSaPhqMXkbKi1/MmnnfD6uECvU8i1Qbw=;
        b=7IEqoPNBqGSKOuSGXs7aM/I1urDMmz/nCCsyhZglvLZvuKQ/yOZzWmoEA3yy2HTyWz
         t7ZwRCwJ2cU+h+6ewZ5vCl8gPRRS2mgsh8kXrpdC4DLn4JOcw4nLaPLBfS0P92cSdaHF
         6T5rKRwo86UxaXPu4ud6LYxFobO8eOdP1KrVqfxN7hQ2D9B3uc0u67vf8QEX+sRSVegy
         zvwQd9t02Jmi6vNvuEmmhDuWAq32ADD2HD87Pg4/EjemKZ1ver4ZS9xz0Of9iQWM1907
         WKW7j7hlbmTFq3qvBEkk56cvrXapLFhSx1nqAmA9BGSpbBJHuRDGjKr3LxYbk277wGon
         sY2w==
X-Gm-Message-State: AOAM532pnNJ0NHGUl0O+gp7E40PLagJ/JyB2eBuRuGuWtL71qM3MJAO7
        54e9DaxC7tUGSSzHQGy/SQ==
X-Google-Smtp-Source: ABdhPJz4bdvP8ESU3Uh3QM2ba245Q9yTW11WaUOobmk6UB/3VTWBFNDKgAdQLRuzrOJqYxMOfjxdvg==
X-Received: by 2002:a05:622a:388:: with SMTP id j8mr3571514qtx.131.1640115600594;
        Tue, 21 Dec 2021 11:40:00 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
        by smtp.gmail.com with ESMTPSA id 196sm13890448qkd.61.2021.12.21.11.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 11:40:00 -0800 (PST)
Received: (nullmailer pid 1623903 invoked by uid 1000);
        Tue, 21 Dec 2021 19:39:57 -0000
Date:   Tue, 21 Dec 2021 15:39:57 -0400
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Milo Kim <milo.kim@ti.com>,
        Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Document rfkill* trigger
Message-ID: <YcItjUqxpAyhYJqW@robh.at.kernel.org>
References: <20211217170715.2893923-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211217170715.2893923-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 17 Dec 2021 18:07:14 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> LEDs can use rfkill events as a trigger source, so document these in the
> device tree bindings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/leds/common.yaml        | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
