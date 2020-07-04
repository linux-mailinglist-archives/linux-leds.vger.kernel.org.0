Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDA82145C6
	for <lists+linux-leds@lfdr.de>; Sat,  4 Jul 2020 14:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgGDMRk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Jul 2020 08:17:40 -0400
Received: from vps.xff.cz ([195.181.215.36]:34564 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbgGDMRk (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Jul 2020 08:17:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1593865058; bh=fmBllpkZn/tc9cPS2CeTHDFwf+kw4NnVGVKOwpUytdE=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=rMeNKxuZFu3KR82dAvGPOzL5RSZ3QMQGut6PXq7IbdRTRkttB5a0rVZDylSXLHtGY
         jypyVjg6TLVBL2e+TUnQYdJr8gJi9bwqj3x+RcLCAB2QX5WzVk3MfYg5hB4DZ465Ph
         y1r3YAFinOlFm5lKSiameQzh9GV5fg3g9rCIKtEo=
Date:   Sat, 4 Jul 2020 14:17:37 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200704121737.xiwcqzsfuzy3k3qf@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200704120459.GE16083@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200704120459.GE16083@amd>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

On Sat, Jul 04, 2020 at 02:04:59PM +0200, Pavel Machek wrote:
> Hi!
> 
> > Add support for registering per-LED device trigger.
> > 
> > Names of private triggers need to be globally unique, but may clash
> > with other private triggers. This is enforced during trigger
> 
> Globally unique name is going to be a problem, no? If you have two
> keyboards with automatical backlight support...

Only globally unique in a sense that they must not clash with non
per-LED trigger names. So you can have two keyboards with 'self-working'
trigger on their LED devices in sysfs.

This requirement only comes from the fact that this shares the
same sysfs configuration interface as regular non-private triggers.

regards,
	o.

> Otherwise... yes, we need something like this.
> 
> Best regards,
> 								Pavel
> -- 
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany


