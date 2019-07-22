Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41DB46FB8A
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 10:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfGVIn0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 04:43:26 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:39071 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbfGVInZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 04:43:25 -0400
Received: from [192.168.1.110] ([77.2.59.209]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N1fei-1iZipz0WpE-0123bs; Mon, 22 Jul 2019 10:43:19 +0200
Subject: Re: [PATCH] leds: ktd2692: Fix a typo in the name of a constant
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <578003f3-d4a6-1788-b819-166e4203744f@metux.net>
Date:   Mon, 22 Jul 2019 10:43:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190721210539.25669-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Fc6XiBlR0wgG0vzMRIlPu3KKCnfDzOs3R7oNh3F/j8qA2YUTDzl
 rXNj5GMUKeXGA79BCbOv8YBvTIEz5dVtHug15GpIwfI/+WxiaA/lyjOXxw8VtFEjWTHfReL
 +FSp28ZBMRy+u+Z9aTnk9npnup/JDP/n6mtO98ZmKDZrFcHodmuAYMdb/MIvYlXOLZb1Ocn
 cLDM8YZ8fvjdpFR598VnA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:1CNsv0lf3/U=:g8QA9yuFimiZoPf+nOWzjJ
 AgjNWzKsfNfVx+TNv+toR4W40Fqh5krjJ6F5hglK/SjvnExWAt/K6BnAupJjha/pnxsUJ977B
 i3ZIM8AaVLyj/aOuYY318vWh9s+UobO9CVtH+WESzXWnO2WL799EzUYVfeeOC2RrhyhvisugH
 GVX7FN48oXe5emDOBWUrjIso6a0Y3wntqRrT1WDJLTwzVoQKUpH2NwEsSACM+BDY9mhPJssni
 LRTIiAvqXTsLln1ZfwfY/tC85Qx1CngDy9Y8WIQiAmFdbN+Pk4DdwSy+GMwi6j/ZWo6aKY7zK
 HMYuQBNa0PCxW3SuCJvccYjdzArtKz70TXs+h7KYUPHk+pyIKXB4v9ZtifgWxCWXFJ/PJYeks
 NRarzB3htAtCLtyxwzq+v34tbWp2jj/JMnU45HMi7xQj5bpcg2zwVYW+2NbK3PMI+KBIisRJ9
 vb5I1BAIqEYK/kxkCsT/48or/0L0wUkqdwVYhZg6VmCtm+gby4iFfnuW5NOrqVQUnQVNoNvA2
 5CTKWAFChH4O/+PD3L6kjUHs2JKcRl+1MNIwkCK8ZqruJf+hM6Ltehfg97Kd9q0p876UpEUmq
 xuaUqrSZh/pnu2w/VUb/1HfeXtiSnCXLd0grmvStC0KGg0SgRGoaX9s7veXHMswmsb9PR9wUB
 J9Wqy0lF6gcaN8IUwcuS1BXEbcYd6f5qjOKY7/ioOTD0ldl/iCoHr7CT54LxyesblI9MNksZD
 cL2HV7/X0sxENu1+5TG1XLUV7IqdPhev4+2f+f/3Q7mqXM21OTJIb4tyjak=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 21.07.19 23:05, Christophe JAILLET wrote:
> There is a typo in KTD2962_MM_MIN_CURR_THRESHOLD_SCALE. 6 and 9 are
> switched in 2962.
> 
> Define and use KTD2692_MM_MIN_CURR_THRESHOLD_SCALE instead.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/leds/leds-ktd2692.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-ktd2692.c b/drivers/leds/leds-ktd2692.c
> index 45296aaca9da..44db748c570e 100644
> --- a/drivers/leds/leds-ktd2692.c
> +++ b/drivers/leds/leds-ktd2692.c
> @@ -22,7 +22,7 @@
>   /* Value related the movie mode */
>   #define KTD2692_MOVIE_MODE_CURRENT_LEVELS	16
>   #define KTD2692_MM_TO_FL_RATIO(x)		((x) / 3)
> -#define KTD2962_MM_MIN_CURR_THRESHOLD_SCALE	8
> +#define KTD2692_MM_MIN_CURR_THRESHOLD_SCALE	8
>   
>   /* Value related the flash mode */
>   #define KTD2692_FLASH_MODE_TIMEOUT_LEVELS	8
> @@ -253,7 +253,7 @@ static void ktd2692_setup(struct ktd2692_context *led)
>   	ktd2692_expresswire_reset(led);
>   	gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
>   
> -	ktd2692_expresswire_write(led, (KTD2962_MM_MIN_CURR_THRESHOLD_SCALE - 1)
> +	ktd2692_expresswire_write(led, (KTD2692_MM_MIN_CURR_THRESHOLD_SCALE - 1)
>   				 | KTD2692_REG_MM_MIN_CURR_THRESHOLD_BASE);
>   	ktd2692_expresswire_write(led, KTD2692_FLASH_MODE_CURR_PERCENT(45)
>   				 | KTD2692_REG_FLASH_CURRENT_BASE);
> 

Reviewed-By: Enrico Weigelt <info@metux.net>

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
