Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90AA5130489
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jan 2020 22:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgADVLn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jan 2020 16:11:43 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:42644 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgADVLn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 4 Jan 2020 16:11:43 -0500
Received: by mail-il1-f193.google.com with SMTP id t2so24010580ilq.9
        for <linux-leds@vger.kernel.org>; Sat, 04 Jan 2020 13:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=2DHefjLQc6S51MdSwDdwJfZErHx2CFrIYRVhl6DWIYE=;
        b=Xko1CIw4EdU3HdVWbsTlSRilY5cowK0WoswZYGt9IU8c2HQ5xFtqifh8bPXZY5kuXs
         RWP9VutBuTHGFpwJqYf1MrMCurONGYHQBvbcVeH/tALPMBTIqW6GV1EYiuGUDK/94fJs
         jD/RV9YPO7NvAW15VB2QLEOaafVDAx3cWFOzPRY18O3tGFIWcHQWhPig/Y+v2AP779NK
         agOpdH5umWSiI/RT3EWtaBRpxtKwUK/Ujlv6UD6GjmKK1S6LMiJmSsKLxV8ZQ4n14ZpE
         hLcQbDXQfQwQFobvgcLwxWSwykyL+vMbIKaKKgl3Xh07QBCJq/paM+btp4H5jK1n25fI
         U/MQ==
X-Gm-Message-State: APjAAAVUfqQz3xy9aZaXNOTJmXcxGhJ5OyIiFSHlhYmn91MpD1DxX/T7
        FB6qUMMx8Gc3CVUjqv6tM47NLgc=
X-Google-Smtp-Source: APXvYqwpWDmbd4geKabsPCmtvz3F5Iwg3FyOSEok1GNKaAa59liTXI14nYBS7ySKIGtEMdidWDjtOQ==
X-Received: by 2002:a92:9a47:: with SMTP id t68mr76039125ili.155.1578172301943;
        Sat, 04 Jan 2020 13:11:41 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id 16sm15952998ioe.84.2020.01.04.13.11.40
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:11:41 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219b7
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:11:40 -0700
Date:   Sat, 4 Jan 2020 14:11:40 -0700
From:   Rob Herring <robh@kernel.org>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] dt: bindings: lm3692x: Add
 ti,brightness-mapping-exponential property
Message-ID: <20200104211140.GA20909@bogus>
References: <cover.1578134779.git.agx@sigxcpu.org>
 <7df957d4f7902a5d2a30695ab2a5de19eb7772d3.1578134779.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7df957d4f7902a5d2a30695ab2a5de19eb7772d3.1578134779.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat,  4 Jan 2020 11:54:19 +0100, =?UTF-8?q?Guido=20G=C3=BCnther?= wrote:
> This allows to select exponential brightness mode instead of the default
> linear mode.
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  Documentation/devicetree/bindings/leds/leds-lm3692x.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
