Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CBF3B70EC
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jun 2021 12:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhF2KuC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Jun 2021 06:50:02 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:50421 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbhF2KuB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Jun 2021 06:50:01 -0400
Received: from [192.168.1.155] ([95.114.16.105]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MfHMj-1lHwdv3YsN-00glWJ; Tue, 29 Jun 2021 12:47:28 +0200
Subject: Re: [PATCH] leds: remove ide-disk trigger
To:     Corentin Labbe <clabbe@baylibre.com>, pavel@ucw.cz,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
References: <20210628191719.2823947-1-clabbe@baylibre.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <1153e311-e0cf-d869-e3f8-b679eb2e60de@metux.net>
Date:   Tue, 29 Jun 2021 12:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628191719.2823947-1-clabbe@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6vQ2Xfy8TKXEaEWXevy9tkuDioKXIKBHq1uW40xyBrykVOS1MSg
 R8MnogpqjdqqkK33FfSabJ+eFluTpXZ5W6pOUTuDU70Zu8k1SHa7TprBrlXJW81cdlGAld/
 NFKzpaXrgq3tHOMNhG15dtqM0pjUQY72/gULyZQpN/uXUk3MDOscTYdjjRGh/JUEE8CZS/W
 KH8UqhJPKigddOdxG0GFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xYLlKKk3dwM=:o1KHUE8P22pH6kHb+zqy/e
 NTr6jwvqjkCQ5sos6tlcx5muJMSf/P0+FN/Q2ao2seWZzFeK1kxuAlaUPrkHFsU3Pso6xNoT9
 S2gAB5oDnSfI95JpD2PH27xotp16a4JOad/+0piwcmus1ibvgWSWIEnlG5SCqsc2eLOiU0njX
 W+FxgAzj47kF5XlRnICxeEhhMKDbrpQz+i4oqmBSNzGCtgUAC1HQlQU6QP4v0bMom9O92qE82
 iJNQ+K8I8l9AQJTRar6MYsTr9Yt7YyUHH+oF1qcfNLguejvxtNhSIyWT5RVNKIoD12mMuA/Sw
 PdnzSDYiu5rvcxSDRQI1oNnpY8aORoNeEtufjxWJIwIab86rJW0QYliq4JMo0Oauupd8az+lY
 W1iQdTjyAONYRtbmrGZ1ADyaSK0RfuQX/pa5xoPK5S/gIklMEaB/PxLBO8aBg92L0sU+/rFhz
 zzAO2bJTde/fRohnC9yIcihD6r4TTFN1CfTdjcsd+kyMAHp4M6aVAu8hDny8sz2jWNBkv6A2N
 in2oTbj1YKTOHOpdTRFzg4=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 28.06.21 21:17, Corentin Labbe wrote:

> diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
> index 0741910785bb..38a5c21c0466 100644
> --- a/drivers/leds/trigger/ledtrig-disk.c
> +++ b/drivers/leds/trigger/ledtrig-disk.c
> @@ -40,7 +40,6 @@ static int __init ledtrig_disk_init(void)
>   	led_trigger_register_simple("disk-activity", &ledtrig_disk);
>   	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
>   	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
> -	led_trigger_register_simple("ide-disk", &ledtrig_ide);
>   
>   	return 0;
>   }

Shouldn't this line also be removed ?

   DEFINE_LED_TRIGGER(ledtrig_ide);


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
