Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F23E83D9D42
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 07:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhG2Fx0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 01:53:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:59034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233739AbhG2FxZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Jul 2021 01:53:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C210F60C51;
        Thu, 29 Jul 2021 05:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627538002;
        bh=ndPuKMgqpIbhmriDtRgAwJR0/HGvhnXHJhwddEWsuSI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jBBKp0xb5ULry4DVjTYZWx9gHV0P3v7/rQpUe+oyFU9StOQ6efu0uZnFFssdytP8C
         S9LT+ayF86lLNN1dNCgxkiplAQj8rAQU2JFcI4XHNMiS93FokimrSlv4y21ac5ZIyg
         /z8XWXycUbOKrN5vtpfhdLD4lVwS2DyZdqw+t6AE=
Date:   Thu, 29 Jul 2021 07:53:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org, pavel@ucw.cz,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH 1/8] docs: Add block device LED trigger documentation
Message-ID: <YQJCTQfdBRyyz5t6@kroah.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-2-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729015344.3366750-2-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 28, 2021 at 08:53:37PM -0500, Ian Pilcher wrote:
> * Document the sysfs attributes (/sys/class/block/led_trigger_*
>   and /sys/class/block/${DEV}/led_trigger) that can be used to
>   create, list, and delete block device LED triggers and to
>   set and clear device/trigger associations.

sysfs apis belong in Documentation/ABI/ like all other entries.



> 
> * Pull API documentation from block/blk-ledtrig.c (once it
>   exists).
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  Documentation/block/index.rst        |   1 +
>  Documentation/block/led-triggers.rst | 124 +++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+)
>  create mode 100644 Documentation/block/led-triggers.rst
> 
> diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
> index 86dcf7159f99..a125ecdb4c7b 100644
> --- a/Documentation/block/index.rst
> +++ b/Documentation/block/index.rst
> @@ -25,3 +25,4 @@ Block
>     stat
>     switching-sched
>     writeback_cache_control
> +   led-triggers
> diff --git a/Documentation/block/led-triggers.rst b/Documentation/block/led-triggers.rst
> new file mode 100644
> index 000000000000..a67e06c68073
> --- /dev/null
> +++ b/Documentation/block/led-triggers.rst
> @@ -0,0 +1,124 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============
> +LED Triggers
> +============
> +
> +Available when ``CONFIG_BLK_LED_TRIGGERS=y``.
> +
> +sysfs interface
> +===============
> +
> +Create a new block device LED trigger::
> +
> +	# echo foo > /sys/class/block/led_trigger_new
> +
> +The name must be unique among all LED triggers (not just block device LED
> +triggers).
> +
> +Create two more::
> +
> +	# echo bar baz > /sys/class/block/led_trigger_new
> +
> +List the triggers::
> +
> +	# cat /sys/class/block/led_trigger_list
> +	baz: 0
> +	bar: 0
> +	foo: 0

As was pointed out, this is not ok for a sysfs file, sorry.

thanks,

greg k-h
