Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45520406544
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 03:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbhIJBjg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 21:39:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229721AbhIJBjg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 21:39:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CD8360235;
        Fri, 10 Sep 2021 01:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631237906;
        bh=86uwgpv3XHY0LHOHBnztwjKU6xGaIlZvY44jUqB/nFI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JIlwnRuWGDHWC8ATcmRLJCe4j81R/96waGMmJaWgbtoMA8xb4kffUdDKvRvx1ZQ5W
         pohPcgke1aaJ52uWIXoxLlZWk+wAylAX74PTlrlJHfDpCa5V24gcpOuY2u+FShPty0
         jUyMwwWqKS9az/f5EFCT96UaZPb9b24THLeVbJxT/7U5Xj1nU+HAXohPHjG8GnTB78
         rn69jKK/QWOGiYt//9Bl8pSjd10x7XylFJJNF9Uf+fGi1pvz/lsT0xblbE1q9wE6cR
         5KgQskJxiXrgs0UJdvN7U/GptuJwSNh6aJOmA3beK20RChA9r7JUKf8mBHWPFxCw51
         798UeW9yHUBPQ==
Date:   Fri, 10 Sep 2021 03:38:21 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 04/15] block: Add block device LED trigger
 integrations
Message-ID: <20210910033821.7da8299b@thinkpad>
In-Reply-To: <20210909222513.2184795-5-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
        <20210909222513.2184795-5-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu,  9 Sep 2021 17:25:02 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> @@ -166,6 +166,9 @@ struct gendisk {
>  #endif	/* CONFIG_BLK_DEV_INTEGRITY */
>  #if IS_ENABLED(CONFIG_CDROM)
>  	struct cdrom_device_info *cdi;
> +#endif
> +#if IS_ENABLED(CONFIG_LEDS_TRIGGER_BLKDEV)
> +	struct ledtrig_blkdev_disk *ledtrig;
>  #endif

So in this patch you are adding pointer to a structure, but the
structure is introduced in a later patch (07/15).

Please send these changes as one patch, it is easier to review.

Marek
