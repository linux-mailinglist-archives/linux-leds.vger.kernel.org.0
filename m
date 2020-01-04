Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20B47130485
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jan 2020 22:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgADVLI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jan 2020 16:11:08 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:43579 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbgADVLI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Jan 2020 16:11:08 -0500
Received: by mail-il1-f193.google.com with SMTP id v69so39323849ili.10
        for <linux-leds@vger.kernel.org>; Sat, 04 Jan 2020 13:11:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qyoQKQJfODTyZbS5URI1sv4NTniZDyCb+lWHf5D5y/M=;
        b=RX/zii5acT4GnAmGkHWAKO7za/G8AY7EbmJO4GTYSPkSjZ6c5kvJHQOmVks+K4tNGn
         qBWMvAw/C2RYK+naSZWMAuaJeYvVzhFgcETBVRhcLq4FjVsWuopaoykRFqHWfAFqt14i
         d1E15ZBN/MB2QnFOEBoi1dBLXs7n4NWEK0l5cR61QfoY1hQlvR1NwC7jVPCYQ1qaBLpp
         ubEkLzJmiQz3mI0enu10lP3kOtj1LIT9fCJ/nkij/222ZvW3DxBypSNZuZAbl4fHlEC0
         v5X4/xKxIfGYzFs+NtF+tpNJ/9nHi6v9VJzZ4crZXwD5UT+jMMbkZIr4amK1HaicUBsi
         QQsA==
X-Gm-Message-State: APjAAAWWBKJPyhJjrh69QZeyGKu6awqG2nc3U5IYEYyJKryTe0Xj5I5l
        SvEB3nJEbp5UhMxcPv9r38lkO/I=
X-Google-Smtp-Source: APXvYqw/40KAOz1Hcoi1DRLzlSNAc0OAVjQHY4Ct+8UkJa3G3bRltPq7SdheWU5NZEW7wl5Hj/V53w==
X-Received: by 2002:a92:8309:: with SMTP id f9mr82364105ild.50.1578172267124;
        Sat, 04 Jan 2020 13:11:07 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id j88sm22220322ilf.83.2020.01.04.13.11.06
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:11:06 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:11:04 -0700
Date:   Sat, 4 Jan 2020 14:11:04 -0700
From:   Rob Herring <robh@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] dt: bindings: lm3692x: Add ti,ovp-microvolt
 property
Message-ID: <20200104211104.GA19869@bogus>
References: <cover.1578134779.git.agx@sigxcpu.org>
 <e6d0ef33f264c4ae679e586a1533fc7a97975db7.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6d0ef33f264c4ae679e586a1533fc7a97975db7.1578134779.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat,  4 Jan 2020 11:54:17 +0100, =?UTF-8?q?Guido=20G=C3=BCnther?= wrote:
> This allows to set the overvoltage protection to 17V, 21V, 25V or 29V.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
