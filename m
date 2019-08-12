Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA1688A717
	for <lists+linux-leds@lfdr.de>; Mon, 12 Aug 2019 21:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfHLTbY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Aug 2019 15:31:24 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37929 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbfHLTbY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Aug 2019 15:31:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id m125so610810wmm.3;
        Mon, 12 Aug 2019 12:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=osme3wJy3zn3de455XhA8Ah26SviAhkd22YSiEKt9VI=;
        b=FDuBH2uNV4g7oiw5ZcLnJ2ziUTlTg92nNDWh3a2rmF3WYbF5hJ7SSjlwKCn0t2TgFP
         I/cHIQbKk/VIYpUeXtapuDs9AzNxLypjT9A9Ls8xi7FqZ3SYqhpVx8e0Hhki1aWpln0Y
         epql6zcCwMCl2s56MmYP3BAiYnmaZi9y9TGMddilaOjMQMw/aQa06p0fbD0LehoqSp6a
         thMUIN7cT2BIFbLyVdeGFp4Tr3ulw++pkM/iVIZMONlbs6Swhls3ygEvKfpLeTU/aps5
         mi0cb89BxcLpkgvjunD3DTLquHpVFF0S0AbAiIVlnPMKoeDMSnj6jJJGv4V+ssinJNw5
         tIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=osme3wJy3zn3de455XhA8Ah26SviAhkd22YSiEKt9VI=;
        b=pGDhhPzNVqxAAaoem7mi/8ZR0Tak77AqSicL++VWIpWoUee9N3G+AQg1TTskaVP0EK
         ZnKuuDXyyuO/zRwWvzDjURjzbK4fpytFCoYXEvT6XsngPeZHNKxMobp64NfJGaQH2OZb
         G/krod3u0EDfePGD/0ef+sHgKvIpuUNLwOUBKgqh5Gtrq5P2U/uVGw07UmU4nXAx+wTh
         k9HRxPMgUFil4ZjC+Es4yGr26sQ0X3+/JOmIptMVT0FsNeDl8aY2U5xlT02z+MX6x/8k
         HdScMb17VEIQDqqWi+6KeXdMa4eIYtqSzN0Tau1rswjkq9jv16kJmZIdYmAdGHpqciAR
         GmXw==
X-Gm-Message-State: APjAAAU+xxdXOjYc9FKbArtPbdS9lQsG/RdfP5TQPZmJRswhVsWe9x7S
        4F84BwmuCA6aJ+QL/4S0wZI=
X-Google-Smtp-Source: APXvYqwiErgEUJqkqpC4nT3lwm3bkdizn29ARra7kpQVss8qYIf/NJoo0kav47F6MVB3gXyf+AyvYg==
X-Received: by 2002:a1c:c005:: with SMTP id q5mr782801wmf.59.1565638280671;
        Mon, 12 Aug 2019 12:31:20 -0700 (PDT)
Received: from [192.168.1.19] (ckn98.neoplus.adsl.tpnet.pl. [83.31.89.98])
        by smtp.gmail.com with ESMTPSA id t14sm12475925wrv.12.2019.08.12.12.31.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 12:31:20 -0700 (PDT)
Subject: Re: [PATCH v3 5/6] ledtrig-blk: add interface to stop and restart
 polling disk stats
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
 <1565459703-30513-6-git-send-email-akinobu.mita@gmail.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e1ece602-b413-b391-c7c3-34a8e46254c4@gmail.com>
Date:   Mon, 12 Aug 2019 21:31:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565459703-30513-6-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Akinobu,

I don't see any vital reason to keep this change separately.
We're introducing new trigger, so please just squash it with
the patch 4/6.

Best regards,
Jacek Anaszewski

On 8/10/19 7:55 PM, Akinobu Mita wrote:
> The LED block device activity trigger periodically polls the disk stats
> to collect the activity.  However, it is pointless to poll while the
> block device is in quiescent state.
> 
> This provides an optional interface to stop and restart polling disk stats
> for the lower-level block drivers.
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
>  drivers/leds/trigger/ledtrig-blk.c | 37 +++++++++++++++++++++++++++++++++++--
>  include/linux/leds.h               | 11 +++++++++++
>  2 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/trigger/ledtrig-blk.c b/drivers/leds/trigger/ledtrig-blk.c
> index d5808c9..6b826ed 100644
> --- a/drivers/leds/trigger/ledtrig-blk.c
> +++ b/drivers/leds/trigger/ledtrig-blk.c
> @@ -153,8 +153,9 @@ static void ledtrig_blk_work(struct work_struct *work)
>  		trig_data->last_activity = activity;
>  	}
>  
> -	schedule_delayed_work(&trig_data->work,
> -			      atomic_read(&trig_data->interval) * 2);
> +	if (atomic_read(&disk->led.enable_count))
> +		schedule_delayed_work(&trig_data->work,
> +				      atomic_read(&trig_data->interval) * 2);
>  }
>  
>  static int ledtrig_blk_activate(struct led_classdev *led_cdev)
> @@ -190,6 +191,36 @@ static void ledtrig_blk_deactivate(struct led_classdev *led_cdev)
>  	kfree(trig_data);
>  }
>  
> +void ledtrig_blk_disable(struct gendisk *disk)
> +{
> +	if (disk)
> +		atomic_dec(&disk->led.enable_count);
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_blk_disable);
> +
> +void ledtrig_blk_enable(struct gendisk *disk)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	if (!disk)
> +		return;
> +
> +	atomic_inc(&disk->led.enable_count);
> +
> +	read_lock(&disk->led.trig.leddev_list_lock);
> +
> +	list_for_each_entry(led_cdev, &disk->led.trig.led_cdevs, trig_list) {
> +		struct ledtrig_blk_data *trig_data =
> +			led_get_trigger_data(led_cdev);
> +
> +		schedule_delayed_work(&trig_data->work,
> +				      atomic_read(&trig_data->interval) * 2);
> +	}
> +
> +	read_unlock(&disk->led.trig.leddev_list_lock);
> +}
> +EXPORT_SYMBOL_GPL(ledtrig_blk_enable);
> +
>  int ledtrig_blk_register(struct gendisk *disk)
>  {
>  	int ret;
> @@ -203,6 +234,8 @@ int ledtrig_blk_register(struct gendisk *disk)
>  	disk->led.trig.deactivate = ledtrig_blk_deactivate;
>  	disk->led.trig.groups = ledtrig_blk_groups;
>  
> +	atomic_set(&disk->led.enable_count, 1);
> +
>  	ret = led_trigger_register(&disk->led.trig);
>  	if (ret) {
>  		kfree(disk->led.trig.name);
> diff --git a/include/linux/leds.h b/include/linux/leds.h
> index 395fa61..fd2eb7c 100644
> --- a/include/linux/leds.h
> +++ b/include/linux/leds.h
> @@ -523,8 +523,11 @@ struct gendisk;
>  
>  struct ledtrig_blk {
>  	struct led_trigger trig;
> +	atomic_t enable_count;
>  };
>  
> +void ledtrig_blk_enable(struct gendisk *disk);
> +void ledtrig_blk_disable(struct gendisk *disk);
>  int ledtrig_blk_register(struct gendisk *disk);
>  void ledtrig_blk_unregister(struct gendisk *disk);
>  
> @@ -533,6 +536,14 @@ void ledtrig_blk_unregister(struct gendisk *disk);
>  struct ledtrig_blk {
>  };
>  
> +static inline void ledtrig_blk_enable(struct gendisk *disk)
> +{
> +}
> +
> +static inline void ledtrig_blk_disable(struct gendisk *disk)
> +{
> +}
> +
>  static inline int ledtrig_blk_register(struct gendisk *disk)
>  {
>  	return 0;
> 

