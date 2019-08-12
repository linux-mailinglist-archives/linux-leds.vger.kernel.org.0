Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3D08A70A
	for <lists+linux-leds@lfdr.de>; Mon, 12 Aug 2019 21:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfHLT2Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Aug 2019 15:28:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36507 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfHLT2Z (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Aug 2019 15:28:25 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so11846398wrt.3;
        Mon, 12 Aug 2019 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SvJtnd+awjHMfeDNM4qEk64doMEwP/lZaW8IGBdXnaA=;
        b=BSRG/wCs4IHapT8X4TepI79b7OhGaS4OuZPlRUqXEnWx4PgNIGmCqbRxi/2BtPQYfe
         NjWKy9ySFUsTFJsOw9NG3+BzwbrZwZNo4RCUujatvGuiIufD5nC93fsHr6R5oh1XNOf0
         QrVXo/SLkV6Q4ywAsyzjhQtq7cZyTEYZ8LFca1H+6pGUSDyWPUZLzDhXy5LzK6+IsXmn
         aAx+RKpJ6mlPOLxzOvZ6nQq7kxe3DVTn+ZYKTXeMR80tfQ8dBBfNk0fEH15Z+u5ex+lO
         DSfn43ks5YUw05L4p7hVS6VPNjGh8UMeImQUbFBDJV6ZgKyCUjjxUUV7bTDgWg9YaJIk
         l7Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=SvJtnd+awjHMfeDNM4qEk64doMEwP/lZaW8IGBdXnaA=;
        b=JG48HEeGMThD4ykXeQ0oDClEBLFrqjck6rxhhJoC1V6lIfTy8+As350LupNykYxCQB
         ckLpvM5ptvKSSVvqnmjkTLcm4IOBXGVqPmGDuDHhdtSnfcrTUD+AN9JoRyq6+CxJVSr4
         8KJcAOpeJYDq9PBGasqEP6J81kNITV4xZtFipoQf6xm0Y8n5rpEoFhpEWPgbwkYFXE0a
         D70gqSsL6/Jw2znnr6vnlJ0khRWB5+wrGZa9iCYsqcvIxZg77ieGVwEcZC6lXY1JH0Kn
         Q+UwdxpSjhI1z+2w0SnLLehxuJFtsrCBBcGBeRI4PHqYX+IEjh/0sne/FuFz22hzea6H
         3UBA==
X-Gm-Message-State: APjAAAUbt5pyM7FITW0NLTuRVS0fdVQ9f2mD4qPftnnnlveXCT85g6+u
        7phBSSmHqd+KjgwAXeyJN/Q=
X-Google-Smtp-Source: APXvYqxfT4LS6umT9F+b9cu/j4EAw0cjjDKc3jjpOXx90Sbb5SchAeJCZHYtEL3VH4m0PceyulSmfw==
X-Received: by 2002:adf:ffc2:: with SMTP id x2mr21780663wrs.338.1565638102407;
        Mon, 12 Aug 2019 12:28:22 -0700 (PDT)
Received: from [192.168.1.19] (ckn98.neoplus.adsl.tpnet.pl. [83.31.89.98])
        by smtp.gmail.com with ESMTPSA id v16sm103393512wrn.28.2019.08.12.12.28.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 12:28:21 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] block: introduce LED block device activity trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-nvme@lists.infradead.org,
        linux-scsi@vger.kernel.org
Cc:     Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jens Axboe <axboe@kernel.dk>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Hannes Reinecke <hare@suse.com>
References: <1565459703-30513-1-git-send-email-akinobu.mita@gmail.com>
 <1565459703-30513-5-git-send-email-akinobu.mita@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1b341463-3a0d-93cc-9d76-bbddf5a6e434@gmail.com>
Date:   Mon, 12 Aug 2019 21:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565459703-30513-5-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Akinobu,

Thank you for the update. I have one more remark to this patch
below.

On 8/10/19 7:55 PM, Akinobu Mita wrote:
> This allows LEDs to be controlled by block device activity.
> 
> We already have ledtrig-disk (LED disk activity trigger), but the lower
> level disk drivers need to utilize ledtrig_disk_activity() to make the
> LED blink.
> 
> The LED block device trigger doesn't require the lower level drivers to
> have any instrumentation. The activity is collected by polling the disk
> stats.
> 
> Example:
> 
> echo block-nvme0n1 > /sys/class/leds/diy/trigger
> 
> Cc: Frank Steiner <fsteiner-mail1@bio.ifi.lmu.de>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Hannes Reinecke <hare@suse.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
> * v3
> - Add ABI documentation
> - Add more detail to Kconfig help text
> 
>  .../ABI/testing/sysfs-class-led-trigger-blk        |  37 ++++
>  block/genhd.c                                      |   2 +
>  drivers/leds/trigger/Kconfig                       |   9 +
>  drivers/leds/trigger/Makefile                      |   1 +
>  drivers/leds/trigger/ledtrig-blk.c                 | 225 +++++++++++++++++++++
>  include/linux/genhd.h                              |   3 +
>  include/linux/leds.h                               |  27 +++
>  7 files changed, 304 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-blk
>  create mode 100644 drivers/leds/trigger/ledtrig-blk.c
> 
[...]
> +EXPORT_SYMBOL_GPL(ledtrig_blk_unregister);
> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
> index 8b5330d..b2c934e 100644
> --- a/include/linux/genhd.h
> +++ b/include/linux/genhd.h
> @@ -17,6 +17,7 @@
>  #include <linux/percpu-refcount.h>
>  #include <linux/uuid.h>
>  #include <linux/blk_types.h>
> +#include <linux/leds.h>
>  #include <asm/local.h>
>  
>  #ifdef CONFIG_BLOCK
> @@ -219,6 +220,8 @@ struct gendisk {
>  	int node_id;
>  	struct badblocks *bb;
>  	struct lockdep_map lockdep_map;
> +
> +	struct ledtrig_blk led;

Please rename this property to led_trig to reflect
its purpose accurately.

>  };
>  
>  static inline struct gendisk *part_to_disk(struct hd_struct *part)
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 9b2bf57..395fa61 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -517,4 +517,31 @@ static inline void ledtrig_audio_set(enum led_audio type,
>  }
>  #endif
>  
> +struct gendisk;
> +
> +#ifdef CONFIG_LEDS_TRIGGER_BLOCK
> +
> +struct ledtrig_blk {
> +	struct led_trigger trig;
> +};
> +
> +int ledtrig_blk_register(struct gendisk *disk);
> +void ledtrig_blk_unregister(struct gendisk *disk);
> +
> +#else
> +
> +struct ledtrig_blk {
> +};
> +
> +static inline int ledtrig_blk_register(struct gendisk *disk)
> +{
> +	return 0;
> +}
> +
> +static inline void ledtrig_blk_unregister(struct gendisk *disk)
> +{
> +}
> +
> +#endif /* CONFIG_LEDS_TRIGGER_BLOCK */
> +
>  #endif		/* __LINUX_LEDS_H_INCLUDED */
> 

-- 
Best regards,
Jacek Anaszewski
