Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3715121CA97
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 19:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbgGLRNT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 13:13:19 -0400
Received: from lists.nic.cz ([217.31.204.67]:51476 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728859AbgGLRNS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 13:13:18 -0400
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id D51DF13F695;
        Sun, 12 Jul 2020 19:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594573995; bh=IdpjkEs0baFSLdPZACLe10nfwrtF82lLhF1z9A2cKrE=;
        h=Date:From:To;
        b=V/Ue66OXddxfeTBv55NCWebdOTpChau5tYqADSDnwCIjwqpDrAmn+9XP4XFlvv8bO
         fYWkZS8uVs19BBEK7JcGUBh4vgTA0jiJZWkuGZNkPe7Aae3xZltN5SfQyLeiYlY4/9
         xH762pf8DOgvu1R3yENdXZL42rcqxWxvOxV5w+iU=
Date:   Sun, 12 Jul 2020 19:13:15 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, jacek.anaszewski@gmail.com,
        robh@kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v29 00/16] Multicolor Framework v29
Message-ID: <20200712191315.5dab10a6@nic.cz>
In-Reply-To: <20200704124729.GA20088@amd>
References: <20200622185919.2131-1-dmurphy@ti.com>
        <20200704124729.GA20088@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sat, 4 Jul 2020 14:47:29 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > This is the multi color LED framework.   This framework presents clustered
> > colored LEDs into an array and allows the user space to adjust the brightness
> > of the cluster using a single file write.  The individual colored LEDs
> > intensities are controlled via a single file that is an array of LEDs
> > 
> > Change to the LEDs Kconfig to fix dependencies on the LP55XX_COMMON.
> > Added update to the u8500_defconfig  
> 
> Marek, would you be willing to look over this series?

Overall this series looks good to me. I wanted to apply version 29 of
the patches, but I didn't receive all patches in v29 (some are
missing), so I had to search for previous versions of selected patches.

I have seen some typos in documentation, but that can be solved
afterwards.

One thing I don't like much is that in the sysfs multi_index and
multi_intensity files there is a trailing space after the last color.
This is not true for example for the trigger file. It is trivial to fix
this, so again maybe a will send a follow-up patch after this series is
accepted.

Marek

> Dan, can we please get it in the order
> 
> 1) fixes first
> 
> 2) changes needed for multicolor but not depending on dt acks
> 
> 3) dt changes
> 
> 4) rest?
> 
> This is the order it should have been in the first place, and I'd like
> to get fixes applied, and perhaps some of the preparation.
> 
> Best regards,
> 									Pavel
> 

