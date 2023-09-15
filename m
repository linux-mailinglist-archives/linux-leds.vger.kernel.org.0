Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2315B7A285F
	for <lists+linux-leds@lfdr.de>; Fri, 15 Sep 2023 22:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237176AbjIOUpk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Sep 2023 16:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237409AbjIOUpb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Sep 2023 16:45:31 -0400
Received: from omta34.uswest2.a.cloudfilter.net (omta34.uswest2.a.cloudfilter.net [35.89.44.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B3C18D
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 13:45:26 -0700 (PDT)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
        by cmsmtp with ESMTP
        id h8ddq86zTOzKlhFgsqIG3a; Fri, 15 Sep 2023 20:45:26 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id hFgrqTeXMyBEYhFgrqjzgF; Fri, 15 Sep 2023 20:45:26 +0000
X-Authority-Analysis: v=2.4 cv=durItns4 c=1 sm=1 tr=0 ts=6504c266
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MA4H35qh6lYlZPQOlfYWrqAGf0jtq6s2qOAZzdZ8E4s=; b=MmmAQqoYdzA5QtdR1xE3ulDS/G
        YV5HS1XybwAUsqBXYpQq0a3YIYjM498AB0dCcJvoFjfM27ui9IkR+FREB5KXRoTgSNZdjQKakgkED
        eg3JX564A7q7PMlLH9h8nqpVeppfktdd5KR61uVOSj9qKTSiUcuuzFWm2hq3kYLGY/ThpBp6bvHWF
        FvIAM4pScNjLrFqmuhL+vDPT4EAm9U5XxAhGFxQickjoNoYiSLwCPJY3cEqB9S9WIHoScmYUg+SzW
        UhqR0A5mSMn7vV5JydjfDmIuY+E7/ZgZ/r7LoDJ+VducGwhslDJa/INiHVkJIFzBCoUuWNo/4Xz3l
        o2lm7onA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:38116 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qhFgq-002Zr1-1m;
        Fri, 15 Sep 2023 15:45:24 -0500
Message-ID: <0030c52a-3a63-3405-cbfb-b3d16cb6c502@embeddedor.com>
Date:   Fri, 15 Sep 2023 14:46:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] leds: aw200xx: Annotate struct aw200xx with __counted_by
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230915200938.never.767-kees@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200938.never.767-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFgq-002Zr1-1m
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:38116
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 189
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOtKsBRkooQyEHmSUvc6SxMCdX3skZH/q24WMaZK9IhPa23q0o/37FaT3n+pTKjW/TMBog3Sf/+WgQXPZMABL2Jqbc5qbpN1YYEFkvcfVOIM7+Kz7yJz
 DJFEz5sRp4fCkBuTTAJIdzwkgTaznCZWkVU9U6T5efHein48pl0PVwdKC2ZUVJ8a/dRRGW9zj1VCXbM63EZ/6g8Te6g9WE5ykw7R43qX3LDBq8LUKYvrzDHm
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 9/15/23 14:09, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct aw200xx.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/leds/leds-aw200xx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
> index 691a743cc9b0..4d517cace3e7 100644
> --- a/drivers/leds/leds-aw200xx.c
> +++ b/drivers/leds/leds-aw200xx.c
> @@ -112,7 +112,7 @@ struct aw200xx {
>   	struct mutex mutex;
>   	u32 num_leds;
>   	u32 display_rows;
> -	struct aw200xx_led leds[];
> +	struct aw200xx_led leds[] __counted_by(num_leds);
>   };
>   
>   static ssize_t dim_show(struct device *dev, struct device_attribute *devattr,
