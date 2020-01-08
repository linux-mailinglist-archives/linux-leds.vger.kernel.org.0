Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE526134836
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 17:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgAHQmG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jan 2020 11:42:06 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35529 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729160AbgAHQmF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jan 2020 11:42:05 -0500
Received: by mail-oi1-f195.google.com with SMTP id k4so3209373oik.2
        for <linux-leds@vger.kernel.org>; Wed, 08 Jan 2020 08:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Icg47JqvHN2zEf9dLVseBc9ilOfxDem/7KAl7G0secI=;
        b=krnF7Gpl6S9SYQLDzBX6Of5WSJ2BuovAFO9Z2kt1RQc1yLV3muLbYIe+4+TlgLfUSF
         3fAywYzD/kY8rB8fYKj97ysnDfj4I9qdaURIDMDGziCqV866wChaJV7zpOQoiRzOSQe5
         BntFSXjJVbUQrLXwxbZ+Jjwhsqyt5AAqHGBks6gNQFULgqoyrbjJh3KjXTxLaJNb0UlZ
         ACfQYFZUZE0xo7g1Q5Wb/JEIf9bFBJu7D6R2kPaHZgR3ETucj7F0Laizk11QrhTksWfp
         /CjRb8ARWSCmWrdsc5nYRQh3n7oo6xmwf0d2lYNc1Cmwz4JgQxvfjbsFfy4d4S+229p1
         RYDw==
X-Gm-Message-State: APjAAAXie0+g1J2rW19wpdVbpRee8bVVaDHWf5seHExKcvY8257ehQJ5
        WYLpRcHuGoy62D+nZHPQrreRUyU=
X-Google-Smtp-Source: APXvYqyWGZ/mtl7wO8eDxi60Ctd5HMalRX9qJeW0jNe3NJrpKuhEVMIKCzSKmaMHLYWb+SqSKfpGIQ==
X-Received: by 2002:aca:f555:: with SMTP id t82mr3953040oih.103.1578501724273;
        Wed, 08 Jan 2020 08:42:04 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n22sm1292123otj.36.2020.01.08.08.42.03
        for <linux-leds@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:42:03 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2208fa
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:42:02 -0600
Date:   Wed, 8 Jan 2020 10:42:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Mohana Datta Yelugoti <ymdatta.work@gmail.com>
Cc:     jacek.anaszewski@gmail.com, trivial@kernel.org,
        Mohana Datta Yelugoti <ymdatta.work@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: spi-ir-led: fix spelling mistake
 "balue"->"value"
Message-ID: <20200108164202.GA15850@bogus>
References: <20191225205941.28429-1-ymdatta.work@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191225205941.28429-1-ymdatta.work@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 26 Dec 2019 02:29:39 +0530, Mohana Datta Yelugoti wrote:
> There is a spelling mistake in:
>       Documentation/bindings/leds/irled/spi-ir-led.txt.
> Fix it.
> 
> Signed-off-by: Mohana Datta Yelugoti <ymdatta.work@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/irled/spi-ir-led.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks.

Rob
