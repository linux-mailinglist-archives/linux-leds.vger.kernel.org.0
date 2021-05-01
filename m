Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BB13705E0
	for <lists+linux-leds@lfdr.de>; Sat,  1 May 2021 08:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhEAGZM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 1 May 2021 02:25:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:46940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhEAGZM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 1 May 2021 02:25:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F033D613C2;
        Sat,  1 May 2021 06:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619850261;
        bh=X9cYeVXcga7kObVA/p1U0zrIolbkSZQkyIvB3ZJbuEc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vvKskF8A3MqcJvyaMlaBzRiSpwXUFgxqqJHthqQW9syCx4jeqsxXZHSR1s7Lbyw4E
         3wPyrmR6mxInIoxNzLFq+tNhN931Q2HKNpucp9/6KjWh2+M+2IKcnJ5MVnKZseGzHY
         rENlfN6cHDZgqqutaby3B12wsgoThhqjMiCCfzPs=
Date:   Sat, 1 May 2021 08:24:16 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Enzo Matsumiya <ematsumiya@suse.de>
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        u.kleine-koenig@pengutronix.de, Jens Axboe <axboe@kernel.dk>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] block: export block_class and disk_type symbols
Message-ID: <YIz0EBqKTHhB+n8N@kroah.com>
References: <20210430183216.27458-1-ematsumiya@suse.de>
 <20210430183216.27458-2-ematsumiya@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430183216.27458-2-ematsumiya@suse.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Apr 30, 2021 at 03:32:10PM -0300, Enzo Matsumiya wrote:
> Export symbols to be used by _for_each_blk() helper in LED block
> trigger.
> 
> Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
> ---
>  block/genhd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/block/genhd.c b/block/genhd.c
> index 8c8f543572e6..516495179230 100644
> --- a/block/genhd.c
> +++ b/block/genhd.c
> @@ -1218,6 +1218,7 @@ static void disk_release(struct device *dev)
>  struct class block_class = {
>  	.name		= "block",
>  };
> +EXPORT_SYMBOL(block_class);
>  
>  static char *block_devnode(struct device *dev, umode_t *mode,
>  			   kuid_t *uid, kgid_t *gid)
> @@ -1235,6 +1236,7 @@ const struct device_type disk_type = {
>  	.release	= disk_release,
>  	.devnode	= block_devnode,
>  };
> +EXPORT_SYMBOL(disk_type);
>  
>  #ifdef CONFIG_PROC_FS
>  /*

Please please no.  These should not be needed by anything.

And if they really do, they must be EXPORT_SYMBOL_GPL().

thanks,

greg k-h
