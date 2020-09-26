Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC90C279B56
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 19:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIZRXm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 13:23:42 -0400
Received: from mail.nic.cz ([217.31.204.67]:39434 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgIZRXm (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 13:23:42 -0400
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 62508140AA0;
        Sat, 26 Sep 2020 19:23:39 +0200 (CEST)
Date:   Sat, 26 Sep 2020 19:23:38 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Adrian Schmutzler <freifunk@adrianschmutzler.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] MAINTAINERS: add include/dt-bindings/leds/ to
 linux-leds list
Message-ID: <20200926192338.0b233f26@nic.cz>
In-Reply-To: <20200926164745.3779-1-freifunk@adrianschmutzler.de>
References: <20200926164745.3779-1-freifunk@adrianschmutzler.de>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 26 Sep 2020 18:47:45 +0200
Adrian Schmutzler <freifunk@adrianschmutzler.de> wrote:

> The content of include/dt-bindings/leds/, particularly common.h,
> is apparantly maintained by the linux-leds list. This is also
> explicitly stated in the Documentation.
> 
> Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 190c7fa2ea01..415f0e089bbe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9809,6 +9809,7 @@ S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
>  F:	Documentation/devicetree/bindings/leds/
>  F:	drivers/leds/
> +F:	include/dt-bindings/leds/
>  F:	include/linux/leds.h
>  
>  LEGACY EEPROM DRIVER

Some subsystem maintainers do not want to touch the MAINTAINERS file
because of potential conflict. If Pavel refuses to do this, I was told
that the best way is to send such to Andrew Morton
<akpm@linux-foundation.org>.

Marek
