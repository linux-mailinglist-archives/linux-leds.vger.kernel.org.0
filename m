Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D662B3D9D3E
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 07:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhG2FwY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 01:52:24 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:39645 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233739AbhG2FwX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Jul 2021 01:52:23 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id A7FAA5803F8;
        Thu, 29 Jul 2021 01:52:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 29 Jul 2021 01:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=viiBn1GywulERgvrKcCmkXUyuBc
        +hfV25KNyhlk4biE=; b=UvBUR3YSV1Hzv1rHB+81W9W34BIL1FI5U6cXTigUmL/
        46ODEIp8Kx7bAynesl+dIL6v0Q/iXqjtQjguo7w4zE3oFJmZrjaMWM35HTzcO+Hr
        PB9LgXc0v5rVc7Vvs7UYo8BoeeKpFqdtXJOiniOQOHV2q4uK65Dd90Rp/hyXsVaO
        ZyDgV36GQw673DE9qDtLLtPZZ+gJMflXvxKYAJigEGFJkHgyHSFn92Ytml0j/zxj
        WVaViCDv+ftKZZ9HBUnTjXcoSk24ubmoPSZDzxv8vDLFHX9MPuyTpsMn/CeooxP5
        KvEmLHuOcRgK7S1kKNM28yfZfqkvPfXXHp2PoKabXew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=viiBn1
        GywulERgvrKcCmkXUyuBc+hfV25KNyhlk4biE=; b=ZPwAAszRN1awh/jGyBm78/
        7vUhL5y7FGte7hlzU3CkqzNtuO0eFM9XdbR3OnSo3skQrB3FCatPPsvmtLgHmCZd
        yo9+sZpuF/OqKytUSJu/nHwMn+5Y86MV+P0fSF+RJSh5E6ftRc/LKe9CdqcC6Ed8
        +MSGjkmwFHprHRF/1eJDXgAK8vQA4ZyrR1zI9sM9LIJYj4ylG5EylMHuGTSa3sK2
        OzRPmC4lfiLhN/OnsS/JkxAoo603S/yHPPHVCaeaIvYgsCZzIny3oHyvOh+xTDRc
        +Z7j9wEOzFp1Yj54n7mQXia+oHSUliWVY9gVFMvZriImJ6aB/VZ6pB13YMH6MCxg
        ==
X-ME-Sender: <xms:D0ICYdMF1N79dQx7LJMZN3ENRO2Pkz5uM9mum12E_7kQYqJ0AlVzLw>
    <xme:D0ICYf8o_P3J2FXD5fIyfF_S4pUvHfayWQxQiGrK8crTFeu0mC7_Meups7D3wOIvJ
    2th2qeKnRj4Dg>
X-ME-Received: <xmr:D0ICYcTmppWFaMoou0irXWAo6QwiFia-Y2kuJ2TjS14cNUflYVYoE_vZz8yWAendAX4566Vi1xhGE9_aT9-Yz2HOwMxxRmIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeen
    ucggtffrrghtthgvrhhnpeevueehjefgfffgiedvudekvdektdelleelgefhleejieeuge
    egveeuuddukedvteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:D0ICYZvF96QQm0rtPvy0kQAYP8jrPWtb4RU39N4OURt0Ku3LqEIOKA>
    <xmx:D0ICYVcpMKo8ViFWvYzrs58-SkBBxnmiIhtyrHz4SL2qrPg04HxGAg>
    <xmx:D0ICYV1gwMrVTbNRm3BnOvLmL6YUuYr4xYYr2pAgONW7gHtTGUJCTA>
    <xmx:EEICYT0tZvuO9P27kP4ZNTuF1tDouXEg78ftOu4qCp2gGtbZJsO-eg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Jul 2021 01:52:15 -0400 (EDT)
Date:   Thu, 29 Jul 2021 07:52:11 +0200
From:   Greg KH <greg@kroah.com>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org, pavel@ucw.cz,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH 3/8] block: Add kernel APIs to create & delete block
 device LED triggers
Message-ID: <YQJCC66c2v7Dv59j@kroah.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-4-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729015344.3366750-4-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 28, 2021 at 08:53:39PM -0500, Ian Pilcher wrote:
> * New file - include/linux/blk-ledtrig.h
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  block/blk-ledtrig.c         | 152 ++++++++++++++++++++++++++++++++++++
>  include/linux/blk-ledtrig.h |  19 +++++
>  2 files changed, 171 insertions(+)
>  create mode 100644 include/linux/blk-ledtrig.h
> 
> diff --git a/block/blk-ledtrig.c b/block/blk-ledtrig.c
> index 345a3b6bdbc6..c69ea1539336 100644
> --- a/block/blk-ledtrig.c
> +++ b/block/blk-ledtrig.c
> @@ -6,9 +6,11 @@
>   *	Copyright 2021 Ian Pilcher <arequipeno@gmail.com>
>   */
>  
> +#include <linux/blk-ledtrig.h>
>  #include <linux/leds.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> +#include <linux/slab.h>
>  
>  
>  /*
> @@ -49,3 +51,153 @@ static struct blk_ledtrig *blk_ledtrig_find(const char *const name,
>  
>  	return NULL;
>  }
> +
> +
> +/*
> + *
> + *	Create a new trigger
> + *
> + */
> +
> +static int __blk_ledtrig_create(const char *const name, const size_t len)
> +{
> +	struct blk_ledtrig *t;
> +	int ret;
> +
> +	if (len == 0) {
> +		pr_warn("empty name specified for blockdev LED trigger\n");
> +		ret = -EINVAL;
> +		goto create_exit_return;
> +	}
> +
> +	ret = mutex_lock_interruptible(&blk_ledtrig_list_mutex);
> +	if (unlikely(ret != 0))

Only ever use likely/unlikely if you can measure the difference without
it.  Otherwise the CPU and compiler will almost always get it right and
you should not clutter up the code with them at all.

For something like this function, where there is no speed difference at
all, there is no need for these types of markings, so I would recommend
just removing them all from your patchset.

thanks,

greg k-h
